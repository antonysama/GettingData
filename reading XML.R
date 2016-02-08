setwd("c:/exercise")
getwd()
if(!file.exists("data")){
  dir.create("data")
}
install.packages("XML")
library(XML)
fileUrl<-"http://www.w3schools.com/xml/simple.xml"
doc<-xmlTreeParse(fileUrl,useInternal=T)
rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
rootNode[[1]][[1]]
xmlSApply(rootNode,xmlValue)
xpathSApply(rootNode,"//name",xmlValue)
xpathSApply(rootNode,"//price",xmlValue)

install.packages("XML")
library(XML)
fileUrl="http://www.ncbi.nlm.nih.gov/books/NBK3828/#publisherhelp.Example_of_a_Standard_XML"
doc=xmlTreeParse(fileUrl,useInternal=TRUE)
top=xmlRoot(doc)
xmlName(top)
names(top)
names( top[[ 1 ]] )
xmlSApply(art[[1]], xmlValue)
xmlSApply(art, function(x) xmlSApply(x, xmlValue))

install.packages("RCurl")
library("RCurl")
reply=getForm("http://www.zillow.com/webservice/GetSearchResults.htm",
              'zws-id' = "AB-XXXXXXXXXXX_10312q",
              address = "1093 Zuchini Way",
              citystatezip = "Berkeley, CA, 94212")
docs = xmlTreeParse(reply, asText = TRUE, useInternal = TRUE)
xmlValue(docs[["//amount"]])