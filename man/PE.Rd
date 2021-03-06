% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pe_code.R
\name{PE}
\alias{PE}
\alias{WPE}
\title{Calculate the permuation entropy of a times series}
\usage{
PE(x, m, d = 1, ties.method = "first", weighted = TRUE)

WPE(x, m, d, ties.method = "first")
}
\arguments{
\item{x}{the time series, observed at regular intervals.}

\item{m}{the number of dimensions to embed x into.}

\item{d}{the time delay}

\item{ties.method}{a character string specifying how ties are treated,
    see \sQuote{Details}; can be abbreviated.}

\item{weighted}{whether to weight by the variance in each word}
}
\value{
The entropy of the distribution.
}
\description{
\code{WPE} is a wrapper that sets \code{weighted} to \code{TRUE}
}
\details{
Words containing NAs are ignored.
}
\examples{
x <- rnorm(1000)
PE(x, 3)
}
