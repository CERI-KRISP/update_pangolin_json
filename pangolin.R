library(rjson)
library(jsonlite)
library(readr)

Africa_set_Pangolin_4Nov <- read_csv("pangolin_json/Africa_set_Pangolin_4Nov.csv")
pangolin <- rjson::fromJSON(file = "pangolin_json/pangolin.json")

for(i in 1:nrow(Africa_set_Pangolin_4Nov)){
  seq <- Africa_set_Pangolin_4Nov[i, "Sequence name"]
  lineage <- Africa_set_Pangolin_4Nov[i, "Lineage"]
  message(seq)
  pangolin[["nodes"]][[paste0(seq)]][["pangolin_lineage"]] <- lineage
  print(pangolin[["nodes"]][[paste0(seq)]][["pangolin_lineage"]])
}

toJSON(pangolin, pretty = TRUE, auto_unbox = TRUE)
write_json(pangolin, path="pangolin_json/new_pangolin.json", pretty = TRUE, auto_unbox = FALSE)

