# Define Furman University colors

#' Furman University brand colors (hex codes)
#'
#' A named vector of Furman University color hex codes based on the official
#' brand guidelines, with additional complementary colors for data visualization.
#'
#' @format A named character vector with 10 color definitions:
#' \describe{
#'   \item{purple}{#582c83 - Primary brand purple}
#'   \item{midnight purple}{#201547 - Dark accent purple}
#'   \item{gray}{#54585a - Primary neutral gray}
#'   \item{light blue}{#aadeeb - Accent light blue}
#'   \item{red}{#e3322b - Alert/emphasis red}
#'   \item{yellow}{#f2be1a - Accent yellow}
#'   \item{green}{#669933 - Success/positive green}
#'   \item{light gray}{#f5f5f5 - Light neutral}
#'   \item{medium gray}{#c0c0c0 - Medium neutral}
#'   \item{royal blue}{#4169E1 - Accent blue}
#' }
#'
#' @examples
#' # View all available colors
#' furmanu_colors
#'
#' # Access specific colors
#' furmanu_colors["purple"]
#' furmanu_colors[c("purple", "gray")]
#'
#' @seealso \code{\link{furmanu_cols}} for extracting colors by name,
#'   \code{\link{furmanu_palettes}} for pre-defined color palettes
#'
#' @export
furmanu_colors <- c(
  `purple` = "#582c83",
  `midnight purple` = "#201547",
  `gray` = "#54585a",
  `light blue` = "#aadeeb",
  `red` = "#e3322b",
  `yellow` = "#f2be1a",
  `green` = "#669933",
  `light gray` = "#f5f5f5",
  `medium gray` = "#c0c0c0",
  `royal blue` = "#4169E1"
)

#' Extract Furman University colors by name
#'
#' Function to extract specific Furman University colors by their names.
#' If no names are provided, returns all available colors.
#'
#' @param ... Character names of Furman colors to extract. Must match names
#'   in \code{\link{furmanu_colors}}. Available colors: "purple", "midnight purple",
#'   "gray", "light blue", "red", "yellow", "green", "light gray", "medium gray",
#'   "royal blue".
#'
#' @return A character vector of hex codes. If no arguments provided, returns
#'   all colors in \code{\link{furmanu_colors}}.
#'
#' @examples
#' # Get all colors
#' furmanu_cols()
#'
#' # Get specific colors
#' furmanu_cols("purple")
#' furmanu_cols("purple", "gray", "light blue")
#'
#' # Use in a plot
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point(color = furmanu_cols("purple")) +
#'   theme_minimal()
#'
#' @seealso \code{\link{furmanu_colors}} for the complete color definitions,
#'   \code{\link{furmanu_palettes}} for pre-defined color combinations
#'
#' @export
furmanu_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (furmanu_colors)
  
  # Check for invalid color names
  invalid_colors <- cols[!cols %in% names(furmanu_colors)]
  if (length(invalid_colors) > 0) {
    available_colors <- paste(names(furmanu_colors), collapse = ", ")
    stop("Color(s) not found: ", paste(invalid_colors, collapse = ", "), 
         ".\nAvailable colors: ", available_colors, call. = FALSE)
  }

  furmanu_colors[cols]
}

#' Furman University color palettes
#'
#' A list of pre-defined color palettes using Furman University colors,
#' designed for different types of data visualization needs.
#'
#' @format A named list with 10 color palettes:
#' \describe{
#'   \item{main}{6-color categorical palette: purple, gray, light blue, red, yellow, green}
#'   \item{cool}{3-color cool palette: green, light blue, gray}
#'   \item{gray}{3-color monochrome palette: gray, light gray, medium gray}
#'   \item{divergent1}{3-color divergent palette: red to light gray to purple}
#'   \item{divergent2}{3-color divergent palette: royal blue to light gray to midnight purple}
#'   \item{divergent3}{3-color divergent palette: red to light gray to green}
#'   \item{sequential1}{2-color sequential palette: light blue to royal blue}
#'   \item{sequential2}{2-color sequential palette: light gray to midnight purple}
#'   \item{sequential3}{2-color sequential palette: light gray to purple}
#'   \item{evaluate}{3-color evaluation palette: red, yellow, green (poor to excellent)}
#' }
#'
#' @section Usage Guidelines:
#' \itemize{
#'   \item \strong{Categorical data}: Use "main" or "cool" palettes
#'   \item \strong{Sequential data}: Use "sequential1", "sequential2", or "sequential3"
#'   \item \strong{Divergent data}: Use "divergent1", "divergent2", or "divergent3"
#'   \item \strong{Evaluation/Rating}: Use "evaluate" (red=poor, yellow=moderate, green=excellent)
#'   \item \strong{Monochrome}: Use "gray" for single-hue presentations
#' }
#'
#' @examples
#' # View all available palettes
#' names(furmanu_palettes)
#'
#' # Access a specific palette
#' furmanu_palettes$main
#' furmanu_palettes[["divergent1"]]
#'
#' # Visualize all palettes
#' show_furmanu_palettes()
#'
#' @seealso \code{\link{furmanu_pal}} for palette interpolation,
#'   \code{\link{scale_color_furmanu}} and \code{\link{scale_fill_furmanu}} for ggplot2 scales,
#'   \code{\link{show_furmanu_palettes}} for visual palette preview
#'
#' @export
furmanu_palettes <- list(
  `main` = furmanu_cols("purple", "gray", "light blue", "red", "yellow", "green"),
  `cool` = furmanu_cols("green", "light blue", "gray"),
  `gray` = furmanu_cols("gray", "light gray", "medium gray"),
  `divergent1` = furmanu_cols("red", "light gray", "purple"),
  `divergent2` = furmanu_cols("royal blue", "light gray", 
                              "midnight purple"),
  `divergent3` = furmanu_cols("red", "light gray", "green"),
  `sequential1` = furmanu_cols("light blue", "royal blue"),
  `sequential2` = furmanu_cols("light gray", "midnight purple"),
  `sequential3` = furmanu_cols("light gray", "purple"),
  `evaluate` = furmanu_cols("red", "yellow", "green")
)

