# Define Furman University colors

#' Furman University brand colors (hex codes)
#'
#' A named vector of Furman University color hex codes.
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
#' @param ... Character names of Furman colors to extract
#' @return A character vector of hex codes
#' @export
furmanu_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (furmanu_colors)

  furmanu_colors[cols]
}

#' Furman University color palettes
#'
#' A list of named palettes using furmanu colors
#' @export
furmanu_palettes <- list(
  `main` = furmanu_cols("purple", "gray", "light blue", "red", "yellow", "green"),
  `cool` = furmanu_cols("green", "light blue", "gray"),
  `gray` = furmanu_cols("gray", "light gray", "medium gray"),
  `divergent1` = furmanu_cols("red", "light gray", "purple"),
  `divergent2` = furmanu_cols("royal blue", "light gray", "midnight purple"),
  `divergent3` = furmanu_cols("red", "light gray", "green"),
  `sequential1` = furmanu_cols("light blue", "royal blue"),
  `sequential2` = furmanu_cols("light gray", "midnight purple"),
  `sequential3` = furmanu_cols("light gray", "purple"),
  `evaluate` = furmanu_cols("red", "yellow", "green")
)

#' Interpolated color palette from Furman palette
#'
#' @param palette Name of palette to use
#' @param reverse Logical. Should the palette be reversed?
#' @param ... Additional arguments passed to colorRampPalette()
#' @return A function to generate interpolated colors
#' @export
furmanu_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- furmanu_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scale using Furman color palettes
#'
#' @param palette Palette name
#' @param discrete Is the scale discrete?
#' @param reverse Reverse the palette?
#' @param midpoint Optional midpoint value for diverging scales
#' @param ... Other arguments to scale functions
#' @export
scale_color_furmanu <- function(palette = "main", discrete = TRUE, reverse = FALSE, midpoint = NULL, ...) {
  pal <- furmanu_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale(aesthetic = "colour", palette = pal, ...)
  } else {
    colors <- pal(256)

    args <- list(...)

    if (!is.null(midpoint) && length(furmanu_palettes[[palette]]) == 3) {
      lims <- if ("limits" %in% names(args)) args$limits else range(c(0, midpoint))

      ggplot2::scale_color_gradientn(
        colours = colors,
        values = scales::rescale(c(0, midpoint, 1), from = lims),
        ...
      )
    } else {
      ggplot2::scale_color_gradientn(colours = colors, ...)
    }
  }
}

#' Fill scale using Furman color palettes
#'
#' @inheritParams scale_color_furmanu
#' @export
scale_fill_furmanu <- function(palette = "main",
                               discrete = TRUE,
                               reverse = FALSE,
                               midpoint = NULL, ...) {
  pal <- furmanu_pal(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale(aesthetic = "fill", palette = pal, ...)
  } else {
    colors <- pal(256)

    args <- list(...)

    if (!is.null(midpoint) && length(furmanu_palettes[[palette]]) == 3) {
      lims <- if ("limits" %in% names(args)) args$limits else range(c(0, midpoint))

      ggplot2::scale_fill_gradientn(
        colours = colors,
        values = scales::rescale(c(0, midpoint, 1), from = lims),
        ...
      )
    } else {
      ggplot2::scale_fill_gradientn(colours = colors, ...)
    }
  }
}

#' Display all Furman palettes visually
#'
#' Shows all named Furman palettes as horizontal bars.
#'
#' @export
show_furmanu_palettes <- function() {
  n <- length(furmanu_palettes)
  max_cols <- max(sapply(furmanu_palettes, length))
  palette_names <- names(furmanu_palettes)

  # Set larger left margin (bottom, left, top, right)
  old_par <- graphics::par(mar = c(1, 6, 3, 1))

  graphics::plot(
    NULL, xlim = c(0, max_cols), ylim = c(0, n),
    type = "n", axes = FALSE, xlab = "", ylab = "",
    main = "Furman Color Palettes"
  )

  for (i in seq_along(furmanu_palettes)) {
    pal <- furmanu_palettes[[i]]
    for (j in seq_along(pal)) {
      graphics::rect(j - 1, n - i, j, n - i + 0.8, col = pal[j], border = NA)
    }
    graphics::text(-0.2, n - i + 0.4, labels = palette_names[i], adj = 1, xpd = TRUE)
  }

  # Reset margin settings
  graphics::par(old_par)
}
