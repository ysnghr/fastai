% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optimizers.R
\name{larc_layer_lr}
\alias{larc_layer_lr}
\title{larc_layer_lr}
\usage{
larc_layer_lr(p, lr, trust_coeff, wd, eps, clip = TRUE, ...)
}
\arguments{
\item{p}{p}

\item{lr}{lr}

\item{trust_coeff}{trust_coeff}

\item{wd}{wd}

\item{eps}{eps}

\item{clip}{clip}

\item{...}{additional args to pass}
}
\description{
Computes the local lr before weight decay is applied
}
