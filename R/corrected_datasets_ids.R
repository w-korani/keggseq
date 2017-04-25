#'name corrected_datasets_ids
corrected_datasets_ids <- function(dataset_orginal,dataset_alternate_file)
{
	dataset_alternate = read.csv(dataset_alternate_file,header=F)
	colnames(dataset_alternate) = c("kegg_genes_new","kegg_genes")
	Table4b <- merge(dataset_alternate,dataset_orginal,by = "kegg_genes")
	Table4c <- Table4b[,c(2,3)]
	colnames(Table4c) = c("kegg_genes","kegg_pathways")
	Table4c = Table4c[order(Table4c$kegg_pathways),]
	return(Table4c)
}