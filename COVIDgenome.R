library(BiocManager) # This line loads a required library for use
library(sangerseqR) # This line loads a required library for use

NC_045512.2 <- scan("./sequence.gb", what="character", sep="\n") # This line imports the reference genome obtained from GenBank
NC_045512.2 <- gsub(".*1 *([gatc])","\\1",paste(NC_045512.2)) # This line removes everything before the DNA sequence
NC_045512.2 <- paste(NC_045512.2,collapse="") # This line collapses the vector into a single string
NC_045512.2 <- gsub('.*ORIGIN +', '', NC_045512.2) # This line removes all text before the sequence
NC_045512.2 <- gsub(' |//', '', NC_045512.2) # This line removes all spaces and "//" characters
NC_045512.2 <- gsub("([actg])","\\U\\1",NC_045512.2,perl=T) # This line converts all lower case letters into upper case ones

Protein <- substr(NC_045512.2, 21563, 25384) # This line creates a subset of the DNA sequence to isolate the portion coding for the S spike protein
paste(Protein) # This line is to visualize the Protein sequence

# This gene appears to be highly conserved as there are many sequence isolates which are 100% identical to the sequence used to BLAST search.
# This may be due to the novelty of this virus as it pertains to human health and study.
# SARS-CoV-2 has only recently been of such high interest across the globe, so the conservation may be caused by the lack of previous data to compare against.
# It may also be that this protein is essential for the proper functioning of the virus, and thus cannot afford a mutation which would affect performance.
