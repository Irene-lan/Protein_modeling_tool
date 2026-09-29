#!/bin/bash
#SBATCH --partition=general-gpu
#SBATCH --account=engr-lab-joshua.yuan
#SBATCH --gres=shard:a6000:1
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=08:00:00
#SBATCH --job-name=GNINA_AF3_cellobiose
#SBATCH --output=GNINA_AF3_cellobiose_%j.out
#SBATCH --error=GNINA_AF3_cellobiose_%j.err

set -euo pipefail
shopt -s nullglob

BASE="/engrfs/project/joshua.yuan/Haina"
SIF="$BASE/software/containers/gnina.sif"
WORK="$BASE/projects/docking/AF3 structure clean/clean_pdb"
OUT="$WORK/AF3_GNINA_results_cellobiose"

LIGAND_NAME="Cellobiose"
LIGAND="$WORK/${LIGAND_NAME}.sdf"

mkdir -p "$OUT/logs"

echo "Job ID:           ${SLURM_JOB_ID:-not_set}"
echo "Compute node:     $(hostname)"
echo "CPUs allocated:   ${SLURM_CPUS_PER_TASK:-not_set}"
echo "CUDA devices:     ${CUDA_VISIBLE_DEVICES:-not_set}"
echo "Work directory:   $WORK"
echo "Output directory: $OUT"

command -v apptainer >/dev/null 2>&1 || {
    echo "ERROR: apptainer was not found on the compute node."
    exit 1
}

for REQUIRED_FILE in "$SIF" "$LIGAND"; do
    if [[ ! -s "$REQUIRED_FILE" ]]; then
        echo "ERROR: required file is missing or empty: $REQUIRED_FILE"
        exit 1
    fi
done

if ! nvidia-smi; then
    echo "ERROR: Slurm did not provide a usable NVIDIA GPU."
    exit 1
fi

echo "GNINA version:"
apptainer exec --nv \
    --bind "$BASE:$BASE" \
    "$SIF" gnina --version

PDB_FILES=("$WORK"/*_clean.pdb)

if (( ${#PDB_FILES[@]} == 0 )); then
    echo "ERROR: no *_clean.pdb files were found in: $WORK"
    exit 1
fi

SUCCESS=0
SKIPPED=0
FAILED=0

for PDB in "${PDB_FILES[@]}"; do
    M=$(basename "$PDB" .pdb)
    BOX="$WORK/autobox/${M}_site.pdb"
    RESULT="$OUT/${M}_${LIGAND_NAME}_exh32.sdf.gz"
    RUN_LOG="$OUT/logs/${M}_${LIGAND_NAME}.log"

    if [[ ! -s "$BOX" ]]; then
        echo "SKIP: box file is missing or empty: $BOX"
        ((SKIPPED += 1))
        continue
    fi

    # This allows a failed or timed-out batch job to be submitted again safely.
    if [[ -s "$RESULT" ]]; then
        echo "SKIP: result already exists: $RESULT"
        ((SKIPPED += 1))
        continue
    fi

    echo "RUN: $M with $LIGAND_NAME"

    if apptainer exec --nv \
        --bind "$BASE:$BASE" \
        "$SIF" gnina \
        --receptor "$PDB" \
        --ligand "$LIGAND" \
        --autobox_ligand "$BOX" \
        --seed 42 \
        --cpu "${SLURM_CPUS_PER_TASK:-4}" \
        --exhaustiveness 32 \
        --num_modes 9 \
        --out "$RESULT" \
        >"$RUN_LOG" 2>&1; then
        echo "OK: $RESULT"
        ((SUCCESS += 1))
    else
        echo "FAIL: $M; see $RUN_LOG"
        rm -f "$RESULT"
        ((FAILED += 1))
    fi
done

echo
echo "GNINA batch summary"
echo "Successful: $SUCCESS"
echo "Skipped:    $SKIPPED"
echo "Failed:     $FAILED"
echo "Results:    $OUT"

if (( FAILED > 0 )); then
    exit 1
fi
