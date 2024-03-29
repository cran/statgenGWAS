% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kinship.R
\name{kinship}
\alias{kinship}
\title{Functions for calculating kinship matrices}
\usage{
kinship(
  X,
  method = c("astle", "IBS", "vanRaden", "identity"),
  MAF = NULL,
  denominator = NULL
)
}
\arguments{
\item{X}{An n x m marker matrix with genotypes in the rows (n) and markers in
the columns (m).}

\item{method}{The method used for computing the kinship matrix.}

\item{MAF}{The minor allele frequency (MAF) threshold used in kinship
computation. A numerical value between 0 and 1. SNPs with MAF below this
value are not taken into account when computing the kinship. If NULL all
markers are used regardless of their allele frequency.}

\item{denominator}{A numerical value. See details.}
}
\value{
An n x n kinship matrix.
}
\description{
A collection of functions for calculating kinship matrices using different
algorithms. The following algorithms are included: astle (Astle and Balding,
2009), Identity By State (IBS) and VanRaden (VanRaden, 2008) for
marker matrices. For method identity an identity kinship matrix is returned.
}
\section{Marker matrices}{

In all algorithms the input matrix \code{X} is first cleaned, i.e. markers
with a variance of 0 are excluded from the calculation of the kinship matrix.
Then some form of scaling is done which differs per algorithm. This gives a
scaled matrix \code{Z}. The matrix \eqn{ZZ^t / denominator} is returned.
By default the denominator is equal to the number of columns in \code{Z} for
\code{astle} and \code{IBS} and \eqn{2 * p * (1-p)} where
\eqn{p = colSums(X) / (2 * nrow(X))} for \code{vanRaden}. This denominator
can be overwritten by the user, e.g. when computing kinship matrices by
splitting \code{X} in smaller matrices and then adding the results together
in the end.
}

\examples{
## Create example matrix.
M <- matrix(c(1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1), nrow = 4)

## Compute kinship matrices using different methods.
kinship(M, method = "astle")
kinship(M, method = "IBS")
kinship(M, method = "vanRaden")

## Only use markers with a Minor Allele Frequency of 0.3 or more.
kinship(M, method = "astle", MAF = 0.3)

## Compute kinship matrix using astle and balding method with denominator 2.
kinship(M, method = "astle", denominator = 2)

}
\references{
Astle, William, and David J. Balding. 2009. “Population Structure
and Cryptic Relatedness in Genetic Association Studies.” Statistical Science
24 (4): 451–71. \doi{10.1214/09-sts307}.

VanRaden P.M. (2008) Efficient methods to compute genomic
predictions. Journal of Dairy Science 91 (11): 4414–23.
\doi{10.3168/jds.2007-0980}.
}