#' Interpolated color palette from Furman palette
#'
#' Creates a color interpolation function from a Furman University color palette.
#' This function is primarily used internally by the scale functions, but can
#' also be used directly to generate custom color ramps.
#'
#' @param palette Name of palette to use. Must be one of the names in
#'   \code{\link{furmanu_palettes}}: "main", "cool", "gray", "divergent1",
#'   "divergent2", "divergent3", "sequential1", "sequential2", "sequential3",
#'   or "evaluate".
#' @param reverse Logical. Should the palette be reversed? Default is FALSE.
#' @param ... Additional arguments passed to \code{\link[grDevices]{colorRampPalette}}.
#'
#' @return A function that takes an integer argument (number of colors) and
#'   returns that many interpolated colors from the specified palette.
#'
#' @examples
#' # Create a palette function
#' pal_func <- furmanu_pal("main")
#'
#' # Generate 5 colors from the main palette
#' colors <- pal_func(5)
#' colors
#'
#' # Create a reversed divergent palette
#' div_pal <- furmanu_pal("divergent1", reverse = TRUE)
#' div_colors <- div_pal(7)
#'
#' # Visualize the interpolation
#' barplot(rep(1, 10), col = furmanu_pal("sequential1")(10), 
#'         main = "Sequential palette interpolation")
#'
#' @seealso \code{\link{furmanu_palettes}} for available palettes,
#'   \code{\link{scale_color_furmanu}} and \code{\link{scale_fill_furmanu}} for ggplot2 integration
#'
#' @importFrom grDevices colorRampPalette
#' @export
furmanu_pal <- function(palette = "main", reverse = FALSE, ...) {
  # Validate palette name
  if (!palette %in% names(furmanu_palettes)) {
    available_palettes <- paste(names(furmanu_palettes), collapse = ", ")
    stop("Palette '", palette, "' not found. Available palettes: ", available_palettes,
         call. = FALSE)
  }
  
  pal <- furmanu_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scale using Furman color palettes
#'
#' Apply Furman University color palettes to ggplot2 color aesthetics.
#' Supports both discrete and continuous scales, with special handling
#' for divergent palettes using midpoints.
#'
#' @param palette Name of palette to use. Available palettes:
#'   \itemize{
#'     \item \strong{Categorical}: "main" (6 colors), "cool" (3 colors)
#'     \item \strong{Sequential}: "sequential1", "sequential2", "sequential3" (2-3 colors)
#'     \item \strong{Divergent}: "divergent1", "divergent2", "divergent3" (3 colors)
#'     \item \strong{Special}: "gray" (monochrome), "evaluate" (red-yellow-green)
#'   }
#' @param discrete Logical. Is the scale discrete (TRUE) or continuous (FALSE)?
#'   Default is TRUE.
#' @param reverse Logical. Should the palette be reversed? Default is FALSE.
#' @param midpoint Numeric. Optional midpoint value for diverging scales. Only
#'   used with continuous scales and 3-color palettes. The midpoint will be
#'   mapped to the middle color of the palette.
#' @param ... Additional arguments passed to ggplot2 scale functions
#'   (\code{\link[ggplot2]{discrete_scale}} or \code{\link[ggplot2]{scale_color_gradientn}}).
#'
#' @return A ggplot2 scale object that can be added to a plot.
#'
#' @examples
#' library(ggplot2)
#'
#' # Discrete color scale
#' ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
#'   geom_point(size = 3) +
#'   scale_color_furmanu(palette = "main") +
#'   theme_minimal()
#'
#' # Continuous color scale
#' ggplot(mtcars, aes(wt, mpg, color = hp)) +
#'   geom_point(size = 3) +
#'   scale_color_furmanu(palette = "sequential1", discrete = FALSE) +
#'   theme_minimal()
#'
#' # Divergent scale with midpoint
#' mtcars$mpg_diff <- mtcars$mpg - mean(mtcars$mpg)
#' ggplot(mtcars, aes(wt, hp, color = mpg_diff)) +
#'   geom_point(size = 3) +
#'   scale_color_furmanu(palette = "divergent1", discrete = FALSE, midpoint = 0) +
#'   theme_minimal()
#'
#' @seealso \code{\link{scale_fill_furmanu}} for fill scales,
#'   \code{\link{furmanu_palettes}} for available palettes,
#'   \code{\link{show_furmanu_palettes}} for palette preview
#'
#' @importFrom scales rescale
#' @export
scale_color_furmanu <- function(palette = "main", discrete = TRUE, reverse = FALSE, midpoint = NULL, ...) {
  # Validate palette name
  if (!palette %in% names(furmanu_palettes)) {
    available_palettes <- paste(names(furmanu_palettes), collapse = ", ")
    stop("Palette '", palette, "' not found. Available palettes: ", available_palettes,
         call. = FALSE)
  }
  
  pal <- furmanu_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale(aesthetic = "colour", palette = pal, ...)
  } else {
    colors <- pal(256)

    args <- list(...)

    if (!is.null(midpoint) && length(furmanu_palettes[[palette]]) == 3) {
      lims <- if ("limits" %in% names(args)) args$limits else range(c(0, midpoint))

      vals <- c(lims[1], midpoint, lims[2])
      if (length(unique(vals)) < 3) {
        warning("Color scale values are not unique. Consider adjusting limits or midpoint.")
      }
      ggplot2::scale_color_gradientn(
        colours = colors,
        values = scales::rescale(vals, from = range(vals)),
        ...
      )
    } else {
      ggplot2::scale_color_gradientn(colours = colors, ...)
    }
  }
}

