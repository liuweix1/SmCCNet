% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SmCCNet-source.R
\name{networkPruning}
\alias{networkPruning}
\title{Extract Network Summarization Result from Sub-network}
\usage{
networkPruning(
  Abar,
  CorrMatrix,
  data,
  Pheno,
  type,
  ModuleIdx,
  min_mod_size,
  max_mod_size,
  damping = 0.9,
  method = "NetSHy",
  saving_dir
)
}
\arguments{
\item{Abar}{Adjacency matrix of size pxp extracted from the SmCCA step}

\item{CorrMatrix}{The correlation matrix calculaed based on X1, it should be
pxp as well}

\item{data}{the original protein data.}

\item{Pheno}{the original phenotype data}

\item{type}{A vector with length equal to total number of features in the adjacency matrix
indicating the type of data for each feature, for instance, it could be genes, or proteins.}

\item{ModuleIdx}{the index of the network module that summarization score is
intended to be stored}

\item{min_mod_size}{the minimally possible subnetwork size for the given network module,
should be an integer from 1 to the largest possible size of the protein
network}

\item{max_mod_size}{the minimally possible subnetwork size for the given network module,
should be an integer from 1 to the largest possible size of the protein
network, and it needs to be greater than the specified minimally possible network size.}

\item{damping}{damping parameter for the pagerank algorithm}

\item{method}{Either NetSHy'or 'PCA' indicating which summarization method to use}

\item{saving_dir}{Directory where user prefers to store the result}
}
\value{
a file stored in the local designated directory, which contains the
following: (1) M: subnetwork adjacency matrix. (2) pca_score: a dataframe
contains regular PC scores for the first 3 PCs as well as the phenotype. (3)
rank_value: PageRank score for each individual feature in the subnetwork.\
(4) pca_hybrid: a list that contains: PC score, PC loadings and PC varianace
explained for hybrid PC method. (5) pca_hybrid: a list that contains: PC
score, PC loadings and PC varianace explained for hybrid PC method with
alpha = 0. (6) pc_correlation: Regular PC score's correlation with respect
to phenotype. (7) correlation_hybrid: Hybrid PC score's correlation with
respect to phenotype. (8) correlation_hybrid_zero: Hybrid PC score's
correlation with respect to phenotype with alpha = 0.  (9)
omics_correlation_data: Individual omics feature correlation with respect to
phenotype (10) pc_loading: Regular PC loadings.
}
\description{
Extract summarization scores (the first 3 prinicipal components) for
specified network module with given network size. The proteins will be
ranked based on PageRank algorithm, then the top k proteins (where k is the
specified subnetwork size) will be included into the final subnetwork to
generate the summarization score. For the PC score, the correlation with
respect to the phenotype of interest will be calculated and stored. In
addition, the correlation between individual proteins and phenotype of
interest will also be recorded. The final subnetwork adjacency matrix will
be stored into the user-specified working directory of interest.
}
\examples{
library(SmCCNet)
set.seed(123)
w <- rnorm(20)
w <- w/sqrt(sum(w^2))
labels <- paste0('feature_', 1:20)
abar <- getAbar(w, P1 = 20, FeatureLabel = labels)
modules <- getOmicsModules(abar, CutHeight = 0.1)
x <- X1[ ,seq_len(20)]
corr <- stats::cor(x)
# display only example
# networkPruning(abar, corr, modules, data = x, Pheno = Y,folder = 'My_Example',
# ModuleIdx = 1, pheno_name = 'My_Example', mod_size = 3
# )

}
