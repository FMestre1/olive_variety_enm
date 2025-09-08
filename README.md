## Effect of Climate Change on Olive Varieties in Portugal ##

A collection of R scripts and datasets focused on modeling and projecting how climate change may impact olive cultivar suitability and distribution across Portugal.

---

##  Overview

This repository contains scripts and used to:

- Calibrate species distribution models (SDMs) for olive varieties.
- Project variety suitability under current and future climate scenarios, including projections for 2050.
- Analyse and visualize model outputs, including response curves and selected variable importance.

---

## Repository Structure

```
├── LICENSE # GPL-3.0 open source license
├── README.md # Project overview, usage instructions
├── script_0_load_vars.R # Initialization: load variables and data
├── script_1_calibration.R # Model calibration procedures
├── script_2_projection_vars.R # Prepare variable layers for projection
├── script_3_model_projection.R # Apply model to predict suitability
├── script_4_model_projection_2050.R # Future projections (year ~2050)
├── script_5_post_modelling.R # Post-processing: evaluation, thresholds, etc.
├── script_6_response_curves.R # Generate response curves per predictor

```
