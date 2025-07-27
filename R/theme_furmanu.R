# FILE: R/themefurmanu.R

#' Register IBM Plex Fonts (if available)
#'
#' Checks for IBM Plex Sans and IBM Plex Sans Condensed fonts on the system.
#' The function provides feedback about font availability but does not attempt
#' to create fake font registrations that could cause graphics engine warnings.
#'
#' @return Invisibly returns NULL. Function is called for its side effect
#'   of checking font availability and providing user feedback.
#'
#' @details
#' This function:
#' \itemize{
#'   \item Checks if systemfonts package is available
#'   \item Skips in non-interactive sessions or R CMD check
#'   \item Reports whether IBM Plex fonts are actually installed
#'   \item Does NOT create fake font registrations that map to system fonts
#'   \item Falls back gracefully to system sans-serif fonts in themes
#' }
#'
#' To use IBM Plex fonts, install them from:
#' \url{https://fonts.google.com/specimen/IBM+Plex+Sans}
#'
#' Font checking is automatically performed when the package loads via
#' \code{.onAttach}, but this function can be called manually if needed.
#'
#' @examples
#' \dontrun{
#' # Check font availability
#' register_furmanu_fonts()
#'
#' # Check what fonts are actually available
#' if (requireNamespace("systemfonts", quietly = TRUE)) {
#'   fonts <- systemfonts::system_fonts()
#'   "IBM Plex Sans" %in% fonts$family
#' }
#' }
#'
#' @seealso \code{\link{theme_furmanu}} for the main theme that uses these fonts
#'
#' @export
register_furmanu_fonts <- function() {
  if (!requireNamespace("systemfonts", quietly = TRUE)) {
    packageStartupMessage("systemfonts package not available. Using system font fallbacks.")
    return(invisible(NULL))
  }

  # Skip font registration in non-interactive or R CMD check environments
  if (!interactive() || isTRUE(as.logical(Sys.getenv("_R_CHECK_PACKAGE_NAME_")))) {
    packageStartupMessage("Skipping font registration (non-interactive or R CMD check)")
    return(invisible(NULL))
  }

  try({
    sf <- systemfonts::system_fonts()
    installed_families <- unique(sf$family)
    
    # Only register if IBM Plex fonts are actually installed
    # Don't create fake registrations that map to system fonts
    if ("IBM Plex Sans" %in% installed_families) {
      packageStartupMessage("IBM Plex Sans found and registered for use.")
      # The font is already available, no need to register
    } else {
      packageStartupMessage("IBM Plex Sans not found. Using system sans-serif font.")
    }
    
    if ("IBM Plex Sans Condensed" %in% installed_families) {
      packageStartupMessage("IBM Plex Sans Condensed found and registered for use.")
      # The font is already available, no need to register
    } else {
      packageStartupMessage("IBM Plex Sans Condensed not found. Using fallback font.")
    }
  }, silent = FALSE)  # Show any actual errors

  invisible(NULL)
}

