


#The jsonlite package is a JSON parser/generator for R which is optimized for pipelines and web APIs. 
library(jsonlite)

library(curl)

#url for the top stories, and the API key is added to that
url <-"http://api.nytimes.com/svc/topstories/v1/home.json?api-key=c7fe74e2f33fe43d639c660b2efcea3b:16:71850816"
req <-fromJSON(url)
topstories <-req$results
class(req)
topstories.dataframe <-as.data.frame(req)
colnames(topstories.dataframe)

# display a subset of the list of topstories
subset(topstories.dataframe,select =c("results.subsection","results.title","results.abstract","results.url"))
