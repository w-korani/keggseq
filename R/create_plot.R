#'name create_plot
create_plot <- function(dataset)
{
	library(ggplot2)
	library('qvalue')
	qvalue=qvalue(round(dataset$pvalue,digits=5))$qvalue
	Results = cbind(dataset,qvalue=qvalue)
	Link1 = "http://rest.kegg.jp/list/pathway"
	Table1 = readLines(Link1)
	Table2 = t(data.frame(strsplit(Table1,'\t')))
	Table3 = cbind(map_numbers = as.character(Table2[,1]),pathway_description = as.character(Table2[,2]))
	Table4 = gsub('path:map','',Table3)
	Table5 = data.frame(Table4)
	Table6 = merge(Table5,Results,by="map_numbers")
	
Rich_factor = Table6$deg_gene_numbers/Table6$background_gene_numbers
	Rich_factor = round(Rich_factor ,digits=2)
	p <- ggplot(Table6, aes(x = Rich_factor, y = pathway_description))
	p + geom_point(aes(colour = qvalue,size = deg_gene_numbers))+ scale_colour_gradientn(colours=c("blue","white","red"))
}