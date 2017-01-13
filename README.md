# keggseq:
R package and Unix shell script for KEGG enrichment analsyis of RNA-seq data
the package allows combining databases, it is a run time packgage since it retrieves the dataset directly form KEGG databases, it creates graphs which are read to be published with allowing filtering arguments

Package: 	keggseq
Title: 		KEGG analysis and visualizing of differentially expressed genes
Version: 	0.1
Authors@R: 	person("Walid", "Korani", email = "korani@uga.edu",
                  	role = c("aut", "cre"))
Description: 	The package do a run time KEGG analysis from the original database, different functions are included to find, grep and combine the interested datasets. It produces the plain text results in addition to graphs which is read to be published.
Depends:	R (>= 3.2.2)
License: 	MIT License
LazyData: 	true
Imports: 	ggplot2, qvalue
URL: 		https://github.com/w-korani/keggseq
