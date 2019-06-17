setwd("C:/Users/Zuhaib Ahmed/Desktop/Machine Learning/Assignment 5/HMP_Dataset")

#Gets all the data into a list of vectors, then combines it all into a vector.
#Each element of a vector is a string of three numbers separated by space". e.g.
#[1] "22 49 35" "22 49 35" "22 52 35"
og_path <- getwd()
data <- lapply(dir(getwd()), function(x) {
  # print(paste0(og_path, "/", x))
  setwd(paste0(og_path, "/", x))
  lines <- lapply(dir(getwd(), ".txt"), function(y) {
    return(readLines(y))
  })
  vec <- unlist(lines)
  fold_1 <- as.integer(length(vec) / 3)
  fold_2 <- 2 * fold_1
  return(list(vec[1:fold_1], vec[(fold_1+1):fold_2], vec[(fold_2+1):length(vec)]))
})

#Looking at x values of "eating soup" action.
# eat_soup_x <- unlist(lapply(unlist(data[[7]]), function(x) {s <- strsplit(x, " "); return(as.integer(s[[1]][1]))}))
# plot(c(1:length(eat_soup_x)), eat_soup_x, type = "n")
# lines(c(1:length(eat_soup_x)), eat_soup_x, type = "l")


#run_kmeans <- function(segment_length) {
  #Splits data into training and test
  split <- lapply(data, function(x) {
    train <- sample(c(1:3), 2)
    test <- setdiff(c(1:3), train)
    return(list(unlist(x[train]), unlist(x[test])))
  })
  training <- unlist(lapply(split, function(x) {
    return(x[[1]])
  }))
  training <- do.call(rbind,lapply(training, function(x) return(unlist(strsplit(x, " ")))))
  training <- t(training)
  lst <- lapply(c(1,which(1:ncol(training) %% 32 == 0) + 1), function(x) {
    if (x + 31 <= ncol(training)) {
      return(c(training[,x:(x+31)]))
    } else {
      return(NA)
    }
  })
  if (is.na(lst[[length(lst)]])) {
    lst <- lst[-length(lst)]
  }
  training <- do.call(rbind, lst)
  clusters <- kmeans(training, 14)
  
  testing <- unlist(lapply(split, function(x) {
    return(x[[2]])
  }))
  
  
  testing <- do.call(rbind,lapply(testing, function(x) return(unlist(strsplit(x, " ")))))
  
  
#}

