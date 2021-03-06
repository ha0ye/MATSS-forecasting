#' @name npreg_ts
#' @title Make forecasts using nonparametric kernel regression
#'
#' @description `npreg_ts` fits a timeseries model using \code{\link[np]{npreg}}
#'
#' @inheritParams np::npreg
#' @inheritParams np::npregbw
#' @inheritParams forecast_iterated
#' @inheritParams forecast::forecast
#'
#' @return a data.frame of the mean forecasts, the observed values, and the
#'   lower and upper CI levels (if an error occurs, then just NA values)
#'
#' @export
#'
npreg_ts <- function(timeseries, num_ahead = 5, level = 95, 
                     regtype = "ll", bwmethod = "cv.aic", gradients = TRUE)
{
    f <- function(training, observed, level, regtype, bwmethod, gradients)
    {
        t <- seq_len(length(training))
        bws <- np::npregbw(training ~ t, regtype = regtype, bwmethod = bwmethod)
        np_model <- np::npreg(bws, gradients = gradients)
        
        # predict function requires a new list of predictor variables as newdata
        t_observed <- length(training) + seq_len(length(observed))
        forecasts <- np:::predict.npregression(np_model,
                                               newdata = list(t = t_observed),
                                               se.fit = TRUE)
        
        # return
        return_forecasts(observed, forecasts, level)
    }

    forecast_iterated(fun = f, timeseries = timeseries, num_ahead = num_ahead,
                   level = level, regtype = regtype, bwmethod = bwmethod, 
                   gradients = gradients)
}
