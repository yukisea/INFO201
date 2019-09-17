# load relevant libraries
library("httr")
library("jsonlite")
library("dplyr")

#load apikey
source("api-keys.R")

address_street <- "1263 Pacific Ave. Kansas City"
address_state <- "KS"
address <- paste0(address_street, ", ", address_state)

base_uri <- "https://www.googleapis.com/civicinfo/v2"
resource <- "/representatives"

search_uri <- paste0(base_uri, resource)
query_params <- list(key = api_key_civic, address = address)

# get information
response <- GET(search_uri, query = query_params)
content <- content(response, "text") 
parsed_data <- fromJSON(content)

# Data wrangling (assuming that `parsed_data` is the parsed JSON response)
offices <- parsed_data$offices
officials <- parsed_data$officials

# Expand officies by the number of elements in the `indices` column
# See: https://stackoverflow.com/questions/2894775/replicate-each-row-of-data-frame-and-specify-the-number-of-replications-for-each
#(Links to an external site.)Links to an external site.
num_to_rep <- unlist(lapply(parsed_data$offices$officialIndices, length))

expanded <- offices[rep(row.names(offices), num_to_rep),]

officials <- officials %>% mutate(index = row_number() -1)

expanded <- expanded %>% mutate(index = row_number() -1) %>% 
  rename(position = name)

# Combining
representative <- left_join(officials, expanded, by = "index")

# foramtting
representative$photoUrl[is.na(representative$photoUrl) == FALSE] <- paste0('<img src="',
                                                                           representative$photoUrl[is.na(representative$photoUrl) == FALSE], '" width="80px">')
# summarize
summary <- representative %>%
  select(name, position, party, emails, phones, photoUrl) 


