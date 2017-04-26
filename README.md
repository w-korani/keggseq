# keggseq:
The package 'keggseq' was developed to apply KEGG enrichment analysis mainly for ployploids utilizing their sub-genomes. ‘keggseq’ provides some advantages over the available tools:
1. It allows applying KEGG enrichment analysis for diploids or ployploids with any levels of gene duplications.
2. It generates ready-to-published graphs.
3. It produces graphs of interested pathways that have differentially expressed enzymes marked.
4. It generates csv files containing detailed information of enzymes included in the interested pathways.
5. It allows correcting genes IDs if the user wants to use annotation different from Kyoto Encyclopedia of Genes and Genomes annotation.
6. It is a run-time package since the data is downloaded directly from Kyoto Encyclopedia of Genes and Genomes database so it does not require an internal database for specific species.
7. It is step-by-step and easy to be implemented.

Citation: The publication will be published soon

Installation:

          devtools::install_github("w-korani/keggseq")


Implementation: (Vignettes contains detail information is available), quick implantation is writing in the following for simplicity: 

1.	The available species in KEGG data base can be viewed using the function list_species(), the function shows the available genomes and the abbreviations. The function allow also passing searching keywords

Example:
          
          a <- list_species()
          a <- list_species("arachis")
2.	The interested KEGG data, one or multiple genomes, is transferred using grep_datasets using the abbreviations.

Example:
        
        b <- grep_datasets(c("adu","aip"))
          
3.	OPTIONAL: If the user has different annotation than this of KEGG database, correction should be applied. The user is free to prepare the correction file using any method. However, the file should be in a format of csv containing two columns without column or row names. The first column is the new IDs and the second column is KEGG IDS.
          
* for similarity, we prepared a shell script to create such list, the user can apply protein sequence or DNA sequence of the new annotation in fasta file.

./conversion.sh input_list input.fasta output_list.csv blast_type ratio similarity

*. List: a file contains the abbreviations of interested genome/genomes, one genome/line:
Example:
adu
aip

*. input.fasta: the file contains protein or DNA sequence of the new annotation.

*. output_list.csv: the file specify by the user to hold the outputs.

*. Blast_type: the user should choose of of blast algorithms, i.e., blastp, blastx, blastn, tblastn.

Note: BLAST+ should be available

*. Ratio: the percentage of query sequence/alignment length

*. Similarity: the percentage of similarity between the query and the hits

Example:
./conversion.sh list input.fasta new_ids.csv blastp 75 75

Example:

          c = corrected_datasets_ids(b,'output_list.csv')
4.	Calculating the probabilities of the pathways 

Example:
          
          d = calculate_kegg(c,edger_de_HL)
5.	Creating summary of the results:

Example:

          e = kegg_summary(d)

6.	Creating plots:

Examples:

          create_plot(d)
          create_filtered_plot(d, “qvalue","<0.01")
          create_filtered_plot(d,”deg_gene_numbers”,”>10”)
![plot_ex](https://cloud.githubusercontent.com/assets/21265433/25447237/a99af53c-2a71-11e7-82d6-0053fec7c5ee.jpeg)
7.	OPTIONAL: createing KEGG pathway graphs or enzyme details.

Example:

          enz = kegg_map_enzymes(c,deg_list,"00480","new_ids.csv",TRUE)
          create_kegg_map(c("adu","aip"),c,deg_list,"00480","new_ids.csv")
