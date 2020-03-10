#' Make a scatterplot of random points
#' @details Creates a data.frame of points length,
#' with column `x` drawn from random normal distribution,
#' column `y` from random uniform distribution,
#' and column `z` from random normal distribution.
#' @param points num number of points
#' @param point_shape chr shape of points
#' @param background_color chr background color;
#' defaults to `NA` which defers to default theme options
#' @param ... other args passed to `geom_point()`, including
#' `alpha`, `size`, `color`, etc.
#' @return `ggplot` object
#' @export
make_random_scatterplot <- function(points = 5000,
                                    point_shape = 'square',
                                    background_color = NA,
                                    ...) {

  shape <- switch(point_shape,'square' = 15L,
                              'circle' = 16L,
                              'triangle' = 17L)

  # make random data
  plot_df <- data.frame(
    x = stats::rnorm(points),
    y = stats::runif(points),
    z = stats::rnorm(points)
  )

  # make a ggplot
  gg <- ggplot2::ggplot(plot_df, ggplot2::aes(x = x, y = y)) +
    ggplot2::geom_point(shape = shape, ...) +
    arrrt::theme_arrrt()

  # adjust background color if you'd like
  if (!is.na(background_color)) {
    gg <- gg +
      ggplot2::theme(
        panel.background = ggplot2::element_rect(fill = background_color))
  }

  return(gg)

}
