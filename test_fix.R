# Test script to verify font fix
library(devtools)
load_all()

library(ggplot2)

# Test the theme without warnings
p <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() +
    labs(title = "Test title", caption = "A demo caption") +
    theme_furmanu()

print("Plot created successfully")
print(p)

# Test font registration function
register_furmanu_fonts()
