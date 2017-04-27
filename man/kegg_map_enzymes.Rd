% File library/man/kegg_map_enzymes.Rd
\name{kegg_map_enzymes}
\alias{kegg_map_enzymes}
\alias{create_kegg_map}
\title{kegg_map_enzymes}
\description{
 kegg_map_enzymes returns a dataset of enzymes included in an interested pathway.
}
\usage{
kegg_map_enzymes(species,dataset,deg_list,map_number,correction_file_name,deg)
}
\arguments{
\item{species}{A list of abbreviations of the intersested species.}
\item{dataset}{The output dataset of the calculate_kegg function}
\item{deg_list}{A list containing the differentially expressed genes.}
\item{map_number}{A string of the interested map number.}
\item{correction_file_name}{An optional filed, a string to file name, and path, of the dataset_alternate_file in case of using corrected_datasets_ids function.}
\item{deg}{A logical value can be set to TRUE in case of reurning only enzymes of differentially expressed genes, and FLASE to return all enzymes in the intersetd pathway.}
}
\value{
A data set with three colnames, the first is the enzyme id, the second is the corresponding gene id and the third is the discription of the enzyme.
}
\examples{
a <- grep_datasets(c("adu","aip"))
b <- corrected_datasets_ids(a,"new_ids.csv")
deg_list <- as.matrix(b[b$kegg_pathways=='00061',1])[,1]
c <- calculate_kegg(b,deg_list)
enz = kegg_map_enzymes(c("adu","aip"),c,deg_list,"00480","new_ids.csv",TRUE)
}
