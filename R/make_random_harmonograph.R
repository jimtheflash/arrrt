#' Draw a harmonograph using random data
#' @details inspired by and based on https://fronkonstin.com/2014/10/13/beautiful-curves-the-harmonograph/
#' @param n num how many parameter terms
#' @param sequence num vector how many points to draw
#' @param point_size num size of point in `geom_point`
#' @param point_alpha num alpha of point in `geom_point`
#' @param ... other args passed on to `geom_point`
#' @return `ggplot` object
#' @export
make_random_harmonograph <- function(n = 4,
                                     sequence = seq(0, 100, by = .001),
                                     point_size = .5,
                                     point_alpha = .5,
                                     ...) {

  # make some random parameters
  param_list <- list()

  for (i in 1:n) {
    f <- jitter(sample(c(2, 3), 1))
    d <- stats::runif(1, 0, 1e-02)
    p <- stats::runif(1, 0, pi)
    param_list[[length(param_list) + 1]] <- data.frame(
      f = f,
      d = d,
      p = p)
  }
  param_df <- do.call(rbind, param_list)

  # make a function to generate points
  make_points <- function(param_df, even_odd) {

    # split into even and odd rows
    if (even_odd == 'even') {
      indices <- c(FALSE,  TRUE)
    } else {
      indices <- c(TRUE, FALSE)
    }
    # get only the rows we care about
    subsetted <- param_df[indices, ]

    # loop through sequence to make points
    points <- c()
    for (s in sequence) {
      terms <- c()
      for (r in 1:nrow(subsetted)) {
        coefs <- subsetted[r, ]
        # compute the term for those coefficients and time point
        term <- exp((-1 * subsetted$d[[r]]) * s) *
          sin(s * subsetted$f[[r]] + subsetted$p[[r]])
        terms[[length(terms) + 1]] <- term
      }
      point <- sum(terms)
      points[[length(points) + 1]] <- point
    }
    return(points)
  }

  plot_data <- data.frame(
    t = sequence,
    x = make_points(param_df, 'odd'),
    y = make_points(param_df, 'even')
    )

  ggplot2::ggplot(plot_data, ggplot2::aes(x, y)) +
    ggplot2::geom_point(size = .2, alpha = .1, ...) +
    ggplot2::coord_cartesian(xlim = c(-2, 2), ylim = c(-2, 2)) +
    arrrt::theme_arrrt()
}
