#'name list_species 
list_species <- function(key_word)
{
	Link1 = "http://rest.kegg.jp/list/organism"
	Table1 = readLines(Link1)
	Table2 = t(data.frame(strsplit(Table1,'\t')))
	Table3 = cbind(organism_abb = as.character(Table2[,2]),description = as.character(Table2[,3]))
	if (missing(key_word))
	{return(Table3)}
	else
	{
	return(Table3[grep(key_word,Table3[,2],ignore.case=T),])
	}
}