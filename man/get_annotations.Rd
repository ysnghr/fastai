% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vision_augment.R
\name{get_annotations}
\alias{get_annotations}
\title{get_annotations}
\usage{
get_annotations(fname, prefix = NULL)
}
\arguments{
\item{fname}{fname}

\item{prefix}{prefix}
}
\description{
Open a COCO style json in `fname` and returns the lists of filenames (with maybe `prefix`) and labelled bboxes.
}
