# Week 6

## Exercises
In this section, you should provide a **bulleted list** of **links** to exercise chapters you worked on this week. At a minimum, we expect to see substantial progress on the exercises discussed in class (remember, you should be pushing commits to the work you are doing in the `book-exercises-USER-NAME/` repository). For each link (chapter), include a brief note about which skills are covered in the exercise (this will be helpful to come back to!). Feel free to link to the entire chapter, or a specific exercise. For example:

- [Chapter 14, exercise 1](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-14-exercises/exercise-1/exercise.R): reading and querying a web API
- [Chapter 14, exercise 2](https://github.com/info201b-w19/exercises-yukisea/blob/master/chapter-14-exercises/exercise-2/exercise.R): Learned working with data APIs

## New Skills and Challenges
In this section, describe the new skills you acquired and challenges you encountered. The format is up to you -- feel free to use a list, a table, sub-headers, or any other format you see fit. Identifying concepts that you find difficult can help you round out your skills in a systematic way.

>New skills we learned this week is about `API` and in homework, I learned `R markdown`, `plotly` and `leaflet`.
## Specific Code Sections
In this section, add _at least_ 3 code blocks containing code that you found helpful this week. This is your opportunity to keep track of syntax/code skeletons so you can easily come back to them for future use! Make sure to use **code block formatting** and **include comments** with the code. Feel free to also include images, links, or other content that makes this more useful for you!

```r
# leaflet
# set data
leaflet(data = dt)

# make map
addTitles()

# set circlemarker
addCircleMarkers(
    lat = ~lat,
    lng = ~ long,
    radius = 10,
    stroke = FALSE,
    popup = ~ date,
    label = ~ paste0("death: ", num_killed, "\n injury: ", num_injured),
    clusterOptions = markerClusterOptions()
  )
```

```r
# plotly
plot_ly(data = shootings_state, x = ~state, y = ~deaths,
                name = "deaths", type = "bar")
# add trace
add_trace(y = ~injuries, name = "injuries")
# modify title and label
layout(title = "Victims of each state", yaxis = list(title = "number of people"))
```

```r
# Convert the content variable from a JSON string into a data frame
fromJSON(response_text)
```


## Goals for the upcoming week
What are your goals for the upcoming week? Are there any questions that you have that you hope to answer in the coming week?They can be specific and technical (e.g., _practice XX_) or general and more personal (e.g., _work more efficiently on homeworks_). Again, the format here is up to you -- this is also a great place to express your goals and areas of confusion to the TAs so they can provide better support!

> I'm confused about the concept of API, so I want to learn about it more and more.
