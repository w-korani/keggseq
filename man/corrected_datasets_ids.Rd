% File library/man/corrected_datasets_ids.Rd
\name{corrected_datasets_ids}
\alias{corrected_datasets_ids}
\title{corrected_datasets_ids}
\description{
corrected_datasets_ids corrects genes_id to a different id set
}
\usage{
corrected_datasets_ids(dataset_orginal,dataset_alternate_file)
}
\arguments{
\item{dataset_orginal}{A dataset containing kegg genes_id, 
    the output of grep_datasets function.}
\item{dataset_alternate_file}{A string for the name, and path, 
    of a csv file contiaing the new genes_id in the same 
    format of the dataset, the first one is the new gene 
    ids and the second one is the map numpers.}
}
\value{
A dataset of the new genes_id in the same format of the input dataset
}
\examples{
a <- grep_datasets(c("adu","aip"))
path <- system.file(package = "keggseq")
file <- paste0(path, "/extdata/new_ids.csv")
b <- corrected_datasets_ids(a,file)
}
