# Test script to verify all new functions work
library(devtools)

# Load the package
load_all()

# Test basic functionality
cat("Testing basic functions...\n")

# Test color functions
tryCatch({
  show_furmanu_palettes()
  cat("✓ show_furmanu_palettes() works\n")
}, error = function(e) cat("✗ show_furmanu_palettes() failed:", e$message, "\n"))

# Test palette info
tryCatch({
  info <- palette_info("main")
  cat("✓ palette_info() works\n")
}, error = function(e) cat("✗ palette_info() failed:", e$message, "\n"))

# Test contrast checking
tryCatch({
  contrast <- check_contrast("main")
  cat("✓ check_contrast() works\n")
}, error = function(e) cat("✗ check_contrast() failed:", e$message, "\n"))

# Test accessible combinations
tryCatch({
  accessible <- accessible_combinations("main")
  cat("✓ accessible_combinations() works\n")
}, error = function(e) cat("✗ accessible_combinations() failed:", e$message, "\n"))

# Test export function
tryCatch({
  exported <- export_palette("cool", format = "hex")
  cat("✓ export_palette() works\n")
}, error = function(e) cat("✗ export_palette() failed:", e$message, "\n"))

# Test extract colors
tryCatch({
  colors <- extract_colors("main", n = 3)
  cat("✓ extract_colors() works\n")
}, error = function(e) cat("✗ extract_colors() failed:", e$message, "\n"))

cat("\nAll tests completed!\n")
