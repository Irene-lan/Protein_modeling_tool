# Blue native-PAGE protocol for thiolase–RIAD and Hbd1–RIDD

Revised 16 October 2026. Replaces the earlier conventional Tris–glycine native-PAGE method.

**Purpose:** screen purified thiolase–RIAD and Hbd1–RIDD for formation of assemblies. This is a starting assay for these constructs, not a validated measurement of their stoichiometry or binding affinity.

**Selected setup:** NativePAGE Bis-Tris 3–12% precast gradient gel, 1 mm, 10 wells; XCell SureLock Mini-Cell; detergent-free samples; light-blue cathode buffer; cooled electrophoresis. Use the cassette-compatible apparatus. A different tank requires its own filling and electrical guidance.

The gel-preparation section now uses a precast gradient. The former hand-cast 4% stacking/6% resolving Tris–glycine recipes are superseded. Adding Coomassie to that old recipe does not reproduce this Bis-Tris system. NativePAGE gels and NuPAGE Bis-Tris SDS gels are different products.

## 1. Main changes

| Item | Previous method | Revised blue native-PAGE method |
|---|---|---|
| Gel | Hand-cast Tris–glycine, 4% stack/6% resolve | NativePAGE Bis-Tris gradient, 3–12% initially |
| Charge during separation | Predominantly intrinsic protein charge at the running pH | Bound Coomassie G-250 supplies additional negative charge |
| Buffers | Same Tris–glycine buffer in both chambers | Bis-Tris/tricine; G-250 only in the cathode working buffer |
| Sample buffer | Tris/glycerol/bromophenol blue | NativePAGE sample buffer diluted to 1× |
| Electrical program | Trial 70 V then 100 V | System-specific cold program below |
| Interpretation | Charge, size and shape strongly affect migration | More useful for apparent native mass; dye binding and shape still matter |
| Protein detection | Post-run staining | Post-run staining still needed for sensitive detection |

The electric field acting on net charge drives migration in both methods. **pI is not itself a driving force.** In blue native-PAGE, pI has less influence because dye contributes charge; this does not make migration dependent only on molecular weight. [3,4]

## 2. Prepare buffers

Use deionized water. Concentrations of dyes below are weight/volume. Use **Coomassie Brilliant Blue G-250** during electrophoresis, not an acidic methanol-based staining solution.

### Stock solutions [1]

| Stock | Preparation |
|---|---|
| 20× running buffer, 100 mL | Dissolve 20.92 g Bis-Tris and 17.92 g tricine; bring to 100 mL. No pH adjustment in the published recipe. |
| 0.4% cathode additive, 100 mL | Dissolve 0.400 g G-250; bring to 100 mL. |
| 4× sample buffer, 10 mL | 0.418 g Bis-Tris, 0.117 g NaCl, 4.00 g glycerol, 0.400 mg Ponceau S; approximately 107 µL 6 M HCl; water to 10 mL, pH 7.2. |

For easier Ponceau measurement, replace the powder with 400 µL of a 0.1% aqueous stock, counting this volume toward the final 10 mL. Confirm sample-buffer pH before final volume adjustment. Glycerol here is **40% w/v in the 4× stock**, not 40% v/v.

At 1×, running buffer contains 50 mM Bis-Tris/50 mM tricine, nominal pH 6.8; the system's operating pH is about 7.5. At 1×, sample buffer contributes 50 mM Bis-Tris, 50 mM NaCl, 10% w/v glycerol and 0.001% Ponceau S. [1]

### Working buffers [2]

| Reagent | Anode, 1 L | Light-blue cathode, 200 mL | Optional dark-blue cathode, 200 mL |
|---|---:|---:|---:|
| 20× running stock | 50 mL | 10 mL | 10 mL |
| 0.4% G-250 additive | — | 1 mL | 10 mL |
| Water | 950 mL | 189 mL | 180 mL |
| Final G-250 | 0 | 0.002% | 0.02% |

Prepare fresh working solutions and prechill. Store commercial reagents as labeled. Label homemade stocks with composition and preparation date; inspect for precipitation or contamination before use.

**Starting choice for these soluble enzymes:** light-blue cathode buffer throughout. Detergent-free samples can use this route without adding G-250 directly to the sample. Dark-blue buffer is an alternative, not an automatic extra step. [1]

If your actual protein preparation contains detergent, reconsider the sample recipe: the manufacturer's starting G-250 concentration in the loaded sample is one-quarter of the detergent concentration, expressed in the same percentage units. For example, 1% final detergent corresponds to 0.25% final G-250. This is not the cathode concentration. [2]

## 3. Prepare proteins and controls

Retain the established assembly buffer and incubation if they already work. Prepare the individual proteins and mixtures with the same handling, final volume and buffer composition. For an initial exploratory incubation only, use 20–30 minutes at room temperature, then cool and load promptly; this is not an established optimum for RIAD/RIDD on these enzymes.

