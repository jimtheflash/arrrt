#' `ggplot` theme for `arrrt` objects
#' @importFrom ggplot2 %+replace%
#' @param ... args passed to `theme_void()`
#' @return ggplot theme
#' @export
theme_arrrt <- function(...) {
  ggplot2::theme_void(...) %+replace%
  ggplot2::theme(panel.background = ggplot2::element_blank(),
                 panel.border = ggplot2::element_blank(),
                 panel.grid = ggplot2::element_blank(),
                 panel.spacing = ggplot2::unit(c(-2, -2, -2, -2), 'cm'),
                 plot.background = ggplot2::element_blank(),
                 plot.margin = ggplot2::unit(c(-2, -2, -2, -2), 'cm'),
                 axis.text = ggplot2::element_blank(),
                 axis.ticks = ggplot2::element_blank(),
                 axis.title = ggplot2::element_blank(),
                 axis.line = ggplot2::element_blank(),
                 legend.position = 'none')
}
