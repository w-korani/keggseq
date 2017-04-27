% File library/man/create_plot.Rd
\name{create_plot}
\alias{create_plot}
\title{create_plot}
\description{
create_plot generates a scatter plot of the output of the calculate_kegg function
}
\usage{
create_plot(dataset)
}
\arguments{
\item{dataset}{The output dataset of the calculate_kegg function.}}
\examples{
a <- list_species("arachis")
b <- grep_datasets(c("adu","aip"))
deg_list <- as.matrix(b[b$kegg_pathways=='00061',1])[,1]
c <- calculate_kegg(b,deg_list)
create_plot(c)
}