#' Fill scale using Furman color palettes
#'
#' Apply Furman University color palettes to ggplot2 fill aesthetics.
#' Supports both discrete and continuous scales, with special handling
#' for divergent palettes using midpoints. Identical functionality to
#' \code{\link{scale_color_furmanu}} but for fill aesthetics.
#'
#' @inheritParams scale_color_furmanu
#'
#' @return A ggplot2 scale object that can be added to a plot.
#'
#' @examples
#' library(ggplot2)
#'
#' # Discrete fill scale with bars
#' ggplot(mtcars, aes(x = factor(cyl), fill = factor(cyl))) +
#'   geom_bar() +
#'   scale_fill_furmanu(palette = "cool") +
#'   theme_minimal()
#'
#' # Continuous fill scale with tiles
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_furmanu(palette = "sequential2", discrete = FALSE) +
#'   theme_minimal()
#'
#' # Divergent fill scale with midpoint
#' mtcars$mpg_diff <- mtcars$mpg - mean(mtcars$mpg)
#' ggplot(mtcars, aes(x = reorder(rownames(mtcars), mpg_diff), y = 1, fill = mpg_diff)) +
#'   geom_col() +
#'   scale_fill_furmanu(palette = "divergent3", discrete = FALSE, midpoint = 0) +
#'   coord_flip() +
#'   theme_minimal()
#'
#' @seealso \code{\link{scale_color_furmanu}} for color scales,
#'   \code{\link{furmanu_palettes}} for available palettes,
#'   \code{\link{show_furmanu_palettes}} for palette preview
#'
#' @importFrom scales rescale
#' @export
scale_fill_furmanu <- function(palette = "main",
                               discrete = TRUE,
                               reverse = FALSE,
                               midpoint = NULL, ...) {
  # Validate palette name
  if (!palette %in% names(furmanu_palettes)) {
    available_palettes <- paste(names(furmanu_palettes), collapse = ", ")
    stop("Palette '", palette, "' not found. Available palettes: ", available_palettes,
         call. = FALSE)
  }
  
  pal <- furmanu_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale(aesthetic = "fill", palette = pal, ...)
  } else {
    colors <- pal(256)

    args <- list(...)

    if (!is.null(midpoint) && length(furmanu_palettes[[palette]]) == 3) {
      lims <- if ("limits" %in% names(args)) args$limits else range(c(0, midpoint))

      vals <- c(lims[1], midpoint, lims[2])
      if (length(unique(vals)) < 3) {
        warning("Color scale values are not unique. Consider adjusting limits or midpoint.")
      }
      ggplot2::scale_fill_gradientn(
        colours = colors,
        values = scales::rescale(vals, from = range(vals)),
        ...
      )
    } else {
      ggplot2::scale_fill_gradientn(colours = colors, ...)
    }
  }
}

