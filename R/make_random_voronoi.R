#' Make a voronoi plot of random points
#' @details Creates a data.frame of points length,
#' with column `x` drawn from random normal distribution,
#' column `y` from random uniform distribution,
#' and column `z` from random normal distribution.
#' @param shapes num number of shapes to make
#' @param n_colors num number of colors to use in plot
#' @param gradient logical should color gradient be used
#' @param color_palette chr name of color palette to use
#' @param palette_colors chr list of colors, usually generated from `get_palette_colors()`
#' @param fill_color chr name of color to be used for fill
#' @param line_color chr name of color to be used for line
#' @param line_size num size of line width
#' @return `ggplot` object
#' @export
make_random_voronoi <- function(shapes = sample(c(10, 100, 1000), 1),
                                n_colors = round(shapes / 2),
                                gradient = TRUE,
                                color_palette = NULL,
                                palette_colors = get_palette_colors(color_palette, n_colors),
                                fill_color = NULL,
                                line_color = NULL,
                                line_size = NULL) {

  # make random data
  plot_df <- data.frame(
    x = stats::runif(shapes),
    y = stats::runif(shapes),
    z = stats::runif(shapes)
  )

  # fill/line colors
  if (is.null(fill_color)) {
    fill_color <- palette_colors
  }
  if (is.null(line_color)) {
    line_color <- palette_colors
  }

  # make plot
  gg <- ggplot2::ggplot(plot_df, ggplot2::aes(x = x, y = y))

  # color
  if (gradient == TRUE) {
    gg <- gg +
      ggforce::geom_voronoi_tile(ggplot2::aes(fill = x)) +
      ggforce::geom_voronoi_segment(ggplot2::aes(color = x))
  } else {
    gg <- gg +
      ggforce::geom_voronoi_tile(ggplot2::aes(fill = z)) +
      ggforce::geom_voronoi_segment(ggplot2::aes(color = z))
  }
  gg  <- gg +
    ggplot2::scale_color_gradientn(colors = line_color) +
    ggplot2::scale_fill_gradientn(colors = fill_color)

  return(gg)
}
