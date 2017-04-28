#'name create_plot
create_plot <- function(dataset)
{
    requireNamespace('ggplot2')
    requireNamespace('qvalue')
    pathway_description = 0
    qvalue=qvalue::qvalue(round(dataset$pvalue,digits=5))$qvalue
    Results = cbind(dataset,qvalue=qvalue)
    Link1 = "http://rest.kegg.jp/list/pathway"
    Table1 = readLines(Link1)
    Table2 = t(data.frame(strsplit(Table1,'\t')))
    Table3 = cbind(map_numbers = as.character(Table2[,1]),pathway_description = 
		   as.character(Table2[,2]))
    Table4 = gsub('path:map','',Table3)
    Table5 = data.frame(Table4)
    Table6 = merge(Table5,Results,by="map_numbers")
    Rich_factor = Table6$deg_gene_numbers/Table6$background_gene_numbers
    Rich_factor = round(Rich_factor ,digits=2)
    p <- ggplot2::ggplot(Table6, ggplot2::aes(x = Rich_factor, y = pathway_description))
    p + ggplot2::geom_point(ggplot2::aes(
		   colour = qvalue,size = Table6$deg_gene_numbers))+ 
		   ggplot2::scale_colour_gradientn(colours=c("blue","white","red"))
}
