#' `ggplot` theme for `arrrt` objects
#' @importFrom ggplot2 %+replace%
#' @param ... args passed to `theme_void()`
#' @return ggplot theme
#' @export
theme_arrrt <- function(...) {
  ggplot2::theme_void(...) +
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
                 legend.position = 'none',
                 # adding all this to remove warning about omitting them when using theme_set()
                 axis.title.x = ggplot2::element_blank(),
                 axis.title.x.top = ggplot2::element_blank(),
                 axis.title.y = ggplot2::element_blank(),
                 axis.title.y.right = ggplot2::element_blank(),
                 axis.text.x = ggplot2::element_blank(),
                 axis.text.x.top = ggplot2::element_blank(),
                 axis.text.y = ggplot2::element_blank(),
                 axis.text.y.right = ggplot2::element_blank(),
                 axis.line.x = ggplot2::element_blank(),
                 axis.line.y = ggplot2::element_blank(),
                 legend.background = ggplot2::element_blank(),
                 legend.margin = ggplot2::element_blank(),
                 legend.spacing = ggplot2::element_blank(),
                 legend.spacing.x = ggplot2::element_blank(),
                 legend.spacing.y = ggplot2::element_blank(),
                 legend.key = ggplot2::element_blank(),
                 legend.key.height = ggplot2::element_blank(),
                 legend.key.width = ggplot2::element_blank(),
                 legend.text.align = 0,
                 legend.title.align = 0,
                 legend.direction = 0,
                 legend.justification = 0,
                 legend.box.margin = ggplot2::element_blank(),
                 legend.box.background = ggplot2::element_blank(),
                 legend.box.spacing = ggplot2::element_blank(),
                 panel.spacing.x = ggplot2::element_blank(),
                 panel.spacing.y = ggplot2::element_blank(),
                 panel.grid.minor = ggplot2::element_blank(),
                 strip.background = ggplot2::element_blank(),
                 strip.placement = 'none',
                 strip.text.x = ggplot2::element_blank(),
                 strip.text.y = ggplot2::element_blank())
}
