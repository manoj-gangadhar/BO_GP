# Changelog

## Manoj's contributions (Nov 2025)
This PR collects my contributions for the BO-GP / TBL optimization code.

### 1. gpOpt.py – GP optimization and plotting
- Extended the GP post-processing and plotting routines to support nPar = 8.
- Replaced the hard-coded if/elif structure for parameter pair plotting with a systematic generation of pair indices and subplot locations (lower-triangular corner-plot style).
- Improved figure sizing and layout so that multi-parameter (6–8) GP surfaces remain readable in the plots.

### 2. inflow generator – wall==1 error fix
- Fixed a bug in the `inflow_gen.py` for the `wall == 1` case.
- Ensures that the inflow error metric is computed consistently for this boundary-condition setup.

### 3. Post-processing / BL calculation (blCalc)
- Generalized the pressure-gradient evaluation:
  - Old version only supported `dp/dx` at the geometric mid-height.
  - New version supports:
    - `dp/dx` at the lower wall,
    - `dp/dx` at mid-height,
    - `dp/ds` along the curved wall (aligned with the wall tangent).
  - Either of this method can be selected in `bl_calc` function of `main_post.py` by setting `dp_mode` to either of "midline", "wall_dx", or "wall_s". Where in "wall_s" is already valid for both flat and curved boundary walls.
- Implemented tangential shear-stress computation along the curved wall for use in the β-definition.
- Added a new comparison plot that simultaneously shows:
  - `dp/dx` at mid-height,
  - `dp/dx` at the lower wall,
  - `dp/ds` along the curved wall.

### 4. General
- Updated documentation/comments to indicate compatibility with OpenFOAM v10 and above.

These changes are intended to:
- make the GP plots robust for higher-dimensional optimization,
- correct the inflow error calculation for a specific wall configuration,
- and provide a more physically consistent and flexible BL-analysis pipeline for β evaluation.
