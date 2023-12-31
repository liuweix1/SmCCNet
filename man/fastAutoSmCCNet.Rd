% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AutoSmCCNet.R
\name{fastAutoSmCCNet}
\alias{fastAutoSmCCNet}
\title{Automated SmCCNet}
\usage{
fastAutoSmCCNet(
  X,
  Y,
  AdjustedCovar = NULL,
  preprocess = FALSE,
  Kfold = 5,
  EvalMethod = "accuracy",
  subSampNum,
  DataType,
  BetweenShrinkage = 2,
  ScalingPen = c(0.1, 0.1),
  CutHeight = 1 - 0.1^10,
  cluster = TRUE,
  min_size = 10,
  max_size = 100,
  summarization = "NetSHy",
  saving_dir = getwd(),
  ncomp_pls = 3,
  tuneLength = 5,
  tuneRangeCCA = c(0.1, 0.5),
  tuneRangePLS = c(0.5, 0.9),
  seed = 123
)
}
\arguments{
\item{X}{A list of matrices with same set and order of subjects}

\item{Y}{Phenotype variable of either numeric or binary, for binary variable, for binary Y, it should be binarized to 0,1 before running this function.}

\item{AdjustedCovar}{A data frame of covariates of interest to be adjusted for through regressing-out approach}

\item{preprocess}{Whether the data preprocessing step should be conducted}

\item{Kfold}{Number of folds for cross-validation}

\item{EvalMethod}{Selections among 'accuracy', 'auc', 'precision', 'recall', and 'f1', indicating for evaluating binary outcome, what's the metric to use}

\item{subSampNum}{Number of subsampling to run, the higher the better in terms of accuracy, but at a cost of computational time}

\item{DataType}{A vector indicating what type of data is each element of X, example would be c('gene', 'miRNA')}

\item{BetweenShrinkage}{A real number > 0 that helps shrink the importance of omics-omics correlation component, the larger this number
is, the greater the shrinkage it is.}

\item{ScalingPen}{A numeric vector of length 2 used as the penalty terms for scaling factor determination method: default set to 0.1, and 
should be between 0 and 1.}

\item{CutHeight}{A numeric value specifying the cut height for hierarchical clustering, should be between 0 and 1}

\item{cluster}{Determine if clustering algorithm should be applied, default is TRUE.}

\item{min_size}{Minimally possible subnetwork size after network pruning, default set to 10.}

\item{max_size}{Maximally possible subnetwork size after network pruning, default set to 100.}

\item{summarization}{Summarization method used for network pruning and summarization, should be either 'NetSHy' or 'PCA'.}

\item{saving_dir}{Directory where user would like to store the subnetwork results.}

\item{ncomp_pls}{Number of components for PLS algorithm, only used when binary phenotype is given, default is set to 3.}

\item{tuneLength}{The total number of candidate penalty term values for each omics data, default is set to 5.}

\item{tuneRangeCCA}{A vector of length 2 that represents the range of candidate penalty term values for each omics data based on canonical correlation analysis, 
default is set to c(0.1,0.5).}

\item{tuneRangePLS}{A vector of length 2 that represents the range of candidate penalty term values for each omics data based on partial least squared discriminant analysis, 
default is set to c(0.5,0.9).}

\item{seed}{Random seed for result reproducibility, default is set to 123.}
}
\value{
subnetwork modules are stored in local directory specified by user, this function will return the global network information, which 
 include global adjacency matrix, data correlation matrix, hierarchical clustering result, Omics Abundance data, and Cross-Validation Result.
}
\description{
Automated SmCCNet that automatically identify project problem (single-omics vs multi-omics),
and analysis method (CCA vs. PLS) based on the input data that is provided.
This method automatically preprocess data, choose scaling factors, subsampling percentage, and optimal penalty 
terms, then run through the complete SmCCNet pipeline without the requirement for
users to provide any information. This function will store all the subnetwork information to local directory 
user is providing, as well as return all the global network and evaluation information.
}
\examples{


## For illustration, we only subsample 5 times.
set.seed(123)
X1 <- matrix(rnorm(60000,0,1), nrow = 200)
colnames(X1) <- paste('gene',1:300)
X2 <- matrix(rnorm(60000,0,1), nrow = 200)
colnames(X2) <- paste('protein',1:300)
Y <- matrix(rnorm(200,0,1), nrow = 200)
Y_binary <- rbinom(200,1,0.5)
### single-omics PLS
# result <- fastAutoSmCCNet(X = list(X1), Y = as.factor(Y_binary), 
# Kfold = 3, subSampNum = 20, DataType = c('Gene'))
### single-omics CCA
# result <- fastAutoSmCCNet(X = list(X1), Y = Y, Kfold = 3, subSampNum = 20, 
# DataType = c('Gene'))
### multi-omics PLS
# result <- fastAutoSmCCNet(X = list(X1,X2), Y = as.factor(Y_binary), Kfold = 3, 
# subSampNum = 20, DataType = c('Gene', 'miRNA'), 
# saving_dir = getwd())
### multi-omics CCA
# result <- fastAutoSmCCNet(X = list(X1,X2), Y = Y, Kfold = 3, subSampNum = 20, 
# DataType = c('Gene', 'miRNA'), saving_dir = getwd())

}
