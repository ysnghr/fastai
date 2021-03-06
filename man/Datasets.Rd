% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vision_core.R
\name{Datasets}
\alias{Datasets}
\title{Datasets}
\usage{
Datasets(
  items = NULL,
  tfms = NULL,
  tls = NULL,
  n_inp = NULL,
  dl_type = NULL,
  use_list = NULL,
  do_setup = TRUE,
  split_idx = NULL,
  train_setup = TRUE,
  splits = NULL,
  types = NULL,
  verbose = FALSE
)
}
\arguments{
\item{items}{items}

\item{tfms}{tfms}

\item{tls}{tls}

\item{n_inp}{n_inp}

\item{dl_type}{dl_type}

\item{use_list}{use_list}

\item{do_setup}{do_setup}

\item{split_idx}{split_idx}

\item{train_setup}{train_setup}

\item{splits}{splits}

\item{types}{types}

\item{verbose}{verbose}
}
\description{
A dataset that creates a list from each `tfms`, passed thru `item_tfms`
}
