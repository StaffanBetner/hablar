% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hablar.R
\name{s}
\alias{s}
\title{Make vector shorter and simpler}
\usage{
s(..., ignore_na = TRUE)
}
\arguments{
\item{...}{one or more vectors. Does not work for factors.}

\item{ignore_na}{if TRUE then NA omitted from results, as long as any non-NA element is left.}
}
\value{
a shortened and simplified vector
}
\description{
\code{s} means simple and short. It removes all non-values, i.e. \code{NA,Inf,NaN}  from a vector.
However, if the length is 0 it returns NA.
It is useful in combination with summary functions, e.g. mean, sum or min, when
an answer is desired, if there is one in the data. In any other case NA is returned. 
Type \code{vignette("s")} in the console for more information.
}
\examples{
\dontrun{
library(dplyr)

## s on a weird numeric vector
vector <- c(7, NaN, 6, -Inf, 5, 4, NA)
s(vector)

## Sum vector with non-rational values
vector <- c(7, NaN, -Inf, 4)
# Base R
sum(vector)
# With s
sum(s(vector))

## Max of vector with only NA
# Base R
max(vector, na.rm = TRUE)
# With s
max(s(vector))

## First of vector when NA is first element
vector <- c(NA, "X", "Y")
# dplyr R
first(vector)
# With s
first(s(vector))

## Use of s when NA should not be removes
vector <- c(7, Inf, NA, 4)
# Base R
sum(vector)
# With s
sum(s(vector, ignore_na = FALSE))

## s when summarizing a weird data.frame
df_test <- data.frame(a = c(NaN, 1, -Inf, 3), 
                      b = c(NA, "Q", "P", "P"), 
                      c = c(NA, NA, NA, NA), 
                      stringsAsFactors = FALSE) 
df_test

# Base R aggregation with dplyr's summarize
summarise(df_test, mean_a = mean(a), 
                   min_c = min(c, na.rm = TRUE))
# With s
summarise(df_test, mean_a = mean(s(a)), 
                   min_c = min(s(c)))
}
}
\seealso{
\code{\link{retype}}, \code{\link{rationalize}}, \code{vignette("s")}, \code{vignette("hablar")}
}
