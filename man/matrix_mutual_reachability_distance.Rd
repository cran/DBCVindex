% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DBCV_function.r
\name{matrix_mutual_reachability_distance}
\alias{matrix_mutual_reachability_distance}
\title{Function that calculates the mutual reachability distance within a matrix}
\usage{
matrix_mutual_reachability_distance(MinPts, G_edges_weights, d)
}
\arguments{
\item{MinPts}{number of minimal points}

\item{G_edges_weights}{matrix of edges weights}

\item{d}{number of features}
}
\value{
a list of two elements: d_ucore and G_edges_weights:
}
\description{
Function that calculates the mutual reachability distance within a matrix
}
\examples{

 n = 300; noise = 0.05; seed = 1782;
 theta <- seq(0, pi, length.out = n / 2)
 x1 <- cos(theta) + rnorm(n / 2, sd = noise)
 y1 <- sin(theta) + rnorm(n / 2, sd = noise)
 x2 <- cos(theta + pi) + rnorm(n / 2, sd = noise)
 y2 <- sin(theta + pi) + rnorm(n / 2, sd = noise)
 X <- rbind(cbind(x1, y1), cbind(x2, y2))
 y <- c(rep(0, n / 2), rep(1, n / 2))

nfeatures <- ncol(X)
i <- 1
clusters <- unique(y)
objcl <- which(y == clusters[i])
nuobjcl <- length(objcl)

noiseLabel <- -1
distX <- as.matrix(dist(X))^2
distXy <- distX[y != noiseLabel, y != noiseLabel]

mr <- matrix_mutual_reachability_distance(nuobjcl, distXy[objcl, objcl], nfeatures)
}
