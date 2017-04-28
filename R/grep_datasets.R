#'name grep_databases
grep_datasets <- function(species)
{
    Table4 = data.frame()
    for (i in 1:length(species))
    {
    link1 = "http://rest.kegg.jp/link/pathway/"
    Link1 = paste0(link1,species[i])
    Table1 = readLines(Link1)
    Table2 = t(data.frame(strsplit(Table1,'\t')))
    Table3 = cbind(kegg_genes = as.character(Table2[,1]),
    kegg_pathways = as.character(Table2[,2]))
    Table4 = rbind(Table4,Table3)
    }
    Table4[,2] = gsub('\\w\\w\\w\\w:\\w*[^0123456789]','',Table4[,2])
    Table4 = Table4[order(Table4$kegg_pathways),]
    return(Table4)
}
