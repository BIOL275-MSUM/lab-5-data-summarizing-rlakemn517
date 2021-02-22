
# Load Packages -----------------------------------------------------------

library(tidyverse)

iris <- as_tibble(iris) # so it prints a little nicer
iris

# Answering Assignment Questions ------------------------------------------

#Question 1

i2 <- rename(
  iris, 
  sepal_length = Sepal.Length,
  sepal_width = Sepal.Width,
  petal_length = Petal.Length,
  petal_width = Petal.Width,
  species = Species
  )
i2

#Question 2

numerical_mm <- mutate(i2, 
       sepal_length = sepal_length * 10,
       sepal_width = sepal_width * 10,
       petal_length = petal_length * 10,
       petal_width = petal_width * 10
       )
numerical_mm

#Question 3

i3 <- mutate(i2, sepal_area = sepal_length * sepal_width,
       petal_area = petal_length * petal_width)  

i4 <- select(i3, sepal_area, petal_area, species)
i4

#Question 4

i5 <- summarize(i3, sampl_size = n(),
          sl_max = max(sepal_length),
          sl_min = min(sepal_length),
          sl_range = sl_max - sl_min,
          sl_median = median(sepal_length),
          sl_iqr = IQR(sepal_length),
          q1 = quantile(sepal_length, probs = 0.25),
          q2 = quantile(sepal_length, probs = 0.75)
          )
 i5
 
#Question 5

 i3_grouped <- group_by(i3, species)
 
 summarize(i3_grouped, sampl_size = n(),
           pw_mean = mean(petal_width),
           pw_sd = sd(petal_width),
           pw_variance = var(petal_width),
           pw_sem = pw_sd/ sqrt(sampl_size),
           pw_95upper = pw_mean + 1.96 * pw_sem,
           pw_95lower = pw_mean - 1.96 * pw_sem
 )
 
#Question 6
 
 ggplot(data = i2) +
   geom_jitter(mapping = aes(x = species, y = petal_width)) 

#Question 7
 
 pl_summary <- 
   summarize(i3_grouped, 
             pw_mean = mean(petal_width),
             pw_sem = sd(petal_width)/ sqrt(n()),
             pw_95upper = pw_mean + 1.96 * pw_sem,
             pw_95lower = pw_mean - 1.96 * pw_sem
   ) 
 pl_summary
 
 ggplot(data = i2) +
   geom_jitter(mapping = aes(x = species, y = petal_width)) +
   geom_crossbar(
     data = pl_summary,
     mapping = aes(x = species, y = pw_mean, 
                   ymax = pw_95upper,
                   ymin = pw_95lower),
     color = "red"
   )

#Question 8
 
 ggplot(data = i2) +
   geom_point(mapping = aes(x = petal_length, y = petal_width, color = species))
 
 