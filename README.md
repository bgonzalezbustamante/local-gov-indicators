# local-gov-indicators
**Data Set on Local Government Indicators in Chile**

[![Coverage](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/coverage_20.svg)](https://github.com/bgonzalezbustamante/local-gov-indicators/tree/main/data/tidy/cases) [![Version](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/v_0_21_15.svg)](CHANGELOG.md) [![Project Status: Suspended – Initial development has started, but there has not yet been a stable, usable release; work has been stopped for the time being but the author(s) intend on resuming work.](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/suspended.svg)](STATUS.md) [![DOI](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/doi.svg)](https://doi.org/10.5281/zenodo.7568387) [![License](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/gnu.svg)](LICENSE-GPL.md) [![License](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/cc_by_4_0.svg)](LICENSE-CC.md) [![License](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/lppl.svg)](LICENSE-LPPL.md) [![R](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/r_4_1_0.svg)](https://cran.r-project.org/) [![Latex](https://img.shields.io/badge/made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/) [![tDL](https://raw.githubusercontent.com/bgonzalezbustamante/local-gov-indicators/main/badges/tDL.svg)](https://training-datalab.com/)

## Overview

This repository contains a data set in progress (20%) on local government indicators in Chile between 2010 and 2021, featuring an e-government indicator (EGI) in 2016[^1], 2019 and 2021 in Comma-Separated Values `CSV` format with Unicode encoding `UTF-8`. Part of this data set has been used in the following articles:

- González-Bustamamante, B., & Aguilar, D. (2023, *forthcoming*). Territorial patterns of open e-government: Evidence from Chilean municipalities. *Political Research Exchange*.

## Data Pipeline and Coverage

### Pipeline

```mermaid
  graph TD;
      A[/Shapefiles<br/>IDE-Chile/] --> B[(Baseline<br/>Data Set)];
      B --> C[(Case-Level<br/>Data Sets)];
      D[\Municipalities<br/>Websites/] --> E[(EGI)];
      E[(EGI)] --> C;
      F[/CPLT/] --> G[(TA)];
      F[/CPLT/] --> H[(DAI)];
      F[/CPLT/] --> I[(FOIA)];
      G --> C;
      H --> C;
      I --> C;
      J[/OS-MDS/] --> K[(SAE)];
      K --> C;
      L[/SINIM/] --> C;
      M[/INE/] --> C;
      N[/SUBTEL/] --> C;
      C --> V[Validation];
      V --> C;
      C --> Z[(Case-Level<br/>Time-Series<br/>Data Set)];
```
### Coverage

|  | EGI | TA | DAI | SAE | SINIM | INE | SUBTEL |
|---|:---:|:---:|:---:|:---:|:---:|:---:|---|
| 2010 | :x: | :x: | :x: | :x: |  |  |  |
| 2011 | :x: | :x: | :x: | :white_check_mark: |  |  |  |
| 2012 | :x: | :white_check_mark: | :x: | :x: |  |  |  |
| 2013 | :x: | :white_check_mark: | :x: | :white_check_mark: |  |  |  |
| 2014 | :x: | :white_check_mark: | :white_check_mark: | :x: |  |  |  |
| 2015 | :x: | :white_check_mark: | :white_check_mark: | :white_check_mark: |  |  |  |
| 2016 | :white_check_mark: | :white_check_mark: | :white_check_mark: | :x: |  |  |  |
| 2017 | :x: | :white_check_mark: | :white_check_mark: | :white_check_mark: |  |  |  |
| 2018 | :x: | :x: | :white_check_mark: | :x: |  |  |  |
| 2019 | :white_check_mark: | :x: | :x: | :x: |  |  |  |
| 2020 | :x: | :x: | :x: | :white_check_mark: |  |  |  |
| 2021 | :white_check_mark: | :x: | :x: | :x: |  |  |  |

## Preservation

This data set is stored with version control on a GitHub repository. Furthermore, a Digital Object Identifier is provided by Zenodo.

## Storage and Backup

The GitHub repository has controlled access with Two-Factor Authentication `2FA` with two physical USB security devices (Bastián González-Bustamante, [ORCID iD 0000-0003-1510-6820](https://orcid.org/0000-0003-1510-6820)) and a mobile application (Diego Aguilar, [ORCID iD 0000-0003-4531-5922](https://orcid.org/0000-0003-4531-5922)). USB devices and the mobile application issue one-time passwords to generate a cryptographic authentication `FIDO2` and `U2F`.

Moreover, the repository is backed up on Hierarchical File Server `HFS` for recovery in case of incidents. This backup is located on the University of Oxford hub connected to `Code42` Cloud Backup encrypted with `256-bit AES`. The backup is performed with every change on GitHub and receives weekly light maintenance and a deep one every month. This backup will be secured until May 2024. An extension of this period will be evaluated on budget availability.

## Getting Started

### Software

We used `R v4.1.0 -- Camp Pontanezen`.

## License

The content of this project itself is licensed under a [Creative Commons Attribution 4.0 International license (CC BY 4.0)](LICENSE-CC.md), and the underlying code used to format and display that content is licensed under a [GNU GPLv3 license](LICENSE-GPL.md). In particular, the codebook will be compiled with XeLaTeX using a code licensed under an [LPPL v1.3c license](LICENSE-LPPL.md).

The above implies that the data sets may be shared, reused, and adapted as long as appropriate acknowledgement is given. In addition, the code may be shared, reused, and adapted as long as the source is disclosed, the changes are stated, and the same [GNU GPLv3 license](LICENSE-GPL.md) is used.

## Contribute

Contributions are entirely welcome. You just need to [open an issue](https://github.com/bgonzalezbustamante/local-gov-indicators/issues/new) with your comment or idea.

For more substantial contributions, please fork this repository and make changes. Pull requests are also welcome.

Please read our [code of conduct](CODE_OF_CONDUCT.md) first. Minor contributions will be acknowledged, and significant ones will be considered on our contributor roles taxonomy.

## Citation

González-Bustamante, B., & Aguilar, D. (2023). Data Set on Local Government Indicators in Chile (Version 0.21.15 -- Late Sky) [Data set, pre-release version]. University of Oxford, Universidad de Santiago de Chile (USACH) and Training Data Lab. DOI: [10.5281/zenodo.7568387](https://doi.org/10.5281/zenodo.7568387)

## Authors

Bastián González-Bustamante \
bastian.gonzalezbustamante@politics.ox.ac.uk \
[ORCID iD 0000-0003-1510-6820](https://orcid.org/0000-0003-1510-6820) \
https://bgonzalezbustamante.com

Diego Aguilar \
diego.aguilar@training-datalab.com \
[ORCID iD 0000-0003-4531-5922](https://orcid.org/0000-0003-4531-5922)

## CRediT - Contributor Roles Taxonomy

Bastián González-Bustamante ([ORCID iD 0000-0003-1510-6820](https://orcid.org/0000-0003-1510-6820)): Conceptualisation, data curation, formal analysis, funding acquisition, methodology, project administration, resources, software, supervision, and validation.

Diego Aguilar ([ORCID iD 0000-0003-4531-5922](https://orcid.org/0000-0003-4531-5922)): Conceptualisation, data curation, investigation, resources, and validation.

Berenice Orvenes ([OSF osf.io/37keu](https://osf.io/37keu/)): Investigation and resources.

Ariane Carvajal ([ORCID iD 0000-0002-6181-7458](https://orcid.org/0000-0002-6181-7458)): Investigation and resources.

Andrea González ([ORCID iD 0000-0002-6822-0056](https://orcid.org/0000-0002-6822-0056)): Investigation and resources.

Elinor Luco ([ORCID iD 0000-0003-3370-4322](https://orcid.org/0000-0003-3370-4322)): Investigation.

### Latest Revision

[March 17, 2023](CHANGELOG.md).

[^1]: Further details of the 2016 indicator in González-Bustamante, B., Carvajal, A., & González, A. (2020). Determinantes del gobierno electrónico en las municipalidades: Evidencia del caso chileno. *Gestión y Política Pública, XXIX*(1), 97-129. DOI: [10.29265/gypp.v29i1.658](http://dx.doi.org/10.29265/gypp.v29i1.658). See also González-Bustamante, B., Carvajal, A., & González, A. (2019). Local E-Government Index 2016 in Chile. DOI: [10.7910/DVN/CMU36B](https://doi.org/10.7910/DVN/CMU36B).
