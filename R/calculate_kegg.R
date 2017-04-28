#'calculate_kegg
calculate_kegg <- function(dataset,deg_list)
{
    Table4 = dataset[order(dataset$kegg_pathways),]
    kegg_uniq_genes = unique(Table4[,1])		
    kegg_uniq_pathways = unique(Table4[,2]) 
    N = length(kegg_uniq_genes)
    n = length(intersect(kegg_uniq_genes,deg_list))
    uniq_list = as.data.frame(Table4[,1])
    colnames(uniq_list) = c("list")
    uniq_list = as.data.frame(uniq_list[order(uniq_list$list),])
    dup=duplicated(uniq_list)
    uniq_list = uniq_list[dup,]
    uniq_list = as.character(intersect(kegg_uniq_genes,uniq_list))
    Results = data.frame()
    x1 = 1
    x2 = 1
    x3 = 0 
    d1 = ""
    d2 = ""
    d3 = ""
    for (i in 1:dim(Table4)[1])
    {
    x3 = i
    d1 = Table4[x3,2]
    if (x3 != dim(Table4)[1])
    {d2 = Table4[x3+1,2]}
    if (d1==d2)
    {
    x1 = x1 + 1
    dd3 = as.character(Table4[x3,1])
    d3 = c(d3,dd3)
    }
    else if (d1!=d2)
    {
    Results[x2,1] = Table4[x3,2]
    Results[x2,2] = x1
    d3 = d3[-1]
    Results[x2,3] = length(intersect(d3,deg_list))
    Results[x2,4] = phyper(Results[x2,3]-1,n,N-n,Results[x2,2],lower.tail=FALSE)
    Results[x2,5] = p.adjust(Results[x2,4], method = "bonferroni")
    Results[x2,6] = capture.output(cat(paste0(d3,",")))
    d3 =""
    x1 = 1
    x2 = x2 + 1
    }
    }
    Results[x2,1] = Table4[i,2]
    Results[x2,2] = x1-1
    Results[x2,3] = length(intersect(d3,deg_list))
    Results[x2,4] = phyper(Results[x2,3]-1,n,N-n,Results[x2,2],lower.tail=FALSE)
    Results[x2,5] = p.adjust(Results[x2,4], method = "bonferroni")
    d3 = d3[-1]
    Results[x2,6] = capture.output(cat(paste0(d3,",")))	
    colnames(Results) = c("map_numbers","background_gene_numbers",
			  "deg_gene_numbers","pvalue","adjusted_pvalue","gene_list")
    padj = p.adjust(Results[,4], method = "bonferroni")
    Results$adjusted_pvalue = padj	
    return(Results)
}