#' Display all Furman palettes visually
#'
#' Creates a visual display of all available Furman University color palettes
#' as horizontal color bars. Useful for exploring palette options and understanding
#' the color relationships within each palette.
#'
#' @param type Character. Filter palettes by type. Options: "all" (default),
#'   "categorical", "sequential", "divergent", "special", "monochrome".
#' @param show_hex Logical. Should hex codes be displayed on the color bars?
#'   Default is FALSE.
#' @param title Character. Custom title for the plot. If NULL, uses default title.
#'
#' @return Invisibly returns NULL. Function is called for its side effect of
#'   creating a plot.
#'
#' @details
#' The function displays palettes defined in \code{\link{furmanu_palettes}}
#' as horizontal bars. Palette names are shown on the left, and each color
#' in the palette is displayed as a colored rectangle. This visualization helps
#' users choose appropriate palettes for their data visualization needs.
#'
#' When \code{show_hex = TRUE}, hex color codes are overlaid on each color bar
#' for easy reference.
#'
#' @examples
#' # Display all available palettes
#' show_furmanu_palettes()
#'
#' # Show only sequential palettes
#' show_furmanu_palettes(type = "sequential")
#'
#' # Show palettes with hex codes
#' show_furmanu_palettes(show_hex = TRUE)
#'
#' # Show divergent palettes with custom title
#' show_furmanu_palettes(type = "divergent", title = "Divergent Palettes Only")
#'
#' @seealso \code{\link{furmanu_palettes}} for palette definitions,
#'   \code{\link{palette_info}} for detailed palette information
#'
#' @export
show_furmanu_palettes <- function(type = "all", show_hex = FALSE, title = NULL) {
  # Filter palettes by type
  if (type != "all") {
    palette_types <- sapply(names(furmanu_palettes), function(p) palette_info(p)$type)
    
    # Map type aliases
    type_mapping <- list(
      "categorical" = c("categorical"),
      "sequential" = c("sequential"),
      "divergent" = c("divergent"),
      "special" = c("special"),
      "monochrome" = c("monochrome")
    )
    
    if (!type %in% names(type_mapping)) {
      stop("Invalid type. Options: all, categorical, sequential, divergent, special, monochrome",
           call. = FALSE)
    }
    
    selected_palettes <- names(palette_types)[palette_types %in% type_mapping[[type]]]
    palettes_to_show <- furmanu_palettes[selected_palettes]
  } else {
    palettes_to_show <- furmanu_palettes
  }
  
  if (length(palettes_to_show) == 0) {
    message("No palettes found for type: ", type)
    return(invisible(NULL))
  }
  
  n <- length(palettes_to_show)
  max_cols <- max(sapply(palettes_to_show, length))
  palette_names <- names(palettes_to_show)

  # Set larger left margin
  old_par <- graphics::par(mar = c(1, 8, 3, 1))
  on.exit(graphics::par(old_par))

  # Create title
  plot_title <- if (is.null(title)) {
    if (type == "all") "Furman Color Palettes" else paste("Furman", tools::toTitleCase(type), "Palettes")
  } else {
    title
  }

  graphics::plot(
    NULL, xlim = c(0, max_cols), ylim = c(0, n),
    type = "n", axes = FALSE, xlab = "", ylab = "",
    main = plot_title
  )

  for (i in seq_along(palettes_to_show)) {
    pal <- palettes_to_show[[i]]
    for (j in seq_along(pal)) {
      graphics::rect(j - 1, n - i, j, n - i + 0.8, col = pal[j], border = "white", lwd = 0.5)
      
      # Add hex codes if requested
      if (show_hex) {
        # Choose text color based on background lightness
        hex_code <- pal[j]
        rgb_vals <- grDevices::col2rgb(hex_code)
        brightness <- sum(rgb_vals * c(0.299, 0.587, 0.114))
        text_color <- if (brightness > 128) "black" else "white"
        
        graphics::text(j - 0.5, n - i + 0.4, labels = hex_code, 
                      col = text_color, cex = 0.6, srt = 90)
      }
    }
    graphics::text(-0.3, n - i + 0.4, labels = palette_names[i], adj = 1, xpd = TRUE, cex = 0.9)
  }
}

#' Open the Furman ggplot2 theme demo Quarto file
#'
#' Opens the comprehensive demo Quarto (.qmd) file that showcases various uses
#' of \code{\link{theme_furmanu}} and the \code{scale_*_furmanu} functions.
#' The demo includes examples of categorical, sequential, and divergent color
#' scales with detailed explanations.
#'
#' @return Invisibly returns NULL. Function is called for its side effect of
#'   opening the demo file in the default editor.
#'
#' @details
#' The demo file is located in the installed package directory under
#' \code{inst/furmanu_demo/demo.qmd}. The file contains:
#' \itemize{
#'   \item Basic theme usage examples
#'   \item Categorical color scale examples
#'   \item Sequential and divergent palette demonstrations
#'   \item Best practices for color scale selection
#'   \item Interactive palette visualization
#' }
#'
#' If the demo file cannot be found, an error is thrown with guidance on
#' package installation.
#'
#' @examples
#' \dontrun{
#' # Open the demo file
#' open_furmanu_demo()
#' }
#'
#' @seealso \code{\link{theme_furmanu}} for the main theme function,
#'   \code{\link{show_furmanu_palettes}} for palette overview
#'
#' @importFrom utils file.edit
#' @export
open_furmanu_demo <- function() {
  demo_path <- system.file("furmanu_demo", "demo.qmd", package = "themefurmanu")
  if (demo_path == "") {
    stop("Could not find demo.qmd inside the installed themefurmanu package.")
  }
  file.edit(demo_path)
}

