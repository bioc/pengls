% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getCorMat.R
\name{getCorMat}
\alias{getCorMat}
\title{Get the (square root of the inverse of the) correlation matrix}
\usage{
getCorMat(data, glsSt, Coef = c(coef(glsSt)), control, outVar)
}
\arguments{
\item{data}{The data frame}

\item{glsSt}{The correlation object for gls}

\item{Coef}{optional vector of coefficients to glsSt}

\item{control}{the list of control arguments for gls}

\item{outVar}{the name of the outcome variable}
}
\value{
A list with components
\item{corMat}{The square root of the inverse correlation matrix}
\item{Coef}{The coefficients of the correlation object}
}
\description{
Get the (square root of the inverse of the) correlation matrix
}
