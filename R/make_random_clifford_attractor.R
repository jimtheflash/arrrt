#' Make a crazy Clifford attractor plot
#' @param point_color chr line color
#' @param n_points num length of vector to draw
#' @param point_shape num shape of point
#' @param point_alpha num alpha of point
#' @return `ggplot` object
#' @export
make_random_clifford_attractor <- function(point_color = 'black',
                                           n_points = 10000000,
                                           point_shape = 46,
                                           point_alpha = .01) {

  # set parameters
  a <- 1 + stats::runif(1)
  b <- 1 + stats::runif(1)
  c <- 1 + stats::runif(1)
  d <- 1 + stats::runif(1)

  # create C function to make points
  Rcpp::cppFunction('DataFrame createTrajectory(int n, double x0, double y0,
                    double a, double b, double c, double d) {
                    // create the columns
                    NumericVector x(n);
                    NumericVector y(n);
                    x[0]=x0;
                    y[0]=y0;
                    for(int i = 1; i < n; ++i) {
                    x[i] = sin(a*y[i-1])+c*cos(a*x[i-1]);
                    y[i] = sin(b*x[i-1])+d*cos(b*y[i-1]);
                    }
                    // return a new data frame
                    return DataFrame::create(_["x"]= x, _["y"]= y);
                    }
                    ')

  # make a trajectory
  df <- createTrajectory(n_points, 0, 0, a, b, c, d)

  # plot it
  ggplot2::ggplot(df, ggplot2::aes(x, y)) +
    ggplot2::geom_point(color = point_color, shape = point_shape, alpha = point_alpha)

}
