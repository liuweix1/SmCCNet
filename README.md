# SmCCNet

## Authors


**Weixuan Liu (Developer)** 
- **Email:** weixuan.liu@cuanschutz.edu  
- **Affiliation:** University of Colorado Anschutz Medical Campus/Department of Biostatistics and Informatics  
- **GitHub:** [liuweix1](https://github.com/liuweix1/)  

**author 1 Name**  
- **Email:** developer1.email@example.com  
- **Affiliation:** Institution/Company Name  
- **GitHub:** [developer1-github-username](https://github.com/developer1-github-username)  


**author 2 Name**  
- **Email:** developer1.email@example.com  
- **Affiliation:** Institution/Company Name  
- **GitHub:** [developer1-github-username](https://github.com/developer1-github-username)  

**author 3 Name**  
- **Email:** developer1.email@example.com  
- **Affiliation:** Institution/Company Name  
- **GitHub:** [developer1-github-username](https://github.com/developer1-github-username)

**author 4 Name**  
- **Email:** developer1.email@example.com  
- **Affiliation:** Institution/Company Name  
- **GitHub:** [developer1-github-username](https://github.com/developer1-github-username)

**author 5 Name**  
- **Email:** developer1.email@example.com  
- **Affiliation:** Institution/Company Name  
- **GitHub:** [developer1-github-username](https://github.com/developer1-github-username)  

## Description

SmCCNet is a canonical correlation analysis-based method for discovering (quantitative) trait-specific multi-omics networks. The method allows the integration of multiple data types and a quantitative phenotypic trait. It incorporates a feature subsampling scheme to improve the robustness of the canonical weights. 

To install and use the package, you may download the directory or follow the instructions below.
```{r, install-and-example}
# Install package
if (!require("devtools")) install.packages("devtools")
devtools::install_github("liuweix1/SmCCNet")

# Load package
library(SmCCNet)
```

In the latest update, most of the functions from the original SmCCNet package are retired. The new package has these new features:

- Developed an end-to-end fast pipeline called fast automated SmCCNet that streamlines the complete pipeline process: users supply multi-omics data and phenotype, the algorithm will output subnetworks directly.
- Generalized multi-omics SmCCNet with quantitative phenotype to incorporate more than 2 omics data.
- Developed multi-omics SmCCNet with binary phenotype based on a hybrid approach of Sparse multiple Canonical Correlation Analysis (SmCCA), and Partial Least Squared Discriminant Analysis.
- Modified SmCCNet algorithm so that it can work with single-omics data with either quantitative or binary phenotype.
- Developed a novel network pruning algorithm based on network summarization score.
- Incorporated the NetSHy summarization score method into the package.
- Developed a novel way for SmCCNet to select the optimal scaling factors.
- Incorporate novel metrics for evaluation of both quantitative phenotype and binary phenotype.


In the **vignettes** folder, users can find a documentation that illustrates how to implement SmCCNet with an example data set. The data file is included under the **data** folder. Details on all the functions included in the package are documented in the package manual under the **package** folder. Users may directly download the package tarball for all functions and example data, which is also under the **package** folder.

## References

1. **Shi, W. Jenny, et al.** "Unsupervised discovery of phenotype-specific multi-omics networks." *Bioinformatics* 35.21 (2019): 4336-4343.

2. **Vu, Thao, et al.** "NetSHy: network summarization via a hybrid approach leveraging topological properties." *Bioinformatics* 39.1 (2023





