library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
download.file(fileUrl, destfile = "foo.xml")
doc <- xmlTreeParse("foo.xml", useInternal=TRUE)
root_node <- xmlRoot(doc)
xmlName(root_node)

root_node[[1]]
root_node[[1]][[1]]
# get all values
xmlSApply(root_node, xmlValue)
# Get all names
names1 <- xpathApply(root_node,'//name',xmlValue)
prices1 <- xpathApply(root_node,'//price',xmlValue)
prices2 <- xpathApply(doc,'//price',xmlValue)


###

library(jsonlite)
jsonData <- fromJSON('https://api.github.com/users/jtleek/repos')
names(jsonData)
names(jsonData$owner)
jsonData$owner$login



### Data Table faster than Dataframe
library(data.table)
df <- data.frame(x=rnorm(9),y=rep(c('a','b','c'),each=3),z = rnorm(9))
dt <- data.table(x=rnorm(9),y=rep(c('a','b','c'),each=3),z = rnorm(9))

#subset
df[2,]
dt[2,]

df[df$x > 1,]
dt[dt$z < 1,]


dt[,c(1,2)]
dt[,list(mean(x),sum(z))]
dt[,c(mean(x),sum(z))]
dt[,table(y)]

# Add column
dt[,w := z^2]
dt[,m := {tmp <- (z+x); log2(tmp + 2)}]
dt[,a := x>2]
dt[,b := mean(x+z), by=a]

# Using keys to merge
dt1 <- data.table(x=c('a','b','c','dt1'),y = 1:4)
dt2 <- data.table(x = c('b','c','d','dt2'), z = 8:11)
setkey(dt1,x)
setkey(dt2,x)
merge(dt1,dt2)