#' Custom Furman ggplot2 Theme
#'
#' A comprehensive ggplot2 theme that applies Furman University branding
#' including IBM Plex fonts (with system fallbacks), official color scheme,
#' and professional styling suitable for presentations and publications.
#'
#' @param base_size Numeric. Base font size in points. Default is 12.
#' @param base_family Character. Optional override for base font family.
#'   If NULL (default), the function will attempt to use IBM Plex Sans
#'   if available, falling back to system sans-serif fonts.
#'
#' @return A ggplot2 theme object that can be added to plots.
#'
#' @details
#' The theme implements Furman University's visual identity with:
#' \itemize{
#'   \item IBM Plex Sans for general text (with fallbacks)
#'   \item IBM Plex Sans Condensed for axis labels (with fallbacks)
#'   \item Furman purple (#582c83) and midnight purple (#201547) for text
#'   \item Clean, minimal aesthetic based on \code{theme_minimal}
#'   \item Optimized spacing and typography for readability
#' }
#'
#' Font registration is handled automatically when the package loads,
#' but can be called manually using \code{\link{register_furmanu_fonts}}.
#'
#' @examples
#' library(ggplot2)
#'
#' # Basic usage
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point(color = "#582c83", size = 3) +
#'   labs(
#'     title = "Fuel Efficiency by Car Weight",
#'     subtitle = "Using Furman University theme",
#'     x = "Weight (1000 lbs)",
#'     y = "Miles per Gallon",
#'     caption = "Source: mtcars dataset"
#'   ) +
#'   theme_furmanu()
#'
#' # With custom base size
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point(size = 2) +
#'   scale_color_furmanu(palette = "cool") +
#'   theme_furmanu(base_size = 14) +
#'   labs(title = "Iris Dataset with Larger Font")
#'
#' # Combined with color scales
#' ggplot(mpg, aes(displ, hwy, color = class)) +
#'   geom_point(size = 2) +
#'   scale_color_furmanu(palette = "main") +
#'   theme_furmanu() +
#'   labs(
#'     title = "Highway MPG vs Engine Displacement",
#'     subtitle = "Colored by vehicle class"
#'   )
#'
#' @seealso \code{\link{register_furmanu_fonts}} for font setup,
#'   \code{\link{scale_color_furmanu}} and \code{\link{scale_fill_furmanu}} for color scales,
#'   \code{\link{open_furmanu_demo}} for comprehensive examples
#'
#' @import ggplot2
#' @export
theme_furmanu <- function(base_size = 12, base_family = NULL) {
  # Default fallback
  fu_font <- "sans"
  fu_graph_font <- "sans"

  # Only use IBM Plex fonts if they are actually installed on the system
  if (!is.null(base_family)) {
    fu_font <- base_family
    fu_graph_font <- base_family
  } else if (interactive() && requireNamespace("systemfonts", quietly = TRUE)) {
    sf <- try(systemfonts::system_fonts(), silent = TRUE)
    if (inherits(sf, "data.frame")) {
      # Check for actual IBM Plex installation (not our fallback registration)
      installed_families <- unique(sf$family)
      
      # Only use IBM Plex if it's actually installed
      if ("IBM Plex Sans" %in% installed_families) {
        fu_font <- "IBM Plex Sans"
      }
      
      if ("IBM Plex Sans Condensed" %in% installed_families) {
        fu_graph_font <- "IBM Plex Sans Condensed"
      } else if ("IBM Plex Sans" %in% installed_families) {
        fu_graph_font <- "IBM Plex Sans"
      }
    }
  }

  dark_color <- "#201547"
  medium_color <- "#582c83"

  ggplot2::theme_minimal(base_size = base_size, base_family = fu_font) %+replace%
    ggplot2::theme(
      plot.caption = ggplot2::element_text(
        family = fu_font, size = ggplot2::rel(0.7), hjust = 1, color = medium_color),
      plot.title = ggplot2::element_text(
        size = ggplot2::rel(1.6), face = "bold", family = fu_font, color = dark_color,
        lineheight = ggplot2::rel(1.5), hjust = 0,
        margin = ggplot2::margin(2, 1, 4, 1, "pt")),
      plot.title.position = "panel",
      plot.caption.position = "plot",
      plot.subtitle = ggplot2::element_text(
        size = ggplot2::rel(1.2), family = fu_font, color = medium_color,
        lineheight = ggplot2::rel(1.2), hjust = 0,
        margin = ggplot2::margin(1, 1, 10, 1, "pt")),
      axis.title = ggplot2::element_text(
        size = ggplot2::rel(1.1), family = fu_graph_font, color = dark_color),
      axis.text = ggplot2::element_text(
        size = ggplot2::rel(0.9), family = fu_graph_font, color = medium_color),
      legend.title = ggplot2::element_text(
        size = ggplot2::rel(0.9), family = fu_graph_font, face = "bold", color = dark_color),
      legend.text = ggplot2::element_text(
        size = ggplot2::rel(0.8), family = fu_graph_font, color = dark_color, lineheight = 0.9),
      strip.text = ggplot2::element_text(
        size = ggplot2::rel(0.9), family = fu_font, face = "plain", color = dark_color,
        margin = ggplot2::margin(3, 1, 3, 1, "pt")),
      strip.background = ggplot2::element_rect(fill = "#F0F0F0", color = "#F0F0F0"),
      legend.key.spacing.x = grid::unit(1, "pt"),
      legend.key.spacing.y = grid::unit(0, "pt")
    )
}

