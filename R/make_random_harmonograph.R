make_random_harmonograph <- function(n = 4,
                                     t) {

  f1=jitter(sample(c(2,3),1));f2=jitter(sample(c(2,3),1));f3=jitter(sample(c(2,3),1));f4=jitter(sample(c(2,3),1))
  d1=runif(1,0,1e-02);d2=runif(1,0,1e-02);d3=runif(1,0,1e-02);d4=runif(1,0,1e-02)
  p1=runif(1,0,pi);p2=runif(1,0,pi);p3=runif(1,0,pi);p4=runif(1,0,pi)
  xt = function(t) exp(-d1*t)*sin(t*f1+p1)+exp(-d2*t)*sin(t*f2+p2)
  yt = function(t) exp(-d3*t)*sin(t*f3+p3)+exp(-d4*t)*sin(t*f4+p4)
  t=seq(1, 100, by=.001)
  dat=data.frame(t=t, x=xt(t), y=yt(t))
  with(dat, plot(x,y, type="l", xlim =c(-2,2), ylim =c(-2,2), xlab = "", ylab = "", xaxt='n', yaxt='n'))

  n_list <- list()

  for (i in 1:n) {
    f <- jitter(sample(c(2, 3), 1))
    d <- stats::runif(1, 0, 1e-02)
    p <- stats::runif(1, 0, pi)
    n_list[[length(n_list) + 1]] <- data.frame(f = f, d = d, p = p)
  }
  n_df <- do.call(rbind, n_list)

  make_points <- function(n_df, t, even_odd) {
    if (even_odd == 'even') {
      indices <- c(FALSE,  TRUE)
    } else {
      indices <- c(TRUE, FALSE)
    }
    subsetted <- n_df[indices, ]
    to_sum <- c()
    for (j in 1:nrow(subsetted)) {
      to_sum[[length(to_sum) + 1]]  <-
        exp((-1 * subsetted$d[[j]]) * t) *
        sin(t * subsetted$f[[j]] + subsetted$p[[j]])
    }
    summed <- sum(unlist(to_sum))
    return(summed)
  }

  t <- time_sequence

  plot_data <- data.frame(
    t = time_sequence,
    x = make_points(n_df, t, 'even'),
    y = make_points(n_df, t, 'odd')
    )

  ggplot2::ggplot(plot_data, ggplot2::aes(x, y)) +
    ggplot2::geom_line(size = .01) +
    ggplot2::coord_cartesian(xlim = c(-2, 2), ylim = c(-2, 2)) +
    theme_arrrt()
}
