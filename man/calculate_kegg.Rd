% File kegg/man/calculate_kegg.Rd
\name{calculate_kegg}
\alias{calculate_kegg}
\title{calculate_kegg}
\description{
calculate_kegg calculates hypergeometric test pvalues of kegg pathways and their adjusted_pvalue using Bonferroni method.\cr
It takes the input of grep_datasets function or corrected_datasets_ids function as an input
}
\usage{
calculate_kegg(dataset,list)
}
\arguments{
\item{dataset}{A output dataset of grep_datasets or corrected_datasets_ids.}
\item{list}{A list containing the differentially expressed genes.}
}
\value{
A data frame containg 6 colums as following:\cr
column1: map_numbers, the map numbers of the KEGG pathway.\cr
column2: background_gene_numbers, number of all genes included in the pathway.\cr
column3: deg_gene_numbers, number of differentially expressed genes in the pathway.\cr
column4: pvalue, p-value of the hypergeometric test for the pathway.\cr
column5: adjusted_pvalue, the Bonferroni method adjustment of p-values.\cr
column6: gene_list, a list of the differentially expressed genes included in the pathway 
}
\examples{
a <- grep_datasets(c("adu","aip"))
b <- corrected_datasets_ids(a,"new_ids.csv")
deg_list <- as.matrix(b[b$kegg_pathways=='00061',1])[,1]
c <- calculate_kegg(b,deg_list)
}