Do not introduce detergent solely because this is blue native-PAGE. Avoid unnecessary dilution, which may change complex occupancy. Reduce imidazole and excess salt carryover by buffer exchange if they impair the run, while checking that the proteins remain soluble. The loading buffer already contributes 50 mM NaCl; salt from the protein stock is additional. Record the actual final salt concentration rather than describing this mixture as “below 50 mM.”

For the first nonreducing screen, omit SDS, urea, DTT, TCEP and beta-mercaptoethanol; do not heat. Record any reductant carried over from protein storage. Omitting fresh reductant does not remove an existing one. Cysteines alone do not establish that disulfide bonds have formed. Avoid adding oxidants or crosslinkers as an undocumented sample-preparation step.

**Example 20 µL loading mixture:** protein/assembly solution up to 15 µL + 5 µL 4× NativePAGE sample buffer + water to 20 µL. Add loading buffer after the assembly incubation. Mix gently, collect liquid with a brief pulse spin, and load promptly. For this detergent-free starting condition, add no sample G-250. [2]

Use approximately **0.5–1 µg total purified protein per lane** as an initial loading trial. This deliberately reduces the earlier 2–5 µg suggestion because one purified complex can concentrate most of the lane mass into a single band. If necessary, adjust loading or detection sensitivity after the first gel. Include a half-load lane to reveal overload artifacts; do not silently remove precipitated material if aggregation is part of the question.

| Lane | Suggested sample |
|---|---|
| 1 | Native protein mass standard suitable for BN-PAGE |
| 2 | Thiolase–RIAD alone |
| 3 | Hbd1–RIDD alone |
| 4 | Thiolase–RIAD:Hbd1–RIDD, 1:1 molar ratio |
| 5 | Same, 1:2 |
| 6 | Same, 1:4 |
| 7 | Untagged or binding-defective control mixture, if available |
| 8 | Half-load of the 1:2 sample |
| 9 | Duplicate 1:2 sample for band identification |
| 10 | Sample-buffer blank |

Ratios refer to fusion-polypeptide molecules, not protein mass or counts of pre-existing oligomers. Hold thiolase amount constant across the ratio series and increase Hbd1; consequently total protein mass changes. Match individual-protein control amounts to those present in the main mixture. A tag-level 1:2 interaction does not by itself establish whole-enzyme assembly stoichiometry.

## 4. Prepare the gel and run

Use the 3–12% gradient for the first broad assembly screen. If smaller species are insufficiently resolved, compare a 4–16% NativePAGE gradient in a subsequent run. This is an experimental choice, not a predicted optimum.

1. Remove the cassette bottom seal and comb; rinse and fill wells with cathode buffer. Mount the cassette and required buffer dam. Remove bubbles and check seals.
2. Load samples and standard. Fill unused wells with sample-buffer blank.
3. Fill the upper negative chamber with approximately 200 mL cathode buffer and lower positive chamber with approximately 600 mL anode buffer, following the tank fill marks. [1,2]
4. Run using the cold program below; monitor the dye front and buffer temperature. Record current and any warming. [1]

| Stage | Constant voltage | Time |
|---|---:|---|
| Initial, at 4°C | 150 V | 60 minutes |
| Continue, at 4°C | 250 V | Approximately 30–90 minutes, following migration |

Stop before the front leaves the gel; use the first result to set later endpoints. Do not increase voltage if cooling is inadequate. These values apply to the named commercial system and must not be transferred to the previous hand-cast gel. Switch off and disconnect before opening the tank or changing buffer.

If beginning with dark-blue buffer for detergent-containing samples destined for blotting/second-dimension analysis, change the upper buffer to light-blue when the front is about one-third down the gel. **No exchange is needed for the selected light-blue-from-start route.** [1,2]

## 5. Stain and image

Reserve the duplicate lane for subsequent identification before solvent fixation. For endpoint imaging, the previous laboratory R-250 staining procedure can be retained: gently rock the gel in 30–50 mL of 0.1% R-250/40% methanol/10% acetic acid for 30–60 minutes, then destain with several changes of 10% methanol/10% acetic acid until contrast is adequate. These solvent percentages are volume/volume.

The electrophoresis dye does not ensure that all proteins are visible immediately. Treat the staining duration as an initial condition and extend destaining if the background remains blue. Alternatively, follow a commercial colloidal Coomassie stain's BN-PAGE instructions. Fixing/staining destroys the native state, so use a separate unfixed lane or gel for activity measurements.

Image the complete gel, including material near the wells. Use identical imaging settings for comparisons and avoid saturated bands. Retain both the uncropped image and the lane map.

## 6. How to analyze the result

### What changes relative to the previous gel?

Blue native-PAGE makes mass estimation more practical, but reports **apparent native mass**. Calibrate with native standards on the same gel. Use migration distances and a local fit of log10(marker mass) against distance around the unknown; inspect the fit and avoid extrapolation beyond the markers. Do not use an SDS-PAGE ladder or assume one global straight line fits an entire gradient. Different proteins can bind different amounts of dye and differ in shape. [3]

