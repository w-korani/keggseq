% File library/man/kegg_summary.Rd
\name{kegg_summary}
\alias{kegg_summary}
\title{kegg_summary}
\description{
kegg_summary produces a summary table of the output of calculate_kegg function with including the qvalues. 
}
\usage{
kegg_summary(dataset)
}
\arguments{
\item{dataset}{A output dataset of calculate_kegg.}
}
\value{
A data frame containg 7 colums as following:\cr
column1: map_numbers, the map numbers of the KEGG pathway.\cr
column2: pathway_description, the discription the the pathway.\cr
column3: background_gene_numbers, number of all genes included in the pathway.\cr
column4: deg_gene_numbers, number of differentially expressed genes in the pathway.\cr
column5: pvalue, p-values of the hypergeometric test for the pathway.\cr
column6: adjusted_pvalue, the Bonferroni method adjustment of p-values.\cr
column7: qvalue, q-values of the pvalues of column5.
}
\examples{
a <- grep_datasets(c("adu","aip"))
b <- corrected_datasets_ids(a,"new_ids.csv")
deg_list <- as.matrix(b[b$kegg_pathways=='00061',1])[,1]
c <- calculate_kegg(b,deg_list)
d <- kegg_summary(c)
}
