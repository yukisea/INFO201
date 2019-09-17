# load relevant libraries
library("httr")
library("jsonlite")
library("dplyr")
library("ggplot2")

#load apikey
source("api-keys.R")
source("civic-info.R")
# Construct a search query for the  API's Business Search endpoint
base_uri_pro <- "https://api.propublica.org/congress/v1"
resource_pro <- "/members"
search_uri_pro <- paste0(base_uri_pro, resource_pro)
chamber = "house"
state = address_state

# get data
uri_pro = paste0(search_uri_pro, "/", chamber, "/", state, "/current.json")
response_pro <- GET(uri_pro, add_headers("X-API-Key" = api_key)) 
content_pro <- content(response_pro, "text") 
parsed_data_pro <- fromJSON(content_pro)
results <- parsed_data_pro$results

# draw a plot
plot_gen <- ggplot(data = results) + 
  geom_bar(mapping = aes(gender)) +
  labs(title="Representatives by Gender") +
  theme_classic() +
  coord_flip()

# another one
plot_par <- ggplot(data = results) +
  geom_bar(mapping = aes(party)) +
  labs(title="Representatives by Party") +
  theme_classic() +
  coord_flip()

# Selected Representative Information
# from representative
id <- results$id[1]
uri_rep <- paste0("https://api.propublica.org/congress/v1/members/", id, ".json")
uri_vo <- paste0("https://api.propublica.org/congress/v1/members/", id, "/votes.json")

# get information
response_rep <- GET(uri_rep, add_headers("X-API-Key" = api_key))
content_rep <- content(response_rep, "text")
parsed_data_rep <- fromJSON(content_rep)

# manipulating
results_rep <- parsed_data_rep$results
twitter_link <- paste0("https://twitter.com/", results_rep$twitter_account)
name <- paste0(results_rep$first_name," ", results_rep$last_name)
age <- length(seq(as.Date(results_rep$date_of_birth), Sys.Date(), "year"))-1

# Selected Representative Information
# from voting pattern
# get information
response_vo <- GET(uri_vo, add_headers("X-API-Key" = api_key))
content_vo <- content(response_vo, "text")

# parse data
parsed_data_vo <- fromJSON(content_vo)
results_vo <- parsed_data_vo$results

# manipulating
vote <- results_vo$votes
vote_summary <- vote[[1]]
vote_pattern <- vote_summary$total %>%
  mutate(position = vote_summary$position) %>%
  mutate(diff = yes - no)
accordance_rate = (nrow(subset(subset(vote_pattern, diff >= 0), position == "Yes")) +
  nrow(subset(subset(vote_pattern, diff < 0), position == "No"))) / nrow(vote_pattern) * 100