#' Open the themefurmanu quick reference guide
#'
#' Opens a concise quick reference guide for the themefurmanu package that
#' provides decision trees, common patterns, and troubleshooting tips for
#' effective use of the package's unified color scale approach.
#'
#' @return Invisibly returns NULL. Function is called for its side effect of
#'   opening the quick reference file in the default editor.
#'
#' @details
#' The quick reference guide provides:
#' \itemize{
#'   \item Decision tree for choosing palettes and parameters
#'   \item Common usage patterns and code templates
#'   \item Troubleshooting guide for common mistakes
#'   \item Quick lookup table of all available palettes
#' }
#'
#' This is particularly useful for new users learning the themefurmanu approach
#' of using unified functions with parameters rather than multiple function names.
#'
#' @examples
#' \dontrun{
#' # Open the quick reference guide
#' open_furmanu_reference()
#' }
#'
#' @seealso \code{\link{open_furmanu_demo}} for comprehensive examples,
#'   \code{\link{show_furmanu_palettes}} for visual palette overview
#'
#' @importFrom utils file.edit
#' @export
open_furmanu_reference <- function() {
  ref_path <- system.file("furmanu_demo", "quick_reference.md", package = "themefurmanu")
  if (ref_path == "") {
    stop("Could not find quick_reference.md inside the installed themefurmanu package.")
  }
  file.edit(ref_path)
}

# Internal cache for palette functions
.palette_cache <- new.env(parent = emptyenv())

#' Create a cached palette function
#'
#' Internal function that creates and caches palette interpolation functions
#' for improved performance when the same palette is used multiple times.
#'
#' @param palette Name of the palette
#' @param reverse Whether to reverse the palette
#' @param ... Additional arguments to colorRampPalette
#'
#' @return A cached palette function
#' @keywords internal
#' @noRd
cached_palette_function <- function(palette, reverse = FALSE, ...) {
  # Create cache key
  key <- paste(palette, reverse, paste(list(...), collapse = "_"), sep = "_")
  
  # Check if already cached
  if (exists(key, envir = .palette_cache)) {
    return(get(key, envir = .palette_cache))
  }
  
  # Create new palette function
  pal_func <- furmanu_pal(palette = palette, reverse = reverse, ...)
  
  # Cache it
  assign(key, pal_func, envir = .palette_cache)
  
  return(pal_func)
}

#' Clear the internal palette cache
#'
#' Clears the internal cache used to store palette interpolation functions.
#' This can help free memory if you've used many different palette configurations.
#'
#' @return Invisibly returns NULL. Function is called for its side effect.
#'
#' @examples
#' # Clear the palette cache to free memory
#' clear_palette_cache()
#'
#' @export
clear_palette_cache <- function() {
  rm(list = ls(envir = .palette_cache), envir = .palette_cache)
  invisible(NULL)
}

#' Get information about a Furman palette
#'
#' Returns detailed information about a specific Furman University color palette,
#' including the number of colors, color codes, and recommended usage.
#'
#' @param palette Name of the palette to inspect. Must be one of the names in
#'   \code{\link{furmanu_palettes}}.
#'
#' @return A list containing palette information:
#'   \itemize{
#'     \item \code{name}: The palette name
#'     \item \code{colors}: Vector of hex color codes
#'     \item \code{n_colors}: Number of colors in the palette
#'     \item \code{type}: Suggested palette type (categorical, sequential, divergent, special)
#'     \item \code{description}: Brief description of the palette
#'   }
#'
#' @examples
#' # Get information about the main palette
#' palette_info("main")
#'
#' # Get information about a divergent palette
#' palette_info("divergent1")
#'
#' # Get information about all palettes
#' lapply(names(furmanu_palettes), palette_info)
#'
#' @seealso \code{\link{furmanu_palettes}} for all available palettes,
#'   \code{\link{show_furmanu_palettes}} for visual overview
#'
#' @export
palette_info <- function(palette) {
  if (!palette %in% names(furmanu_palettes)) {
    available_palettes <- paste(names(furmanu_palettes), collapse = ", ")
    stop("Palette '", palette, "' not found. Available palettes: ", available_palettes,
         call. = FALSE)
  }
  
  colors <- furmanu_palettes[[palette]]
  n_colors <- length(colors)
  
  # Determine palette type and description
  type_info <- switch(palette,
    "main" = list(type = "categorical", 
                  description = "Primary 6-color palette for categorical data"),
    "cool" = list(type = "categorical", 
                  description = "Cool 3-color palette for categorical data"),
    "gray" = list(type = "monochrome", 
                  description = "Grayscale palette for monochrome visualizations"),
    "divergent1" = list(type = "divergent", 
                        description = "Red-to-purple divergent palette"),
    "divergent2" = list(type = "divergent", 
                        description = "Blue-to-purple divergent palette"),
    "divergent3" = list(type = "divergent", 
                        description = "Red-to-green divergent palette"),
    "sequential1" = list(type = "sequential", 
                         description = "Light blue to royal blue sequential palette"),
    "sequential2" = list(type = "sequential", 
                         description = "Light gray to midnight purple sequential palette"),
    "sequential3" = list(type = "sequential", 
                         description = "Light gray to purple sequential palette"),
    "evaluate" = list(type = "special", 
                      description = "Red-yellow-green evaluation palette (poor to excellent)")
  )
  
  list(
    name = palette,
    colors = colors,
    n_colors = n_colors,
    type = type_info$type,
    description = type_info$description
  )
}

