# Write function that provides summary information of dataset

intro_function <- function(dataset) {
  result <- list()
  result$rows <- nrow(dataset)
  result$columns <- ncol(dataset)
  result$max_population <- data %>%
    filter(population == max(population)) %>%
    select(country_name)
  result$worst_gini <- data %>%
    filter(gini_index > 0) %>%
    filter(gini_index == min(gini_index)) %>%
    select(country_name)
  result$max_unemployment <- data %>%
    filter(unemployment_pct == max(unemployment_pct)) %>%
    select(country_name)
  result$max_unemployment <- data %>%
    filter(unemployment_pct == max(unemployment_pct)) %>%
    select(unemployment_pct)
  return(result)
}
