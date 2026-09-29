#!/bin/bash
#SBATCH --partition=general-cpu
#SBATCH --account=engr-lab-joshua.yuan
#SBATCH --job-name=reduce_clean
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --time=02:00:00
#SBATCH --output=reduce_clean_%j.out
#SBATCH --error=reduce_clean_%j.err

set -uo pipefail

VINA_ENV=/engrfs/project/joshua.yuan/conda/haina.l/micromamba/envs/vina
REDUCE_BIN=${VINA_ENV}/bin/reduce

# Submit the script from the directory containing the input PDB files.
WORK_DIR=${SLURM_SUBMIT_DIR:-$PWD}
OUTPUT_DIR=${WORK_DIR}/clean_pdb
LOG_DIR=${OUTPUT_DIR}/reduce_logs

export PATH="${VINA_ENV}/bin:${PATH}"

if [[ ! -x "${REDUCE_BIN}" ]]; then
    echo "ERROR: Reduce was not found at ${REDUCE_BIN}" >&2
    exit 1
fi

cd "${WORK_DIR}" || exit 1
mkdir -p "${OUTPUT_DIR}" "${LOG_DIR}"

shopt -s nullglob
input_files=(fold_*_model_0.pdb)

if (( ${#input_files[@]} == 0 )); then
    echo "ERROR: No files matching fold_*_model_0.pdb were found in:" >&2
    echo "       ${WORK_DIR}" >&2
    exit 1
fi

echo "Job ID: ${SLURM_JOB_ID:-not_available}"
echo "Node: $(hostname)"
echo "Working directory: ${WORK_DIR}"
echo "Output directory: ${OUTPUT_DIR}"
echo "Input files found: ${#input_files[@]}"
echo "Start time: $(date)"

success_count=0
failure_count=0
skipped_count=0

for input_pdb in "${input_files[@]}"; do
    base_name=${input_pdb%.pdb}
    output_pdb=${OUTPUT_DIR}/${base_name}_clean.pdb
    temporary_pdb=${output_pdb}.tmp
    reduce_log=${LOG_DIR}/${base_name}_reduce.log

    if [[ -s "${output_pdb}" ]]; then
        echo "SKIP: ${output_pdb} already exists"
        skipped_count=$((skipped_count + 1))
        continue
    fi

    echo "PROCESS: ${input_pdb}"

    # Some Reduce builds return a nonzero status even after producing a valid
    # hydrogenated PDB. Therefore, validate the output file instead of using
    # the exit status alone.
    "${REDUCE_BIN}" -FLIP "${input_pdb}" \
        > "${temporary_pdb}" \
        2> "${reduce_log}"
    reduce_status=$?

    hydrogen_count=$(awk '
        /^(ATOM  |HETATM)/ {
            atom_name = substr($0, 13, 4)
            gsub(/[[:space:]]/, "", atom_name)
            if (atom_name ~ /^[0-9]*H/) hydrogen_atoms++
        }
        END { print hydrogen_atoms + 0 }
    ' "${temporary_pdb}")

    if [[ -s "${temporary_pdb}" ]] \
        && grep -qE '^(ATOM  |HETATM)' "${temporary_pdb}" \
        && (( hydrogen_count > 0 )); then

        mv "${temporary_pdb}" "${output_pdb}"
        echo "DONE: ${output_pdb} (${hydrogen_count} hydrogen atoms; Reduce status ${reduce_status})"
        success_count=$((success_count + 1))
    else
        echo "ERROR: No valid hydrogenated PDB was produced for ${input_pdb}" >&2
        echo "       Reduce status: ${reduce_status}" >&2
        echo "       See: ${reduce_log}" >&2
        rm -f "${temporary_pdb}"
        failure_count=$((failure_count + 1))
    fi
done

echo "Finish time: $(date)"
echo "Successful: ${success_count}"
echo "Skipped: ${skipped_count}"
echo "Failed: ${failure_count}"

if (( failure_count > 0 )); then
    exit 1
fi
