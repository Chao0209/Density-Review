% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wass_regress.R
\name{wass_regress}
\alias{wass_regress}
\title{Perform Frechet Regression with the Wasserstein Distance}
\usage{
wass_regress(
  rightside_formula,
  Xfit_df,
  Ymat,
  bandwidth = 0.01,
  Ytype = "density",
  Sup = NULL,
  t = NULL
)
}
\arguments{
\item{rightside_formula}{a right-side formula}

\item{Xfit_df}{n-by-p matrix (or dataframe) of predictor values for fitting (do not include a column for the intercept)}

\item{Ymat}{one of the following matrices:
\itemize{
\item{if Ytype = 'quantile'} an n-by-m matrix of the observed quantile functions. Ymat[i, :] is a 1-by-m vector of quantile function values on grid \code{Sup}.
\item{if Ytype = 'density'} an n-by-m matrix of the observed density functions. Ymat[i, :] is a 1-by-m vector of density function values on grid \code{Sup}.
}}

\item{bandwidth}{the smoothing parameter in kernel smoothing applied on the density function, a value in (0, 1). (default: 0.01)}

\item{Ytype}{'quantile' or 'density'}

\item{Sup}{a length m vector - common grid for all density functions in Ymat. (default: seq(0, 1, length.out = ncol(Ymat)))}

\item{t}{a length m vector - common grid for quantile functions.}
}
\value{
a list containing the following ojects:
\item{qfit}{n-by-m matrix of fitted quantile density functions.}
\item{ffit}{n-by-m matrix of fitted density functions.}
\item{Qfit}{n-by-m matrix of fitted quantile functions.}
\item{call}{function call.}
\item{predictor_names}{names of predictors as the colnames given in the xfit matrix or dataframe.}
\item{xfit}{design matrix in quantile fitting.}
\item{lm_res}{the fitting model}
\item{rformula}{\code{rightside_formula}}
\item{Ysmooth}{a list containing the following matrices:
\itemize{
\item{Qobs:} {n-by-m matrix of the observed quantile functions.}
\item{qobs:} {n-by-m matrix of the observed quantile density functions.}
\item{fobs:} {n-by-m matrix of the observed density functions.}
}}
\item{t_equal}{a length m vector - common grid for all quantile functions in Qobs.}
}
\description{
Perform Frechet Regression with the Wasserstein Distance
}
\examples{
data(strokeCTdensity)
predictor = strokeCTdensity$predictors
dSup = strokeCTdensity$densitySupport
densityCurves = strokeCTdensity$densityCurve

res1 = wass_regress(rightside_formula = ~., Xfit_df = predictor, Ymat = densityCurves, bandwidth = 0.01, Ytype = 'density', Sup = dSup)
res2 = wass_regress(rightside_formula = ~ log_b_vol * weight, Xfit_df = predictor, Ymat = densityCurves, bandwidth = 0.01, Ytype = 'density', Sup = dSup)
}
\references{
\cite{Wasserstein F-tests and confidence bands for the Frechet regression of density response curves, Alexander Petersen, Xi Liu and Afshin A. Divani, 2019}
}
