#' themefurmanu Package Overview and Function Index
#'
#' @description
#' Complete overview of the themefurmanu package with all available functions.
#' This is your go-to reference for package capabilities.
#'
#' @section Two Main Functions (Unified Approach):
#' Unlike other packages that have many different function names, themefurmanu
#' uses just TWO main functions that handle all color needs:
#' \itemize{
#'   \item \code{\link{scale_color_furmanu}(palette, discrete, ...)}
#'   \item \code{\link{scale_fill_furmanu}(palette, discrete, ...)}
#' }
#'
#' @section Essential Starting Functions:
#' \describe{
#'   \item{\code{\link{show_furmanu_palettes}()}}{SEE all available palettes visually}
#'   \item{\code{\link{theme_furmanu}()}}{Apply Furman theme to plots}
#'   \item{\code{\link{open_furmanu_demo}()}}{Open complete tutorial}
#'   \item{\code{\link{list_palettes}()}}{List all palette names}
#' }
#'
#' @section All Color/Fill Functions:
#' \describe{
#'   \item{\code{\link{scale_color_furmanu}()}}{Main color scale function}
#'   \item{\code{\link{scale_fill_furmanu}()}}{Main fill scale function}
#'   \item{\code{\link{furmanu_cols}()}}{Get individual colors by name}
#'   \item{\code{\link{furmanu_pal}()}}{Get palette function}
#' }
#'
#' @section All Theme Functions:
#' \describe{
#'   \item{\code{\link{theme_furmanu}()}}{Standard theme}
#'   \item{\code{\link{theme_furmanu_presentation}()}}{Presentation theme (larger text)}
#'   \item{\code{\link{theme_furmanu_minimal}()}}{Minimal theme}
#' }
#'
#' @section All Palette Information Functions:
#' \describe{
#'   \item{\code{\link{show_furmanu_palettes}()}}{Visual display of all palettes}
#'   \item{\code{\link{list_palettes}()}}{Text list of all palettes}
#'   \item{\code{\link{palette_info}()}}{Details about specific palette}
#'   \item{\code{\link{extract_colors}()}}{Extract N colors from any palette}
#' }
#'
#' @section All Accessibility Functions:
#' \describe{
#'   \item{\code{\link{check_contrast}()}}{Check WCAG contrast compliance}
#'   \item{\code{\link{accessible_combinations}()}}{Find accessible color pairs}
#' }
#'
#' @section All Export Functions:
#' \describe{
#'   \item{\code{\link{export_palette}()}}{Export palette to CSS/JSON/RGB formats}
#' }
#'
#' @section All Help Functions:
#' \describe{
#'   \item{\code{\link{open_furmanu_demo}()}}{Comprehensive tutorial document}
#'   \item{\code{\link{open_furmanu_reference}()}}{Quick reference guide}
#' }
#'
#' @section All Font Functions:
#' \describe{
#'   \item{\code{\link{register_furmanu_fonts}()}}{Check IBM Plex font availability}
#' }
#'
#' @examples
#' # Most common usage patterns:
#' \dontrun{
#' library(ggplot2)
#' library(themefurmanu)
#'
#' # See all palettes
#' show_furmanu_palettes()
#'
#' # Categorical data
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point() +
#'   scale_color_furmanu("main", discrete = TRUE) +
#'   theme_furmanu()
#'
#' # Sequential data  
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_furmanu("sequential1", discrete = FALSE) +
#'   theme_furmanu()
#'
#' # Divergent data
#' ggplot(mtcars, aes(wt, hp, color = mpg - mean(mpg))) +
#'   geom_point() +
#'   scale_color_furmanu("divergent1", discrete = FALSE, midpoint = 0) +
#'   theme_furmanu()
#' }
#'
#' @name themefurmanu-overview
#' @aliases themefurmanu-functions themefurmanu-index themefurmanu-reference
#' @keywords package overview functions
NULL