For these flexible, tagged enzymes, a mass inconsistent with a simple sum could reflect conformation, dye binding, another oligomer, or heterogeneous assembly. Do not assign exact stoichiometry from one band. Nor should a shift between the old clear gel and the new blue gel be interpreted as a size change: pH, gel gradient and charge chemistry all changed.

| Observation | Interpretation | Useful next step |
|---|---|---|
| Mixture develops a discrete slower band while free-component bands decline | Supports assembly; does not identify its composition | Identify both fusion proteins in the candidate band |
| Each individual protein already has several bands | Possible homooligomers, conformers or artifacts | Establish each individual pattern before naming heterocomplexes |
| Sample enters BN-PAGE but stayed near the well in the clear gel | Improved charge-driven entry is one explanation | Do not conclude that the protein became smaller |
| High bands or well-retained material | Large assemblies or aggregates; not automatically desired binding | Compare half-load, solubility and a solution-based size measurement |
| Smear | Heterogeneity, dissociation, aggregation or sample-buffer/loading problems | Compare loading and buffer-matched controls |
| No new mixture band | No detectable stable species under these assay conditions | Check concentrations and binding with a complementary method |
| Different patterns in clear and blue gels | Could reflect charge chemistry or perturbation of the assembly | Compare the same sample aliquots; investigate dye sensitivity |

These are hypotheses to test, not unique diagnoses. Native-gel artifacts have been documented even for purified proteins with independently measured oligomerization behavior. [4]

### Confirm composition, connectivity and function separately

- **Composition:** analyze the candidate band by second-dimension SDS-PAGE, protein-specific immunodetection, or mass spectrometry. Detecting both enzymes supports co-migration, but accidental overlap remains possible. Include individual-protein and binding-defective controls. [6]
- **Disulfide connectivity:** compare separate nonreducing and reducing SDS-PAGE aliquots. A reduction-sensitive species supports disulfide linkage. Noncovalent RIAD/RIDD binding is usually disrupted by SDS, so the SDS result does not measure the intact noncovalent assembly.
- **Native mass:** if exact oligomer assignment matters, use a solution method such as size-exclusion chromatography with multi-angle light scattering, where compatible with the sample.
- **Function:** measure thiolase/Hbd1 activity in a separate assay. A band shift does not establish catalytic activity or substrate channeling.

Coomassie exposure and electrophoresis can perturb fragile assemblies or interfere with some activity/fluorescence assays. This has been observed in other protein systems; whether it affects your RIAD/RIDD constructs requires a direct comparison. Failure to retain a complex in BN-PAGE does not prove the proteins never interacted in solution. [5]

For densitometry, subtract local background and use unsaturated bands. Band intensity is not a direct molecule count: different proteins/assemblies can stain differently. Treat changes across matched preparations as semiquantitative unless staining response and recovery have been calibrated. Do not calculate binding affinity or a precise bound fraction from an unvalidated single endpoint gel.

**Suggested reporting language:** “Mixing thiolase–RIAD and Hbd1–RIDD produced an additional BN-PAGE band with an apparent native mass of approximately ___ kDa. Identification of ___ in this band supports ___. Exact assembly stoichiometry remains unassigned.” Fill only with observed results.

## References and method provenance

[1] Thermo Fisher Scientific. NativePAGE Novex Bis-Tris Gel System User Guide, MAN0000557. Buffer formulations, cathode choice, cold running program and apparatus.
https://documents.thermofisher.com/TFS-Assets/LSG/manuals/nativepage_man.pdf

[2] Thermo Fisher Scientific. NativePAGE Bis-Tris Gels Protocol, MAN0007893, Rev. A.0. Working-buffer dilutions, sample preparation and gel setup.
https://www.thermofisher.com/TFS-Assets/LSG/manuals/MAN0007893_NativePAGE_BisTris_Gels.pdf

[3] Wittig et al. Mass estimation of native proteins by blue native electrophoresis: principles and practical hints. Molecular & Cellular Proteomics (2010). DOI: 10.1074/mcp.M900526-MCP200.
https://pmc.ncbi.nlm.nih.gov/articles/PMC2953912/

[4] Braz et al. Separation of protein oligomers by blue native gel electrophoresis. Analytical Biochemistry (2009). DOI: 10.1016/j.ab.2009.02.019.
https://pmc.ncbi.nlm.nih.gov/articles/PMC2898288/

[5] High resolution clear native electrophoresis is a good alternative to blue native electrophoresis for the characterization of the Escherichia coli membrane complexes. Journal of Microbiological Methods (2014), PMID: 24845470.
https://pubmed.ncbi.nlm.nih.gov/24845470/

[6] Peng et al. A Blue Native-PAGE analysis of membrane protein complexes in Clostridium thermocellum. BMC Microbiology (2011), 11:22.
https://link.springer.com/article/10.1186/1471-2180-11-22

The gel-gradient choice, purified-protein loading trial, lane plan, exploratory incubation and project-specific interpretation are proposed adaptations. The R-250 endpoint stain is retained from the previous protocol. Manufacturer conditions do not by themselves validate this assay for the two fusion proteins.
