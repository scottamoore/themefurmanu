#' themefurmanu: Custom Furman University ggplot2 Theme and Color Palettes
#'
#' The themefurmanu package provides a reusable ggplot2 theme and color palettes
#' designed specifically for Furman University-branded data visualizations.
#' The package includes automated font registration, multiple color palettes
#' suitable for different data types, comprehensive ggplot2 integration,
#' and accessibility tools.
#'
#' @section Main Functions:
#' \itemize{
#'   \item \code{\link{theme_furmanu}}: Main ggplot2 theme with Furman styling
#'   \item \code{\link{theme_furmanu_presentation}}: Theme optimized for presentations
#'   \item \code{\link{theme_furmanu_minimal}}: Minimal theme variant
#'   \item \code{\link{scale_color_furmanu}}: Color scales for ggplot2
#'   \item \code{\link{scale_fill_furmanu}}: Fill scales for ggplot2
#'   \item \code{\link{register_furmanu_fonts}}: Font registration function
#' }
#'
#' @section Palette Functions:
#' \itemize{
#'   \item \code{\link{show_furmanu_palettes}}: Visual palette overview
#'   \item \code{\link{palette_info}}: Detailed palette information
#'   \item \code{\link{extract_colors}}: Extract colors from palettes
#'   \item \code{\link{list_palettes}}: List all available palettes
#'   \item \code{\link{export_palette}}: Export palettes to various formats
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
#' # Check accessibility
#' check_contrast("main")
#'
#' # Export palette
#' export_palette("cool", format = "css")
#' }
#'
#' @section Font Integration:
#' The package automatically registers IBM Plex fonts when loaded, with
#' graceful fallbacks to system fonts when IBM Plex is not available.
#' Font registration can also be done manually using \code{\link{register_furmanu_fonts}}.
#'
#' @docType package
#' @name themefurmanu
#' @aliases themefurmanu-package
NULL
