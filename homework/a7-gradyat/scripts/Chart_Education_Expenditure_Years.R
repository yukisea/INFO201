Education_Expenditure_Year <- function(data){
	data <- data %>% 
				select("education_expenditure_per_person", "school_life_expectancy_years")
    data <- do.call("cbind", lapply(data, as.numeric)) %>% as.data.frame()
    data <- data[complete.cases(data), ]
	p1 <- ggplot(data, aes(y = education_expenditure_per_person, x = school_life_expectancy_years)) + 
	          geom_point() + 
	          ylab("Education Expenditure Per Person") + 
	          xlab("School Life Expectancy Years") +
	          ggtitle("Eduction Expenditure VS. Expectancy Years") + 
	          theme(
					plot.title = element_text(size = 16, face = "bold", hjust = 0.5), 
					axis.text=element_text(size=16, face="bold"),
        			axis.title=element_text(size=16, face="bold"), 
        			strip.text = element_text(size=16))
	p2 <- ggplot(data, aes(y = log(education_expenditure_per_person), x = school_life_expectancy_years)) + 
	          geom_point() + 
	          ylab("Log of Education Expenditure Per Person") + 
	          xlab("School Life Expectancy Years") +
	          ggtitle("Eduction Expenditure VS. Expectancy Years") + 
	          theme(
					plot.title = element_text(size = 16, face = "bold", hjust = 0.5), 
					axis.text=element_text(size=16, face="bold"),
        			axis.title=element_text(size=16, face="bold"), 
        			strip.text = element_text(size=16))
	return(ggarrange(p1, p2, common.legend = TRUE))
}
