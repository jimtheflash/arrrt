#' Reproduce an image using voronoi tesselations
#' @importFrom magrittr %>%
#' @param image_path chr path to image (currently a jpg but could be other formats)
#' @param sample_size num how many points to sample when generating tiles
#' @param threshold chr numbers followed by percent sign
#' @return `ggplot` object
#' @export
make_voronoi_image <- function(image_path = NULL,
                               sample_size = 2000,
                               threshold = '10%') {

  # Read and convert to grayscale
  x <- imager::load.image(image_path) %>%
    imager::grayscale()

  # This is just to define frame limits
  rw <- x %>%
    as.data.frame() %>%
    dplyr::group_by() %>%
    dplyr::summarize(xmin = min(x),
                     xmax = max(x),
                     ymin = min(y),
                     ymax = max(y)) %>%
    as.vector()

  # Filter image to convert it to bw
  df <- x %>%
    imager::threshold("10%") %>%
    imager::as.cimg() %>%
    as.data.frame()

  # Function to compute and plot Voronoi tesselation depending on sample size
  #Voronoi tesselation
  data <- df %>%
    dplyr::sample_n(sample_size,
                    weight = (1 - value)) %>%
    dplyr::select(x, y) %>%
    deldir::deldir(rw = rw, sort = TRUE) %>%
    .$dirsgs

  # This is just to add some alpha to lines depending on its longitude
  data <- data %>%
    dplyr::mutate(
      long = sqrt((x1 - x2)^2 + (y1 - y2)^2),
      alpha = findInterval(long, stats::quantile(long, probs = seq(0, 1, length.out = 20)))/21)

  # A little bit of ggplot to plot results
  gg <- ggplot2::ggplot(data, ggplot2::aes(alpha = (1 - alpha))) +
    ggplot2::geom_segment(ggplot2::aes(x = x1,
                                       y = y1,
                                       xend = x2,
                                       yend = y2),
                          color = "black",
                          lwd = 1) +
    ggplot2::scale_x_continuous(expand = c(0,0)) +
    ggplot2::scale_y_continuous(expand = c(0,0), trans = scales::reverse_trans())

  return(gg)
}

