# http://stackoverflow.com/questions/9684671
set.seed(10)
activities <- data.frame(
  id = paste('x', "1.", 1:10, sep = ""),
  trt = sample(c('cnt', 'tr'), 10, T),
  work.T1 = runif(10),
  play.T1 = runif(10),
  talk.T1 = runif(10),
  work.T2 = runif(10),
  play.T2 = runif(10),
  talk.T2 = runif(10)
)


activities %>%
  gather(key, value, -id, -trt) %>%
  separate(key, into = c("location", "time")) %>%
  arrange(id, trt, time) %>%
  spread(location, value)
