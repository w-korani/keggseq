% File library/man/list_species.Rd
\name{list_species}
\alias{list_species}
\title{list_species}
\description{
The function returns the all currently availabe datasets in the KEGG databse. In addition, a search term can be passed to the function to find a particular organism.\cr
The searching term is not case sensitive.
}
\usage{
list_species(key_word)
}
\arguments{
\item{key_word}{A not case sensitive string.}
}
\value{
A data frame of two columns, the first one is the dataset abbreviation and the second is the scientific name of the species.
}
\examples{
a = list_species("arachis")
a = list_species()
}
