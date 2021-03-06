% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/createOriginalMA1Replicated.R
\name{createOriginalMA1Replicated}
\alias{createOriginalMA1Replicated}
\title{createOriginalMA1Replicated}
\usage{
createOriginalMA1Replicated(replicationCount = 10, size = 10, psi = 0.5,
  sigma = 1)
}
\arguments{
\item{replicationCount}{A number of replications, other words, an amount of times \code{createOriginalMA1()} is going to be executed.}

\item{size}{The size of the future one-dimensional array.}

\item{psi}{The main argument passed to the model of \code{stats::arima.sim()}.}

\item{sigma}{\code{Sigma} parameter as being the regular sigma, a.k.a. std.}
}
\value{
Returninng a two-dimensional array of dimensions \code{c(replicationCount, size)}.
}
\description{
Creating a two-dimensional array using \code{createOriginalMA1()}, as an underlyin function, passing \code{replicationCount} as the outer counter, \code{size}, \code{sigma} and \code{psi} (\code{psi} being the argument of the model).
}
\examples{
createOriginalMA1Replicated (replicationCount = 10, size = 10, psi = 0.5, sigma = 1)

}
