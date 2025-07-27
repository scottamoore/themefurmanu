#' Package Help: Complete Function Reference for themefurmanu
#'
#' @description
#' This page provides a complete reference to all functions in the themefurmanu package.
#' Use this as your starting point for discovering package capabilities.
#'
#' @section MOST IMPORTANT FUNCTIONS (Start Here):
#' \itemize{
#'   \item \code{\link{scale_color_furmanu}()}: THE main color function - use for all color needs
#'   \item \code{\link{scale_fill_furmanu}()}: THE main fill function - use for all fill needs
#'   \item \code{\link{theme_furmanu}()}: THE main theme function
#'   \item \code{\link{show_furmanu_palettes}()}: See all available color palettes visually
#'   \item \code{\link{open_furmanu_demo}()}: Open comprehensive tutorial
#' }
#'
#' @section PALETTE DISCOVERY:
#' \itemize{
#'   \item \code{\link{show_furmanu_palettes}()}: Visual display of all palettes
#'   \item \code{\link{list_palettes}()}: Text list of all available palettes
#'   \item \code{\link{palette_info}(name)}: Get details about a specific palette
#'   \item \code{\link{furmanu_cols}(name)}: Get individual colors by name
#' }
#'
#' @section THEME FUNCTIONS:
#' \itemize{
#'   \item \code{\link{theme_furmanu}()}: Standard theme (12pt font)
#'   \item \code{\link{theme_furmanu_presentation}()}: Larger fonts for slides (16pt)
#'   \item \code{\link{theme_furmanu_minimal}()}: Clean, minimal version
#' }
#'
#' @section ACCESSIBILITY & QUALITY:
#' \itemize{
#'   \item \code{\link{check_contrast}(palette)}: Check WCAG accessibility compliance
#'   \item \code{\link{accessible_combinations}()}: Find accessible color pairs
#' }
#'
#' @section ADVANCED TOOLS:
#' \itemize{
#'   \item \code{\link{extract_colors}(palette, n)}: Get exact number of colors from palette
#'   \item \code{\link{export_palette}(palette, format)}: Export to CSS/JSON/RGB
#' }
#'
#' @section HELP & LEARNING:
#' \itemize{
#'   \item \code{\link{open_furmanu_demo}()}: Complete tutorial with examples
#'   \item \code{\link{open_furmanu_reference}()}: Quick reference guide
#' }
#'
#' @section AVAILABLE PALETTES:
#' \itemize{
#'   \item \strong{Categorical}: "main" (6 colors), "cool" (3 colors)
#'   \item \strong{Sequential}: "sequential1", "sequential2", "sequential3"
#'   \item \strong{Divergent}: "divergent1", "divergent2", "divergent3"
#'   \item \strong{Special}: "gray" (monochrome), "evaluate" (performance)
#' }
#'
#' @section QUICK START EXAMPLES:
#' \preformatted{
#' library(ggplot2)
#' library(themefurmanu)
#'
#' # 1. CATEGORICAL DATA (groups, species, factors)
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point() +
#'   scale_color_furmanu(palette = "main", discrete = TRUE) +
#'   theme_furmanu()
#'
#' # 2. SEQUENTIAL DATA (continuous, one direction)
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#'   geom_tile() +
#'   scale_fill_furmanu(palette = "sequential1", discrete = FALSE) +
#'   theme_furmanu()
#'
#' # 3. DIVERGENT DATA (deviations from center point)
#' ggplot(mtcars, aes(wt, hp, color = mpg - mean(mpg))) +
#'   geom_point() +
#'   scale_color_furmanu(palette = "divergent1", discrete = FALSE, midpoint = 0) +
#'   theme_furmanu()
#' }
#'
#' @section HOW TO GET HELP:
#' \preformatted{
#' # See this help page
#' ?themefurmanu_help
#' 
#' # See all package functions
#' help(package = "themefurmanu")
#' 
#' # Visual overview of palettes
#' show_furmanu_palettes()
#' 
#' # Complete tutorial
#' open_furmanu_demo()
#' 
#' # Quick reference
#' open_furmanu_reference()
#' 
#' # Help for specific functions
#' ?scale_color_furmanu
#' ?theme_furmanu
#' }
#'
#' @name themefurmanu_help
#' @aliases package_help furmanu_help help
#' @keywords package help reference
NULL
