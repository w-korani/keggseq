#'name create_filtered_plot
create_filtered_plot <- function(dataset,filter_name,filter_value)
{
    requireNamespace('ggplot2')
    requireNamespace('qvalue')
    pathway_description=0
    a2=0
    qvalue=qvalue::qvalue(round(dataset$pvalue,digits=5))$qvalue
    Results = cbind(dataset,qvalue=qvalue)
    Link1 = "http://rest.kegg.jp/list/pathway"
    Table1 = readLines(Link1)
    Table2 = t(data.frame(strsplit(Table1,'\t')))
    Table3 = cbind(map_numbers = as.character(Table2[,1]),
    pathway_description = as.character(Table2[,2]))
    Table4 = gsub('path:map','',Table3)
    Table5 = data.frame(Table4)
    Table6 = merge(Table5,Results,by="map_numbers")
    a1 = paste0("a2 = Table6[Table6$",filter_name,filter_value,",]")
    eval(parse(text=a1))
    Table6 = a2
    Rich_factor = round(
    Table6$deg_gene_numbers/Table6$background_gene_numbers,digits=2)
    p <- ggplot2::ggplot(Table6, ggplot2::aes(x = Rich_factor, 
    y = pathway_description))
    p + ggplot2::geom_point(ggplot2::aes(colour = qvalue,size = 
    Table6$deg_gene_numbers))+ ggplot2::scale_colour_gradientn(
    colours=c("blue","white","red"))
}
