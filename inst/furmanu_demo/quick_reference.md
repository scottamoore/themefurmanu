# themefurmanu Quick Reference

## The Core Approach

**One function, many possibilities!** Instead of memorizing different function names, use:

```r
scale_color_furmanu(palette = "name", discrete = TRUE/FALSE, ...)
scale_fill_furmanu(palette = "name", discrete = TRUE/FALSE, ...)
```

## Decision Tree

### 1. What type of data do you have?

**Categorical** (species, groups, factors)
- ✅ Use `discrete = TRUE`
- 📝 Choose: `"main"` (≤6 categories) or `"cool"` (≤3 categories)

**Continuous Sequential** (temperature, scores - one direction)  
- ✅ Use `discrete = FALSE`
- 📝 Choose: `"sequential1"`, `"sequential2"`, or `"sequential3"`

**Continuous Divergent** (deviations, differences - two directions)
- ✅ Use `discrete = FALSE, midpoint = 0`
- 📝 Choose: `"divergent1"`, `"divergent2"`, or `"divergent3"`

## Available Palettes

| Palette | Type | Colors | Best For |
|---------|------|--------|----------|
| `main` | Categorical | 6 | Multiple distinct categories |
| `cool` | Categorical | 3 | Few categories, cool tone |
| `sequential1` | Sequential | 2+ | Light blue → Royal blue |
| `sequential2` | Sequential | 2+ | Light gray → Midnight purple |
| `sequential3` | Sequential | 2+ | Light gray → Purple |
| `divergent1` | Divergent | 3+ | Red ← Light gray → Purple |
| `divergent2` | Divergent | 3+ | Royal blue ← Light gray → Midnight purple |
| `divergent3` | Divergent | 3+ | Red ← Light gray → Green |
| `gray` | Monochrome | 3 | Grayscale presentations |
| `evaluate` | Special | 3 | Performance (Red=poor, Yellow=ok, Green=good) |

## Common Patterns

### Categorical Scatter Plot
```r
ggplot(data, aes(x, y, color = group)) +
  geom_point() +
  scale_color_furmanu(palette = "main", discrete = TRUE) +
  theme_furmanu()
```

### Continuous Heatmap
```r
ggplot(data, aes(x, y, fill = value)) +
  geom_tile() +
  scale_fill_furmanu(palette = "sequential1", discrete = FALSE) +
  theme_furmanu()
```

### Divergent from Zero
```r
ggplot(data, aes(x, y, color = deviation)) +
  geom_point() +
  scale_color_furmanu(palette = "divergent1", discrete = FALSE, midpoint = 0) +
  theme_furmanu()
```

### Bar Chart
```r
ggplot(data, aes(x = category, fill = category)) +
  geom_col() +
  scale_fill_furmanu(palette = "cool", discrete = TRUE) +
  theme_furmanu()
```

## Theme Variants

- `theme_furmanu()` - Standard theme
- `theme_furmanu_presentation()` - Larger fonts for slides  
- `theme_furmanu_minimal()` - Clean, minimal style

## Utility Functions

```r
# Explore palettes
show_furmanu_palettes()
list_palettes()
palette_info("main")

# Check accessibility
check_contrast("main")
accessible_combinations()

# Export palettes
export_palette("cool", format = "css")
export_palette("divergent1", format = "json")

# Extract specific colors
extract_colors("main", n = 8)
furmanu_cols("purple", "gray")
```

## Common Mistakes

❌ **Wrong discrete setting**
```r
# Wrong: continuous data with discrete=TRUE
scale_color_furmanu(palette = "sequential1", discrete = TRUE)  # Only 2 colors!
```

✅ **Correct**
```r
# Right: continuous data with discrete=FALSE  
scale_color_furmanu(palette = "sequential1", discrete = FALSE) # Smooth gradient
```

❌ **Missing midpoint for divergent**
```r
# Wrong: divergent without midpoint
scale_color_furmanu(palette = "divergent1", discrete = FALSE)
```

✅ **Correct**
```r
# Right: divergent with midpoint
scale_color_furmanu(palette = "divergent1", discrete = FALSE, midpoint = 0)
```

❌ **Wrong palette type**
```r
# Wrong: sequential for categories
scale_color_furmanu(palette = "sequential1", discrete = TRUE)  # Only 2 groups!
```

✅ **Correct**
```r
# Right: categorical for categories
scale_color_furmanu(palette = "main", discrete = TRUE)        # Up to 6 groups
```

## Getting Help

```r
?scale_color_furmanu    # Function help
open_furmanu_demo()     # Comprehensive examples  
show_furmanu_palettes() # Visual palette overview
```
