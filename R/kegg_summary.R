#'name kegg_summary
kegg_summary <- function(dataset)
{
	library('qvalue')
	Results = cbind(dataset,qvalue=qvalue(dataset$pvalue)$qvalue)
	Link1 = "http://rest.kegg.jp/list/pathway"
	Table1 = readLines(Link1)
	Table2 = t(data.frame(strsplit(Table1,'\t')))
	Table3 = cbind(map_numbers = as.character(Table2[,1]),pathway_description = as.character(Table2[,2]))
	Table4 = gsub('path:map','',Table3)
	Table5 = data.frame(Table4)
	Table6 = merge(Table5,Results,by="map_numbers")
	Table7 = Table6[,c(1,2,3,4,5,6,8)]
	return(Table7)
}