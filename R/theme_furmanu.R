# FILE: R/themefurmanu.R

#' Register IBM Plex Fonts (with Fallbacks)
#'
#' This function registers IBM Plex Sans and IBM Plex Sans Condensed fonts,
#' falling back to Helvetica, Arial, and sans-serif if not available.
#' Uses systemfonts (preferred) or falls back to base font stack.
#' Call this function in your setup.
#'
#' @export
register_furmanu_fonts <- function() {
  if (!requireNamespace("systemfonts", quietly = TRUE)) {
    warning("systemfonts package not available. Using system font fallbacks only.")
    return(invisible(NULL))
  }

  try({
    sf <- systemfonts::system_fonts()

    if (!"IBM Plex Sans" %in% sf$family) {
      systemfonts::register_font(
        name = "IBM Plex Sans",
        plain = systemfonts::font_file_google("IBM Plex Sans", "regular"),
        bold = systemfonts::font_file_google("IBM Plex Sans", "bold")
      )
    }

    if (!"IBM Plex Sans Condensed" %in% sf$family) {
      systemfonts::register_font(
        name = "IBM Plex Sans Condensed",
        plain = systemfonts::font_file_google("IBM Plex Sans Condensed", "regular"),
        bold = systemfonts::font_file_google("IBM Plex Sans Condensed", "bold")
      )
    }
  }, silent = TRUE)

  invisible(NULL)
}

#' Custom Furman ggplot2 Theme
#'
#' Applies IBM Plex fonts and Furman styling.
#'
#' @param base_size Base font size.
#' @param base_family Optional override for base font family.
#'
#' @return A ggplot2 theme object.
#' @export
#'
#' @import ggplot2
#' @examples
#' library(ggplot2)
#' register_furmanu_fonts()
#' ggplot(mtcars, aes(wt, mpg)) + geom_point() + labs(title="Test title", caption="A demo caption") + theme_furmanu()
theme_furmanu <- function(base_size = 12, base_family = NULL) {
  sf <- systemfonts::system_fonts()
  has_ibm_plex <- "IBM Plex Sans" %in% sf$family
  has_ibm_cond <- "IBM Plex Sans Condensed" %in% sf$family

  fu_font <- if (!is.null(base_family)) base_family else if (has_ibm_plex) "IBM Plex Sans" else "sans"
  fu_graph_font <- if (has_ibm_cond) "IBM Plex Sans Condensed" else "sans"

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