#' Extract colors from a Furman palette
#'
#' Extracts a specified number of colors from a Furman University palette,
#' with interpolation if more colors are requested than exist in the base palette.
#'
#' @param palette Name of the palette to use. Must be one of the names in
#'   \code{\link{furmanu_palettes}}.
#' @param n Number of colors to extract. If \code{n} is greater than the number
#'   of colors in the base palette, colors will be interpolated.
#' @param reverse Logical. Should the palette be reversed? Default is FALSE.
#'
#' @return A character vector of hex color codes.
#'
#' @examples
#' # Extract 3 colors from the main palette
#' extract_colors("main", 3)
#'
#' # Extract more colors than in the base palette (with interpolation)
#' extract_colors("divergent1", 7)
#'
#' # Extract colors in reverse order
#' extract_colors("sequential1", 5, reverse = TRUE)
#'
#' # Use in a custom plot
#' colors <- extract_colors("cool", 4)
#' barplot(1:4, col = colors, main = "Custom color extraction")
#'
#' @seealso \code{\link{furmanu_pal}} for creating palette functions,
#'   \code{\link{palette_info}} for palette information
#'
#' @export
extract_colors <- function(palette, n, reverse = FALSE) {
  if (!palette %in% names(furmanu_palettes)) {
    available_palettes <- paste(names(furmanu_palettes), collapse = ", ")
    stop("Palette '", palette, "' not found. Available palettes: ", available_palettes,
         call. = FALSE)
  }
  
  if (!is.numeric(n) || n <= 0 || n != as.integer(n)) {
    stop("'n' must be a positive integer", call. = FALSE)
  }
  
  pal_func <- furmanu_pal(palette = palette, reverse = reverse)
  pal_func(n)
}

#' Check color contrast for accessibility
#'
#' Evaluates the color contrast ratio between palette colors and common
#' background colors to ensure accessibility compliance with WCAG guidelines.
#'
#' @param palette Name of the palette to check. Must be one of the names in
#'   \code{\link{furmanu_palettes}}.
#' @param background Character vector of background colors to test against.
#'   Default tests against white and light gray.
#' @param standard Character. Accessibility standard to check: "AA" (default)
#'   or "AAA". AA requires 4.5:1 contrast for normal text, AAA requires 7:1.
#'
#' @return A data frame with contrast ratios and pass/fail status for each
#'   color-background combination.
#'
#' @details
#' The function calculates contrast ratios using the WCAG 2.1 formula.
#' Contrast ratios of 4.5:1 or higher meet AA standards for normal text,
#' while 7:1 or higher meet AAA standards.
#'
#' @examples
#' # Check contrast for the main palette
#' check_contrast("main")
#'
#' # Check against a custom background
#' check_contrast("divergent1", background = "#f0f0f0")
#'
#' # Check for AAA compliance
#' check_contrast("cool", standard = "AAA")
#'
#' @seealso \code{\link{palette_info}} for general palette information
#'
#' @export
check_contrast <- function(palette, background = c("#ffffff", "#f5f5f5"), standard = "AA") {
  if (!palette %in% names(furmanu_palettes)) {
    available_palettes <- paste(names(furmanu_palettes), collapse = ", ")
    stop("Palette '", palette, "' not found. Available palettes: ", available_palettes,
         call. = FALSE)
  }
  
  if (!standard %in% c("AA", "AAA")) {
    stop("Standard must be 'AA' or 'AAA'", call. = FALSE)
  }
  
  # WCAG contrast threshold
  threshold <- if (standard == "AA") 4.5 else 7.0
  
  colors <- furmanu_palettes[[palette]]
  
  # Function to calculate relative luminance
  relative_luminance <- function(hex_color) {
    rgb_vals <- grDevices::col2rgb(hex_color)[,1] / 255
    
    # Apply gamma correction
    rgb_corrected <- ifelse(rgb_vals <= 0.03928,
                           rgb_vals / 12.92,
                           ((rgb_vals + 0.055) / 1.055)^2.4)
    
    # Calculate relative luminance
    0.2126 * rgb_corrected[1] + 0.7152 * rgb_corrected[2] + 0.0722 * rgb_corrected[3]
  }
  
  # Function to calculate contrast ratio
  contrast_ratio <- function(color1, color2) {
    l1 <- relative_luminance(color1)
    l2 <- relative_luminance(color2)
    
    lighter <- max(l1, l2)
    darker <- min(l1, l2)
    
    (lighter + 0.05) / (darker + 0.05)
  }
  
  # Create results data frame
  results <- expand.grid(
    color = colors,
    background = background,
    stringsAsFactors = FALSE
  )
  
  results$color_name <- names(colors)[match(results$color, colors)]
  results$contrast_ratio <- mapply(contrast_ratio, results$color, results$background)
  results$passes <- results$contrast_ratio >= threshold
  results$standard <- standard
  
  # Reorder columns
  results[, c("color_name", "color", "background", "contrast_ratio", "passes", "standard")]
}