#' Furman theme optimized for presentations
#'
#' A variant of \code{\link{theme_furmanu}} optimized for presentation slides
#' with larger fonts, increased spacing, and enhanced visibility for projectors.
#'
#' @param base_size Numeric. Base font size in points. Default is 16 (larger than regular theme).
#' @param base_family Character. Optional override for base font family.
#'
#' @return A ggplot2 theme object optimized for presentations.
#'
#' @details
#' This theme variant includes:
#' \itemize{
#'   \item Larger base font size (16pt vs 12pt)
#'   \item Increased spacing for better visibility
#'   \item Enhanced contrast for projector readability
#'   \item Optimized legend and title positioning
#' }
#'
#' @examples
#' library(ggplot2)
#'
#' # Create a presentation-ready plot
#' ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
#'   geom_point(size = 4) +
#'   scale_color_furmanu(palette = "main") +
#'   theme_furmanu_presentation() +
#'   labs(
#'     title = "Fuel Efficiency by Weight",
#'     subtitle = "Optimized for presentation"
#'   )
#'
#' @seealso \code{\link{theme_furmanu}} for the standard theme,
#'   \code{\link{theme_furmanu_minimal}} for a minimal variant
#'
#' @import ggplot2
#' @export
theme_furmanu_presentation <- function(base_size = 16, base_family = NULL) {
  theme_furmanu(base_size = base_size, base_family = base_family) %+replace%
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        size = ggplot2::rel(1.8), face = "bold", 
        margin = ggplot2::margin(5, 1, 8, 1, "pt")),
      plot.subtitle = ggplot2::element_text(
        size = ggplot2::rel(1.3),
        margin = ggplot2::margin(2, 1, 12, 1, "pt")),
      axis.title = ggplot2::element_text(size = ggplot2::rel(1.2)),
      axis.text = ggplot2::element_text(size = ggplot2::rel(1.0)),
      legend.title = ggplot2::element_text(size = ggplot2::rel(1.1)),
      legend.text = ggplot2::element_text(size = ggplot2::rel(1.0)),
      strip.text = ggplot2::element_text(size = ggplot2::rel(1.0)),
      panel.spacing = grid::unit(1.5, "lines"),
      legend.margin = ggplot2::margin(10, 10, 10, 10),
      plot.margin = ggplot2::margin(15, 15, 15, 15)
    )
}

#' Minimal Furman theme
#'
#' A minimal variant of \code{\link{theme_furmanu}} with reduced visual elements
#' for clean, understated visualizations.
#'
#' @param base_size Numeric. Base font size in points. Default is 11.
#' @param base_family Character. Optional override for base font family.
#' @param grid Logical. Should grid lines be shown? Default is FALSE.
#'
#' @return A ggplot2 theme object with minimal styling.
#'
#' @details
#' This minimal theme variant:
#' \itemize{
#'   \item Removes most grid lines (optional)
#'   \item Uses smaller fonts
#'   \item Reduces spacing and margins
#'   \item Maintains Furman color scheme
#'   \item Ideal for small multiples or embedded plots
#' }
#'
#' @examples
#' library(ggplot2)
#'
#' # Create a minimal plot
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point() +
#'   scale_color_furmanu(palette = "cool") +
#'   theme_furmanu_minimal() +
#'   labs(title = "Minimal Furman Theme")
#'
#' # With grid lines
#' ggplot(mtcars, aes(wt, mpg)) +
#'   geom_point() +
#'   theme_furmanu_minimal(grid = TRUE)
#'
#' @seealso \code{\link{theme_furmanu}} for the standard theme,
#'   \code{\link{theme_furmanu_presentation}} for presentation variant
#'
#' @import ggplot2
#' @export
theme_furmanu_minimal <- function(base_size = 11, base_family = NULL, grid = FALSE) {
  # Start with the base theme
  base_theme <- theme_furmanu(base_size = base_size, base_family = base_family)
  
  # Minimal modifications
  minimal_theme <- base_theme %+replace%
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        size = ggplot2::rel(1.4),
        margin = ggplot2::margin(1, 1, 3, 1, "pt")),
      plot.subtitle = ggplot2::element_text(
        size = ggplot2::rel(1.1),
        margin = ggplot2::margin(1, 1, 8, 1, "pt")),
      plot.caption = ggplot2::element_text(size = ggplot2::rel(0.8)),
      axis.title = ggplot2::element_text(size = ggplot2::rel(1.0)),
      axis.text = ggplot2::element_text(size = ggplot2::rel(0.9)),
      legend.title = ggplot2::element_text(size = ggplot2::rel(0.9)),
      legend.text = ggplot2::element_text(size = ggplot2::rel(0.8)),
      strip.text = ggplot2::element_text(
        size = ggplot2::rel(0.9),
        margin = ggplot2::margin(2, 1, 2, 1, "pt")),
      panel.spacing = grid::unit(0.8, "lines"),
      plot.margin = ggplot2::margin(8, 8, 8, 8)
    )
  
  # Conditionally remove grid lines
  if (!grid) {
    minimal_theme <- minimal_theme %+replace%
      ggplot2::theme(
        panel.grid.major = ggplot2::element_blank(),
        panel.grid.minor = ggplot2::element_blank()
      )
  }
  
  minimal_theme
}
