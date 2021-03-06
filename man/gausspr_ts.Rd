% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/forecasting-gausspr.R
\name{gausspr_ts}
\alias{gausspr_ts}
\title{Make forecasts using gaussian process regression}
\usage{
gausspr_ts(timeseries, num_ahead = 5, level = 95, frequency = 1,
  kernel = "rbfdot", kpar = "automatic")
}
\arguments{
\item{timeseries}{the time series to forecast}

\item{num_ahead}{the number of points at the end of the time series to
forecast}

\item{level}{Confidence level for prediction intervals.}

\item{frequency}{the number of observations per unit of time.}

\item{kernel}{the kernel function used in training and predicting.
    This parameter can be set to any function, of class kernel, which computes a dot product between two
    vector arguments. kernlab provides the most popular kernel functions
    which can be used by setting the kernel parameter to the following
    strings:
    \itemize{
      \item \code{rbfdot} Radial Basis kernel function "Gaussian"
      \item \code{polydot} Polynomial kernel function
      \item \code{vanilladot} Linear kernel function
      \item \code{tanhdot} Hyperbolic tangent kernel function
      \item \code{laplacedot} Laplacian kernel function
      \item \code{besseldot} Bessel kernel function
      \item \code{anovadot} ANOVA RBF kernel function
       \item \code{splinedot} Spline kernel 
    }
    The kernel parameter can also be set to a user defined function of
    class kernel by passing the function name as an argument.
  }

\item{kpar}{the list of hyper-parameters (kernel parameters).
    This is a list which contains the parameters to be used with the
    kernel function. Valid parameters for existing kernels are :
    \itemize{
      \item \code{sigma} inverse kernel width for the Radial Basis
      kernel function "rbfdot" and the Laplacian kernel "laplacedot".
      \item \code{degree, scale, offset} for the Polynomial kernel "polydot"
      \item \code{scale, offset} for the Hyperbolic tangent kernel
      function "tanhdot"
      \item \code{sigma, order, degree} for the Bessel kernel "besseldot". 
      \item \code{sigma, degree} for the ANOVA kernel "anovadot".
    }
   
    Hyper-parameters for user defined kernels can be passed through the
    kpar parameter as well.}
}
\value{
a data.frame of the mean forecasts, the observed values, and the
lower and upper CI levels (if an error occurs, then just NA values)
}
\description{
\code{gausspr_ts} fits a timeseries model using \code{\link[kernlab]{gausspr}}
}
