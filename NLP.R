 load("satoshi.csv")
 load("brittish.txt")
 load("american.txt")
 
 library(tidyverse)
 library(tokenizers)
 library(quanteda)
 library(stringr)
 library(qdap)
 library(stringr)
 
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



#This was my first version of analyzing the text satoshi.csv with a small dataset of English and American words.
#With this method I found no matches, which could be because of the small dataset of words, which simply was not used in 
#The forum posts from Satoshi Nakamoto where code was the main thing discussed. 
#https://satoshi.nakamotoinstitute.org/posts/ This is the source of satoshi.csv



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





#This is the start of the second way to analyse the satoshi.csv for differences in spelling.
#https://www.oxfordinternationalenglish.com/differences-in-british-and-american-spelling/ This source is where I took the information
#to define spelling differences between the two "languages"


brittishmatchesonspelling <- 0 

for (i in 1:length(words)){
   if(str_detect(words[i], "our") == TRUE){
     brittishmatchesonspelling <- brittishmatchesonspelling + 1
   }
  if(str_detect(words[i], "ise") == TRUE){
     brittishmatchesonspelling <- brittishmatchesonspelling + 1
   }
  if(str_detect(words[i], "yse") == TRUE){
     brittishmatchesonspelling <- brittishmatchesonspelling + 1
   }
  if(str_detect(words[i], "ence") == TRUE){
     brittishmatchesonspelling <- brittishmatchesonspelling + 1
   }
  
    
  }



americanmatchesonspelling <- 0 

for (i in 1:length(words)){
  if(str_detect(words[i], "or") == TRUE){
    americanmatchesonspelling <- americanmatchesonspelling + 1
  } 
  if(str_detect(words[i], "ize") == TRUE){
    americanmatchesonspelling <- americanmatchesonspelling + 1
  } 
  if(str_detect(words[i], "yze") == TRUE){
    americanmatchesonspelling <- americanmatchesonspelling + 1
  }
  if(str_detect(words[i], "ense") == TRUE){
    americanmatchesonspelling <- americanmatchesonspelling + 1
  }
  
  
}

Bar <- c(americanmatchesonspelling,brittishmatchesonspelling)
N <- c("American", "Brittish")
barplot(Bar, names.arg=N, xlab = "Languages", ylab = "Number of Occurences", col = "red")

#The Bargraph shows us that American spelling occurs much more often than the british version. Which tells us Satoshi Nakamoto is either American or a non-native speaker of English 
#That has learned the American Spelling.
#The Occurence of Brittish spelling tells us that it also could be the case that more than one writer has been answering posts 
#under the pseudonym Satoshi Nakamoto

