LIST=$1
INPUT=$2
OUTPUT=$3
blast=$4 #blastp, blastx, blastn, tblastn
RATIO=$5
SIMILARITY=$6

L=$(cat $LIST)
input=$INPUT
#input="input.fasta"

for i in $L
	do
	rm -r temp
	mkdir temp
	wget http://rest.kegg.jp/link/pathway/$i -O list_$i
	cat list_$i|cut -f 1|sort|uniq > List_$i
	list2=$(cat List_$i)
	for i2 in $list2
		do
		  wget http://rest.kegg.jp/get/$i2/aaseq -O asd$i2
		done

	cat asd* > fasta_$i
	rm asd*
	mv fasta_$i temp/
	rm list_$i
	rm List_$i
done

cat temp/* > query
rm -r temp
makeblastdb -dbtype prot -in $input
blastp -db ./$input -query query -out output.csv -outfmt "6 qlen length evalue qseqid sseqid pident"  -evalue 0.0001 -max_target_seqs 1
cat output.csv|awk '{if(($2/$1)*100 > $RATIO && $6 > $SIMILARITY) print $5, $4}' |sort|uniq |sed 's\ \,\g' |sed 's/|/_/g'  > $OUTPUT
rm $input.*
rm output.csv