% File library/man/create_plot.Rd
\name{create_plot}
\alias{create_plot}
\title{create_plot}
\description{
create_plot generates a scatter plot of the output of the calculate_kegg function
}
\usage{
create_plot(dataset)
create_filtered_plot(dataset,filter_name,filter_value)
}
\arguments{
\item{dataset}{The output dataset of the calculate_kegg function.}
}
\examples{
a <- grep_datasets(c("adu","aip"))
b <- corrected_datasets_ids(a,"new_ids.csv")
deg_list <- differentially_expressed_gene_list$id
c <- calculate_kegg(b,deg_list)
pdf("kegg_scatter_output.pdf")
create_plot(c)
dev.off()
}