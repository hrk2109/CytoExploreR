% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cyto_gate-helpers.R
\name{cyto_gate_bool}
\alias{cyto_gate_bool}
\title{Add boolean gate to GatingSet and gatingTemplate}
\usage{
cyto_gate_bool(
  x,
  parent = NULL,
  alias = NULL,
  logic = NULL,
  gatingTemplate = NULL
)
}
\arguments{
\item{x}{object of class \code{GatingSet}.}

\item{parent}{name of the parent population to which the boolean gates should
be added, set to the most recent common ancestor by default.}

\item{alias}{vector of names for the boolean populations.}

\item{logic}{vector of logic to define each of the boolean populations.}

\item{gatingTemplate}{name of the \code{gatingTemplate} csv file (e.g.
"gatingTemplate.csv") where the new entries should be saved.}
}
\value{
object of class \code{GatingSet} with new boolean gates and updated
  gatingTemplate csv file with appropriate entries.
}
\description{
Add boolean gate to GatingSet and gatingTemplate
}
\examples{
\dontrun{
library(CytoExploreRData)

# Activation GatingSet
gs <- GatingSet(Activation)

# Compensation
gs <- cyto_compensate(gs)

# Transformations
gs <- cyto_transform(gs)

# Gating
gs <- cyto_gatingTemplate_apply(gs, Activation_gatingTemplate)

# Add boolean gate
gs <- cyto_gate_bool(gs,
alias = "CD4+CD8",
logic = "CD4 T Cells|CD8 T Cells")
}

}
\author{
Dillon Hammill, \email{Dillon.Hammill@anu.edu.au}
}