#' Suggest accessible color combinations
#'
#' Recommends Furman University color combinations that meet accessibility
#' standards for text and background usage.
#'
#' @param standard Character. Accessibility standard: "AA" (default) or "AAA".
#' @param use_case Character. Intended use case: "text" (default), "large_text",
#'   or "graphics". Different standards apply to each use case.
#'
#' @return A data frame with recommended color combinations and their contrast ratios.
#'
#' @details
#' WCAG 2.1 contrast requirements:
#' \itemize{
#'   \item Normal text (AA): 4.5:1
#'   \item Normal text (AAA): 7:1
#'   \item Large text (AA): 3:1
#'   \item Large text (AAA): 4.5:1
#'   \item Graphics/UI components: 3:1
#' }
#'
#' @examples
#' # Get accessible text color combinations
#' accessible_combinations()
#'
#' # Get combinations for large text
#' accessible_combinations(use_case = "large_text")
#'
#' # Get AAA-compliant combinations
#' accessible_combinations(standard = "AAA")
#'
#' @seealso \code{\link{check_contrast}} for detailed contrast analysis
#'
#' @export
accessible_combinations <- function(standard = "AA", use_case = "text") {
  if (!standard %in% c("AA", "AAA")) {
    stop("Standard must be 'AA' or 'AAA'", call. = FALSE)
  }
  
  if (!use_case %in% c("text", "large_text", "graphics")) {
    stop("Use case must be 'text', 'large_text', or 'graphics'", call. = FALSE)
  }
  
  # Set contrast threshold based on standard and use case
  threshold <- switch(paste(standard, use_case, sep = "_"),
    "AA_text" = 4.5,
    "AAA_text" = 7.0,
    "AA_large_text" = 3.0,
    "AAA_large_text" = 4.5,
    "AA_graphics" = 3.0,
    "AAA_graphics" = 3.0
  )
  
  # Define light backgrounds commonly used
  light_backgrounds <- c(
    "white" = "#ffffff",
    "light_gray" = "#f5f5f5",
    "very_light_gray" = "#fafafa"
  )
  
  # Define dark backgrounds
  dark_backgrounds <- c(
    "midnight_purple" = furmanu_colors["midnight purple"],
    "purple" = furmanu_colors["purple"],
    "gray" = furmanu_colors["gray"]
  )
  
  all_colors <- furmanu_colors
  all_backgrounds <- c(light_backgrounds, dark_backgrounds)
  
  # Helper function for contrast calculation
  relative_luminance <- function(hex_color) {
    rgb_vals <- grDevices::col2rgb(hex_color)[,1] / 255
    rgb_corrected <- ifelse(rgb_vals <= 0.03928,
                           rgb_vals / 12.92,
                           ((rgb_vals + 0.055) / 1.055)^2.4)
    0.2126 * rgb_corrected[1] + 0.7152 * rgb_corrected[2] + 0.0722 * rgb_corrected[3]
  }
  
  contrast_ratio <- function(color1, color2) {
    l1 <- relative_luminance(color1)
    l2 <- relative_luminance(color2)
    lighter <- max(l1, l2)
    darker <- min(l1, l2)
    (lighter + 0.05) / (darker + 0.05)
  }
  
  # Test all combinations
  combinations <- expand.grid(
    foreground_name = names(all_colors),
    background_name = names(all_backgrounds),
    stringsAsFactors = FALSE
  )
  
  combinations$foreground_color <- all_colors[combinations$foreground_name]
  combinations$background_color <- all_backgrounds[combinations$background_name]
  combinations$contrast_ratio <- mapply(contrast_ratio, 
                                       combinations$foreground_color, 
                                       combinations$background_color)
  combinations$passes <- combinations$contrast_ratio >= threshold
  
  # Filter to passing combinations and sort by contrast ratio
  accessible <- combinations[combinations$passes, ]
  accessible <- accessible[order(accessible$contrast_ratio, decreasing = TRUE), ]
  
  # Clean up the output
  accessible[, c("foreground_name", "foreground_color", "background_name", 
                "background_color", "contrast_ratio", "passes")]
}

