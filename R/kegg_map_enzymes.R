#'name kegg_map_enzymes
kegg_map_enzymes <- function (species,dataset,deg_list,
map_number,correction_file_name,deg)
{
    a1 = formatC(map_number,width = 5, format = "d",flag="0")
    a2 = paste0("http://www.kegg.jp/kegg-bin/show_pathway?map",
    a1,"/")
    b1 = dataset[dataset$map_numbers==a1,6]
    b2 = strsplit(b1,", ")
    b3 = as.matrix(b2[[1]])
    b4 = gsub(',','',b3)
    b5 = intersect(as.matrix(deg_list),b4)
    Table5 = data.frame()
    for (i in 1:length(species))
    {
    link1 = "http://rest.kegg.jp/link/"
    Link1 = paste0(link1,species[i],"/enzyme")
    Table1 = readLines(Link1)
    Table2 = t(data.frame(strsplit(Table1,'\t')))
    Table3 = cbind(kegg_enzymes = as.character(Table2[,1]),
    kegg_genes = as.character(Table2[,2]))
    Table5 = rbind(Table5,Table3)
    }
    kegg_enzymes = as.matrix(unique(Table5[,1]))
    uniq_list = as.data.frame(Table5[,1])
    colnames(uniq_list) = c("list")
    uniq_list = as.data.frame(uniq_list[order(uniq_list$list),])
    dup=duplicated(uniq_list)
    uniq_list = as.matrix(uniq_list[dup,])
    uniq_list = setdiff(kegg_enzymes,uniq_list)
    not_uniq_list = setdiff(kegg_enzymes,uniq_list)
    if (missing(correction_file_name))
    {
    Table6 = Table5[Table5$kegg_genes %in% b5,] #==
    }
    else
    {
    cc = read.csv(correction_file_name,header=FALSE)
    colnames(cc) = c('new','kegg_genes')
    Table5b = merge(Table5,cc,by = 'kegg_genes')
    Table5 = Table5b[,2:3]
    colnames(Table5)[2] = "kegg_genes"
    Table6 = data.frame()
    for (x in 1:length(b5))
    {
    Table6 = rbind(Table6,
    Table5[as.character(Table5$kegg_genes) == b5[x],])
    }
    }
    Table1b = readLines("http://rest.kegg.jp/list/enzyme")
    Table2b = t(data.frame(strsplit(Table1b,'\t')))
    Table3b = cbind(kegg_enzymes = as.character(Table2b[,1]),
    enzyme_discription = as.character(Table2b[,2]))
    if (deg == TRUE)
    {return (merge(Table6,Table3b,by="kegg_enzymes"))}
    else if (deg == FALSE)
    {return (merge(Table5,Table3b,by="kegg_enzymes"))}
    write.table(Table5,paste0(a1,"_enzymes.csv"),row.names = FALSE,sep=",")
    write.table(Table6,paste0(a1,"_de_enzymes.csv"),
    row.names = FALSE,sep=",")
}
