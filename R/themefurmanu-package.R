#' themefurmanu: Furman University ggplot2 Theme and Color Palettes
#'
#' @description
#' The themefurmanu package provides a comprehensive ggplot2 theme and color palette
#' system designed for Furman University's visual identity. Unlike traditional palette
#' packages that require multiple function names, themefurmanu uses a unified approach
#' where you specify behavior through arguments to consistent functions.
#'
#' @details
#' ## Quick Start
#' \preformatted{
#' library(ggplot2)
#' library(themefurmanu)
#'
#' # View all available palettes
#' show_furmanu_palettes()
#'
#' # Basic plot with unified color scale approach
#' ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
#'   geom_point(size = 3) +
#'   scale_color_furmanu(palette = "main", discrete = TRUE) +
#'   theme_furmanu() +
#'   labs(title = "Example Plot with Furman Theme")
#'
#' # Continuous data with sequential palette
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_furmanu(palette = "sequential1", discrete = FALSE) +
#'   theme_furmanu()
#'
#' # Divergent data (requires midpoint = 0)
#' ggplot(mtcars, aes(wt, hp, color = mpg - mean(mpg))) +
#'   geom_point(size = 3) +
#'   scale_color_furmanu(palette = "divergent1", discrete = FALSE, midpoint = 0) +
#'   theme_furmanu()
#' }
#'
#' @section Core Functions (Start Here):
#' \itemize{
#'   \item \code{\link{scale_color_furmanu}}: Unified color scales - use for ALL color needs
#'   \item \code{\link{scale_fill_furmanu}}: Unified fill scales - use for ALL fill needs
#'   \item \code{\link{theme_furmanu}}: Main ggplot2 theme with Furman styling
#'   \item \code{\link{show_furmanu_palettes}}: Visual overview of all available palettes
#' }
#'
#' @section Theme Variants:
#' \itemize{
#'   \item \code{\link{theme_furmanu}}: Standard theme (base_size = 12)
#'   \item \code{\link{theme_furmanu_presentation}}: Larger fonts for slides (base_size = 16)
#'   \item \code{\link{theme_furmanu_minimal}}: Clean, minimal styling
#' }
#'
#' @section Palette Discovery and Information:
#' \itemize{
#'   \item \code{\link{show_furmanu_palettes}}: Visual display of all palettes
#'   \item \code{\link{list_palettes}}: Text list of all available palettes
#'   \item \code{\link{palette_info}}: Detailed information about specific palettes
#'   \item \code{\link{furmanu_cols}}: Extract individual named colors
#' }
#'
#' @section Advanced Palette Tools:
#' \itemize{
#'   \item \code{\link{extract_colors}}: Extract specific number of colors from any palette
#'   \item \code{\link{export_palette}}: Export palettes to CSS, JSON, RGB formats
#' }
#'
#' @section Documentation and Help:
#' \itemize{
#'   \item \code{\link{open_furmanu_demo}}: Comprehensive examples and tutorials
#'   \item \code{\link{open_furmanu_reference}}: Quick reference guide
#' }
#'
#' @section Accessibility Functions:
#' \itemize{
#'   \item \code{\link{check_contrast}}: Check color contrast for accessibility
#'   \item \code{\link{accessible_combinations}}: Find accessible color combinations
#' }
#'
#' @section Color Palettes:
#' The package includes 10 pre-defined color palettes:
#' \itemize{
#'   \item \strong{Categorical}: "main" (6 colors), "cool" (3 colors)
#'   \item \strong{Sequential}: "sequential1", "sequential2", "sequential3"
#'   \item \strong{Divergent}: "divergent1", "divergent2", "divergent3"
#'   \item \strong{Special}: "gray" (monochrome), "evaluate" (performance rating)
#' }
#'
#' @section Quick Start:
#' \preformatted{
#' library(ggplot2)
#' library(themefurmanu)
#'
#' # Basic usage
#' ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
#'   geom_point(size = 3) +
#'   scale_color_furmanu(palette = "main") +
#'   theme_furmanu() +
#'   labs(title = "Example Plot with Furman Theme")
#'
#' # View available palettes
#' show_furmanu_palettes()
#'
#' # Open comprehensive tutorial
#' open_furmanu_demo()
#'
#' # Open quick reference guide  
#' open_furmanu_reference()
#'
#' # Check accessibility
#' check_contrast("main")
#'
#' # Export palette
#' export_palette("cool", format = "css")
#' }
#'
#' @section Available Palettes:
#' \describe{
#'   \item{Categorical}{"main" (6 colors), "cool" (3 colors)}
#'   \item{Sequential}{"sequential1", "sequential2", "sequential3"}
#'   \item{Divergent}{"divergent1", "divergent2", "divergent3"}
#'   \item{Special}{"gray" (monochrome), "evaluate" (performance ratings)}
#' }
#'
#' @section Key Usage Patterns:
#' \preformatted{
#' # Categorical data (groups, species, factors)
#' scale_color_furmanu(palette = "main", discrete = TRUE)
#'
#' # Sequential continuous data (temperatures, scores)  
#' scale_fill_furmanu(palette = "sequential1", discrete = FALSE)
#'
#' # Divergent continuous data (deviations from center)
#' scale_color_furmanu(palette = "divergent1", discrete = FALSE, midpoint = 0)
#' }
#'
#' @section Getting Help:
#' \preformatted{
#' # See all package functions
#' help(package = "themefurmanu")
#'
#' # Visual palette overview
#' show_furmanu_palettes()
#'
#' # Complete tutorial with examples
#' open_furmanu_demo()
#'
#' # Quick reference for daily use
#' open_furmanu_reference()
#'
#' # Help for specific functions
#' ?scale_color_furmanu
#' ?theme_furmanu
#' ?show_furmanu_palettes
#' }
#'
#' @section Font Integration:
#' The package uses system fonts by default for maximum compatibility.
#' For the complete Furman branding experience with IBM Plex fonts,
#' install IBM Plex Sans on your system and use:
#' \code{theme_furmanu(base_family = "IBM Plex Sans")}
#'
#' Use \code{\link{register_furmanu_fonts}} to check font availability.
#'
#' @docType package
#' @name themefurmanu
#' @aliases themefurmanu-package themefurmanu-help
#' @keywords package
NULL
