% File library/man/create_filtered_plot.Rd
\name{create_filtered_plot}
\alias{create_filtered_plot}
\title{create_filtered_plot}
\description{
create_filtered_plot generates a scatter plot of the output of the calculate_kegg function with passing a specific filter
}
\usage{
create_filtered_plot(dataset,filter_name,filter_value)
create_plot(dataset)
}
\arguments{
\item{dataset}{The output dataset of the calculate_kegg function}
\item{filter_name}{a string of one of the following filters can be used:\cr
background_gene_numbers, all genes included in the pathways.\cr
deg_gene_numbers, the differentially expressed genes included int the pathway.\cr
pvalue, the p-values.\cr
adjusted_pvalue, the adjusted p-values.\cr
qvalue, the q-values.
}
\item{filter_value}{A string starts by <,>,==,<= or >= then the values for filtering}
}
\examples{
a <- grep_datasets(c("adu","aip"))
b <- corrected_datasets_ids(a,"new_ids.csv")
deg_list <- differentially_expressed_gene_list$id
c <- calculate_kegg(b,deg_list)
pdf("kegg_scatter_output.pdf")
create_filtered_plot(c,"deg_gene_numbers",">0")
create_filtered_plot(c,"qvalue","<0.01")
dev.off()
}