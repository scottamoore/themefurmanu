% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_furmanu.R
\name{theme_furmanu}
\alias{theme_furmanu}
\title{Custom Furman ggplot2 Theme}
\usage{
theme_furmanu(base_size = 12, base_family = NULL)
}
\arguments{
\item{base_size}{Base font size.}

\item{base_family}{Optional override for base font family.}
}
\value{
A ggplot2 theme object.
}
\description{
Applies IBM Plex fonts and Furman styling.
}
\examples{
library(ggplot2)
register_furmanu_fonts()
ggplot(mtcars, aes(wt, mpg)) +
  geom_point() +
  labs(title = "Test title", caption = "A demo caption") +
  theme_furmanu()
}
