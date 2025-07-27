# Test package help documentation
library(devtools)
load_all()

cat("=== Testing Package Help ===\n")
cat("Running help(package = 'themefurmanu')...\n\n")

# Test package help
help(package = "themefurmanu")

cat("\n=== Testing ?? Search ===\n")
cat("This should show comprehensive package documentation...\n")

# The ?? function should now show the comprehensive package docs
