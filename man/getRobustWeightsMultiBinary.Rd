% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SmCCNet-source.R
\name{getRobustWeightsMultiBinary}
\alias{getRobustWeightsMultiBinary}
\title{SmCCA Algorithm with Binary Phenotype}
\usage{
getRobustWeightsMultiBinary(
  X,
  Y,
  Between_Discriminate_Ratio = c(1, 1),
  SubsamplingPercent = NULL,
  CCcoef = NULL,
  LambdaBetween,
  LambdaPheno = NULL,
  SubsamplingNum = 1000,
  ncomp_pls = 3,
  EvalClassifier = FALSE,
  testData = NULL
)
}
\arguments{
\item{X}{A list of training omics data matrix with same set and order of subjects.}

\item{Y}{Outcome binary variable, it is recommended that users set the level of this 
variable to 0 and 1.}

\item{Between_Discriminate_Ratio}{A vector with length 2 indicating the relative importance
of between-omics relationship and omics-phenotype relationship. For instance a ratio of 1:1
means between-omics relationship and omics-phenotype relationship contribute equally to the canonical weight
construction process.}

\item{SubsamplingPercent}{A vector corresponds to the number of omics data, specifying for each omics data, what is the 
percentage of omics feature being subsampled at each iteration.}

\item{CCcoef}{A vector of scaling factors only indicates the relationship between-omics (exclude omics-phenotype).}

\item{LambdaBetween}{A vector of sparsity penalty value for each omics data for running the between-omics SmCCA, each 
penalty term should be within the range of 0 and 1.}

\item{LambdaPheno}{A real number between 0 and 1, a penalty term when running the sparse PLS wit phenotype of interest, recommend to set to 0 or lower 
value such as 0.1.}

\item{SubsamplingNum}{Total number of subsamples, the more the better in terms of accuracy, but at a cost of 
computation time.}

\item{ncomp_pls}{Number of latent components for PLS, default set to 3.}

\item{EvalClassifier}{Whether algorithm is at the phase of evaluating classification performance or construct network, if
TRUE, latent factors from SPLSDA will be returned, if FALSE, canonical weight will be returned. Default is FALSE.}

\item{testData}{A list of testing omics data matrix with same set and order of subjects, only used when EvalClassifier is set to TRUE.}
}
\value{
A canonical correlation weight matrix with combining all omics data. Each
column is the canonical correlation weights based on subsampled X features. The number of columns is \code{SubsamplingNum}.
}
\description{
SmCCNet algorithm with multi-omics data and binary phenotype. This is a stepwise approach 
that (1) Use SmCCA to identify relationship between omics (exlude phenotype), (2) within highly connected omics features
selected in step 1, identify relationship between these selected omics features and phenotype of interest with 
sparse PLS. Sparse PLS algorithm for binary outcome first compute PLS by assuming outcome is continuous,
and extract multiple latent factors, then use latent factors to fit logistic regression, and weight latent factor by
regression parameters.
}
\examples{


## For illustration, we only subsample 5 times.
set.seed(123)
X1 <- matrix(rnorm(600,0,1), nrow = 60)
X2 <- matrix(rnorm(600,0,1), nrow = 60)
Y_binary <- rbinom(60,1,0.5)

 Ws <- getRobustWeightsMultiBinary(list(X1,X2), Y_binary, 
 SubsamplingPercent = c(0.8,0.8), CCcoef = NULL,
 LambdaBetween = c(0.5,0.5), LambdaPheno = 0.1, SubsamplingNum = 10)
  
}
