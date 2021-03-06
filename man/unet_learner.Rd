% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unet.R
\name{unet_learner}
\alias{unet_learner}
\title{Unet_learner}
\usage{
unet_learner(
  dls,
  arch,
  loss_func = NULL,
  pretrained = TRUE,
  cut = NULL,
  splitter = NULL,
  config = NULL,
  n_in = 3,
  n_out = NULL,
  normalize = TRUE,
  opt_func = Adam(),
  lr = 0.001,
  cbs = NULL,
  metrics = NULL,
  path = NULL,
  model_dir = "models",
  wd = NULL,
  wd_bn_bias = FALSE,
  train_bn = TRUE,
  moms = list(0.95, 0.85, 0.95)
)
}
\arguments{
\item{dls}{dls}

\item{arch}{arch}

\item{loss_func}{loss_func}

\item{pretrained}{pretrained}

\item{cut}{cut}

\item{splitter}{splitter}

\item{config}{config}

\item{n_in}{n_in}

\item{n_out}{n_out}

\item{normalize}{normalize}

\item{opt_func}{opt_func}

\item{lr}{lr}

\item{cbs}{cbs}

\item{metrics}{metrics}

\item{path}{path}

\item{model_dir}{model_dir}

\item{wd}{wd}

\item{wd_bn_bias}{wd_bn_bias}

\item{train_bn}{train_bn}

\item{moms}{moms}
}
\description{
Build a unet learner from `dls` and `arch`
}
