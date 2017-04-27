% File library/man/create_kegg_map.Rd
\name{create_kegg_map}
\alias{create_kegg_map}
\title{create_kegg_map}
\description{
create_kegg_map generates kegg_map with highlighted DEGs for an interested pathway.\cr
the function creates three objects that saved directly to the working dirctory:\cr
"map_number".png: it has the pathway map graph with highlighted differentially expressed genes,\cr
the differentially expressed gene are highlighted by blue color,\cr
the differentially expressed genes that translated in a unque, specific, enzyme for the interested pathway are highlighted by red color.\cr
"map_number"_enzymes.csv": a two column csv file contains the enzyme names and corresponding gene ids included in the interested pathway\cr
"map_number"_de_enzymes.csv: a two column csv file contains the enzyme names and corresponding differentially expressed gene ids included in the interested pathway\cr
}
\usage{
create_kegg_map(species,dataset,deg_list,map_number,correction_file_name)
}
\arguments{
\item{species}{A list of abbreviations of the intersested species.}
\item{dataset}{The output dataset of the calculate_kegg function.}
\item{deg_list}{A list containing the differentially expressed genes.}
\item{map_number}{A string of the interested map number.}
\item{correction_file_name}{An optional filed, a string to file name, and path, of the dataset_alternate_file in case of using corrected_datasets_ids function.}
}
\examples{
a <- grep_datasets(c("adu","aip"))
b <- corrected_datasets_ids(a,"new_ids.csv")
deg_list <- as.matrix(b[b$kegg_pathways=='00061',1])[,1]
c <- calculate_kegg(b,deg_list)
create_kegg_map(c("adu","aip"),c,deg_list,"00480","new_ids.csv")
}