#' Export Furman palette to different formats
#'
#' Exports a Furman University color palette to various formats for use in
#' other applications like Adobe products, CSS, or other design tools.
#'
#' @param palette Name of the palette to export. Must be one of the names in
#'   \code{\link{furmanu_palettes}}.
#' @param format Character. Export format: "hex" (default), "rgb", "hsl", "css", 
#'   "adobe_ase", or "json".
#' @param file Character. Optional file path to save the export. If NULL,
#'   returns the formatted string.
#' @param n Integer. Number of colors to export. If NULL, uses base palette colors.
#'   If specified, interpolates to create the requested number of colors.
#'
#' @return Depending on \code{file} parameter, either writes to file and returns
#'   the file path invisibly, or returns the formatted color data as a character vector.
#'
#' @details
#' Supported export formats:
#' \itemize{
#'   \item \strong{hex}: Hexadecimal color codes (#RRGGBB)
#'   \item \strong{rgb}: RGB values (r, g, b)
#'   \item \strong{hsl}: HSL values (hue, saturation, lightness)
#'   \item \strong{css}: CSS-ready color definitions
#'   \item \strong{json}: JSON format with color names and codes
#' }
#'
#' @examples
#' # Export as hex codes
#' export_palette("main", format = "hex")
#'
#' # Export as RGB values
#' export_palette("divergent1", format = "rgb")
#'
#' # Export interpolated palette with more colors
#' export_palette("sequential1", format = "hex", n = 10)
#'
#' # Export as CSS
#' export_palette("cool", format = "css")
#'
#' \dontrun{
#' # Save to file
#' export_palette("main", format = "json", file = "furman_main_palette.json")
#' }
#'
#' @seealso \code{\link{extract_colors}} for color extraction,
#'   \code{\link{palette_info}} for palette information
#'
#' @export
export_palette <- function(palette, format = "hex", file = NULL, n = NULL) {
  if (!palette %in% names(furmanu_palettes)) {
    available_palettes <- paste(names(furmanu_palettes), collapse = ", ")
    stop("Palette '", palette, "' not found. Available palettes: ", available_palettes,
         call. = FALSE)
  }
  
  if (!format %in% c("hex", "rgb", "hsl", "css", "json")) {
    stop("Format must be one of: hex, rgb, hsl, css, json", call. = FALSE)
  }
  
  # Get colors
  if (is.null(n)) {
    colors <- furmanu_palettes[[palette]]
  } else {
    colors <- extract_colors(palette, n)
  }
  
  # Format colors based on requested format
  formatted_colors <- switch(format,
    "hex" = colors,
    "rgb" = format_rgb(colors),
    "hsl" = format_hsl(colors),
    "css" = format_css(colors, palette),
    "json" = format_json(colors, palette)
  )
  
  # Handle file output
  if (!is.null(file)) {
    if (format == "json") {
      writeLines(formatted_colors, file)
    } else {
      writeLines(formatted_colors, file)
    }
    message("Palette exported to: ", file)
    return(invisible(file))
  } else {
    return(formatted_colors)
  }
}

# Helper functions for palette export formats
format_rgb <- function(hex_colors) {
  rgb_matrix <- grDevices::col2rgb(hex_colors)
  paste0("rgb(", rgb_matrix[1,], ", ", rgb_matrix[2,], ", ", rgb_matrix[3,], ")")
}

format_hsl <- function(hex_colors) {
  rgb_matrix <- grDevices::col2rgb(hex_colors) / 255
  
  hsl_values <- apply(rgb_matrix, 2, function(rgb) {
    r <- rgb[1]; g <- rgb[2]; b <- rgb[3]
    
    max_val <- max(r, g, b)
    min_val <- min(r, g, b)
    diff <- max_val - min_val
    
    # Lightness
    l <- (max_val + min_val) / 2
    
    if (diff == 0) {
      h <- s <- 0
    } else {
      # Saturation
      s <- if (l > 0.5) diff / (2 - max_val - min_val) else diff / (max_val + min_val)
      
      # Hue
      h <- switch(which.max(c(r == max_val, g == max_val, b == max_val)),
        (g - b) / diff + (if (g < b) 6 else 0),
        (b - r) / diff + 2,
        (r - g) / diff + 4
      ) / 6
    }
    
    c(round(h * 360), round(s * 100), round(l * 100))
  })
  
  paste0("hsl(", hsl_values[1,], ", ", hsl_values[2,], "%, ", hsl_values[3,], "%)")
}

format_css <- function(hex_colors, palette_name) {
  color_names <- names(hex_colors)
  if (is.null(color_names)) {
    color_names <- paste0(palette_name, "_", seq_along(hex_colors))
  }
  
  css_vars <- paste0("  --furman-", gsub(" ", "-", tolower(color_names)), ": ", hex_colors, ";")
  c(":root {", css_vars, "}")
}

format_json <- function(hex_colors, palette_name) {
  color_names <- names(hex_colors)
  if (is.null(color_names)) {
    color_names <- paste0("color_", seq_along(hex_colors))
  }
  
  # Create JSON structure
  json_colors <- paste0('    "', color_names, '": "', hex_colors, '"', collapse = ",\n")
  
  paste0('{\n  "palette_name": "', palette_name, '",\n  "colors": {\n', json_colors, '\n  }\n}')
}

#' List all available Furman palettes with summary information
#'
#' Provides a quick overview of all available Furman University color palettes
#' with their types, number of colors, and brief descriptions.
#'
#' @param type Character. Filter by palette type: "all" (default), "categorical",
#'   "sequential", "divergent", "special", or "monochrome".
#'
#' @return A data frame with palette information including name, type,
#'   number of colors, and description.
#'
#' @examples
#' # List all palettes
#' list_palettes()
#'
#' # List only sequential palettes
#' list_palettes("sequential")
#'
#' # List categorical palettes
#' list_palettes("categorical")
#'
#' @seealso \code{\link{palette_info}} for detailed information about specific palettes,
#'   \code{\link{show_furmanu_palettes}} for visual overview
#'
#' @export
list_palettes <- function(type = "all") {
  all_info <- lapply(names(furmanu_palettes), palette_info)
  
  palette_df <- data.frame(
    name = sapply(all_info, function(x) x$name),
    type = sapply(all_info, function(x) x$type),
    n_colors = sapply(all_info, function(x) x$n_colors),
    description = sapply(all_info, function(x) x$description),
    stringsAsFactors = FALSE
  )
  
  if (type != "all") {
    palette_df <- palette_df[palette_df$type == type, ]
  }
  
  palette_df
}
