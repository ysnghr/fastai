% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vision_models.R
\name{XResNet}
\alias{XResNet}
\title{XResNet}
\usage{
XResNet(expansion, layers, c_in = 3, c_out = 1000)
}
\arguments{
\item{expansion}{expansion}

\item{layers}{layers}

\item{c_in}{c_in}

\item{c_out}{c_out}
}
\description{
A sequential container.
}
\details{
Modules will be added to it in the order they are passed in the constructor.
Alternatively, an ordered dict of modules can also be passed in. To make it easier to understand, here is a small example:: # Example of using Sequential model = nn.Sequential( nn.Conv2d(1,20,5), nn.ReLU(), nn.Conv2d(20,64,5), nn.ReLU() ) # Example of using Sequential with OrderedDict model = nn.Sequential(OrderedDict([ ('conv1', nn.Conv2d(1,20,5)), ('relu1', nn.ReLU()), ('conv2', nn.Conv2d(20,64,5)), ('relu2', nn.ReLU()) ]))
}
