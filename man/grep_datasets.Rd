% File library/man/grep_databases.Rd
\name{grep_datasets}
\alias{grep_datasets}
\title{grep_datasets}
\description{
grep_datasets funcion takes a list of species as an input and produces a datasets of map numpers of the pathways and gene IDs
}
\usage{
grep_datasets(species)
}
\arguments{
\item{species}{A list of abbreviations of the intersested species.}
}
\value{
A data frame of two columns, the first one is KEGG gene ids and the second one is the map numpers
}
\examples{
a <-  grep_datasets(c("adu","aip"))
}
