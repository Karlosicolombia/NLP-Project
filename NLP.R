 load("satoshi.csv")
 load("brittish.txt")
 load("american.txt")
 
 library(tidyverse)
 library(tokenizers)
 library(quanteda)
 library(stringr)
 library(qdap)
 
 words <- read_lines("satoshi.csv")
 words <- unlist(strsplit(as.character(words), ","))

 
 brittishwords <- read.csv("brittish.csv")
 brittishwords <- unlist(strsplit(as.character(brittishwords), ","))
 brittishwords <- strip(brittishwords)
 
 americanwords <- read.csv("american.csv")
 americanwords <- unlist(strsplit(as.character(americanwords), ","))
 americanwords <- strip(americanwords)




words2 <- tolower(words1)
brittishwords <- tolower(brittishwords)
americanwords <- tolower(americanwords)






brittishmatches <- 0 

for (i in 1:length(words1)){
  for (y in 1:length(brittishwords)){
    ifelse(brittishwords[y] == words1[i], brittishmatches <- brittishmatches+1,brittishmatches <- brittishmatches+0)
    
  }
}
print(brittishmatches)


americanmatches <- 0



for (i in 1:length(words1)){
  for (y in 1:length(americanwords)){
    ifelse(americanwords[y] == words1[i], americanhmatches <- americanmatches+1, americanmatches <- americanmatches+0)
    
  }
}
print(americanmatches)

brittishmatches <- 0 

for (i in 1:length(words)){
    str_detect(words[i], "ou")
    
  }

print(brittishmatches)