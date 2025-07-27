# Test font fix
library(devtools)
load_all()

library(ggplot2)

# Test font checking
cat("=== Font Registration Check ===\n")
register_furmanu_fonts()

cat("\n=== Creating Test Plot ===\n")
# Test the theme
p <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() +
    labs(title = "Test title", caption = "A demo caption") +
    theme_furmanu()

cat("Plot created successfully!\n")

# Test with explicit font override
cat("\n=== Testing with IBM Plex (if available) ===\n")
p2 <- ggplot(mtcars, aes(wt, mpg)) +
    geom_point() +
    labs(title = "Test with IBM Plex", caption = "A demo caption") +
    theme_furmanu(base_family = "IBM Plex Sans")

cat("IBM Plex test completed!\n")

cat("\n=== Test Complete ===\n")
