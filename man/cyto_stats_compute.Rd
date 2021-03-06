% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cyto_stats_compute.R
\name{cyto_stats_compute}
\alias{cyto_stats_compute}
\alias{cyto_stats_compute.GatingSet}
\alias{cyto_stats_compute.GatingHierarchy}
\alias{cyto_stats_compute.flowSet}
\alias{cyto_stats_compute.flowFrame}
\title{Compute, export and save statistics}
\usage{
\method{cyto_stats_compute}{GatingSet}(
  x,
  alias = NULL,
  parent = NULL,
  channels = NULL,
  trans = NA,
  stat = "median",
  format = "long",
  save_as = NULL,
  select = NULL,
  density_smooth = 0.6,
  ...
)

\method{cyto_stats_compute}{GatingHierarchy}(
  x,
  alias = NULL,
  parent = NULL,
  channels = NULL,
  trans = NA,
  stat = "median",
  format = "long",
  save_as = NULL,
  density_smooth = 0.6,
  ...
)

\method{cyto_stats_compute}{flowSet}(
  x,
  channels = NULL,
  trans = NA,
  stat = "median",
  gate = NA,
  format = "long",
  select = NULL,
  density_smooth = 0.6,
  ...
)

\method{cyto_stats_compute}{flowFrame}(
  x,
  channels = NULL,
  trans = NA,
  stat = "median",
  gate = NA,
  format = "long",
  density_smooth = 0.6,
  ...
)
}
\arguments{
\item{x}{object of class \code{\link[flowCore:flowFrame-class]{flowFrame}},
\code{\link[flowCore:flowSet-class]{flowSet}},
\code{\link[flowWorkspace:GatingHierarchy-class]{GatingHierarchy}} or
\code{\link[flowWorkspace:GatingSet-class]{GatingSet}}.}

\item{alias}{name(s) of the population(s) for which the statistic should be
calculated when a \code{GatingHierarchy} or \code{GatingSet} is supplied.}

\item{parent}{name(s) of the parent population(s) used calculate population
frequencies when a \code{GatingHierarchy} or \code{GatingSet} object is
supplied. The frequency of alias in each parent will be returned as a
percentage.}

\item{channels}{names of of channels for which statistic should be
calculated, set to all channels by default.}

\item{trans}{object of class
\code{\link[flowWorkspace:transformerList]{transformerList}} used to
transfom the channels of the supplied data. The \code{transformerList} is
required to return the data to the original linear scale when calculating
statistics.}

\item{stat}{name of the statistic to calculate, options include
\code{"count"}, \code{"freq"}, \code{"median"}, \code{"mode"},
\code{"mean"}, \code{"geo mean"}, \code{"CV"}, or \code{"freq"}.}

\item{format}{indicates whether the data should be returned in the
\code{"wide"} or \code{"long"} format, set to the \code{"long"} format by
default.}

\item{save_as}{name of a csv file to which the statistical results should be
saved.}

\item{select}{named list containing experimental variables to be used to
select samples using \code{\link{cyto_select}} when a \code{flowSet} or
\code{GatingSet} is supplied. Refer to \code{\link{cyto_select}} for more
details.}

\item{density_smooth}{smoothing parameter passed to
\code{\link[stats:density]{density}} when calculating mode, set to 1.5 by
default.}

\item{...}{not in use.}

\item{gate}{object of class \code{rectangleGate}, \code{polygonGate} or
\code{ellipsoidGate} to apply to \code{flowFrame} or \code{flowSet} objects
prior to computing statistics.}
}
\value{
a tibble containing the computed statistics in the wide or long
  format.
}
\description{
Compute, export and save statistics
}
\examples{
library(CytoExploreRData)

# Load in samples
fs <- Activation
gs <- GatingSet(fs)

# Apply compensation
gs <- compensate(gs, fs[[1]]@description$SPILL)

# Transform fluorescent channels
trans <- estimateLogicle(gs[[32]], cyto_fluor_channels(gs))
gs <- transform(gs, trans)

# Gate using cyto_gate_draw
gt <- Activation_gatingTemplate
gt_gating(gt, gs)

# Compute statistics - median
cyto_stats_compute(gs,
  alias = "T Cells",
  channels = c("Alexa Fluor 488-A", "PE-A"),
  stat = "median",
  save = FALSE
)

# Compute statistics for experimental group
cyto_stats_compute(gs,
  alias = "T Cells",
  channels = c("Alexa Fluor 488-A", "PE-A"),
  stat = "median",
  save = FALSE,
  select = list(Treatment = "Stim-A")
)

# Compute population frequencies and save to csv file
cyto_stats_compute(gs,
  alias = c("CD4 T Cells", "CD8 T Cells"),
  parent = c("Live Cells", "T Cells"),
  stat = "freq",
  save_as = "Population-Frequencies"
)

}
\author{
Dillon Hammill, \email{Dillon.Hammill@anu.edu.au}
}
