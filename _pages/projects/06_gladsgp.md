---
layout: single
title: "A Gaussian process subglacial drainage model emulator"
permalink: /projects/glads-gp/
---

For this project, we constructed a fast Gaussian process emulator of the GlaDS subglacial drainage model. We explore in-depth the various architectural and experimental choices and how these impact the accuracy of the emulator. Using the emulator, which makes predictions about 1000x faster than the physics-based model, we evaluate the model's sensitivity to eight parameters, highlighting that ~90% of the variance in model outputs is described by three of the parameters. Read the [preprint](https://doi.org/10.22541/essoar.172736254.41350153/v2) for more!

![](/assets/images/projects/06_gladsgp/test_error_timeseries.png)

![](/assets/images/projects/06_gladsgp/sensitivity_indices_fw.png)

## Citation

Hill, T., Bingham, D., Flowers, G. E., Hoffman, M. J. (2024). Computationally Efficient Subglacial Drainage Modeling Using Gaussian Process Emulators: GlaDS-GP v1.0. *Geoscientific Model Development*, 18, 4045-4074 [https://doi.org/10.5194/gmd-18-4045-2025](https://doi.org/10.5194/gmd-18-4045-2025)
