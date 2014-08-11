
files <- grep("\\.csv|\\.txt", dir(), value=TRUE)

fileStatus <- sapply( files, function(f) {
  tryCatch( {foo <- read.file(f); "readable" }, error = function(e) gsub("\\n", "", gsub("[^:]+ : ","", as.character(e))) )
})

tally( ~fileStatus )

fileStatus[fileStatus != "readable"]
