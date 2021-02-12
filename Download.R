# we will now add the required lines to proceed with this assignment.
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") # This line creates a list of data files
library(rentrez)  # This line loads the rentrez library for use
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") # This line downloads data from NCBI databases, specifically the ones listed above

Sequences <- strsplit(Bburg, split = '\n\n') # Using strsplit(), we can now create a new object called "Sequences" that will contain an element for each sequence
print(Sequences) # This line allows us to visualize Sequences

Sequences <- unlist(Sequences) # COnverts "Sequences" into a vector
header <- gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences) # Isolates the data identifiers
seq <- gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences) # Isolates the sequences
Sequences <- data.frame(Name = header, Sequence = seq) # Creates a dataframe using "header" and "seq"
Sequences$Name <- gsub('\\n', '', Sequences$Name) # This step removes the newline symbols from the "Name" column
Sequences$Sequence <- gsub('\\n', '', Sequences$Sequence) # This step removes the newline symbols from the "Sequence" column

write.csv(Sequences, file = 'Sequences.csv', row.names = F) # This line saves the dataframe as a csv file

# Next, we will create an R markdown script called "Analysis.Rmd" where we we will continue with part 1
