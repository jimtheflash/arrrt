#' Make random stacked area plot
#' @details Idea and code from 'https://www.r-graph-gallery.com/137-spring-shapes-data-art.html'
#' @param groups num how many groups to create
#' @param n_colors num how many different colors
#' @param color_palette chr color palette
#' @param palette_colors chr list of colors, usually generated from `get_palette_colors()`
#' @return `ggplot` object
#' @export
make_random_stacked_area <- function(groups = 20,
                                     n_colors = groups,
                                     color_palette = NULL,
                                     palette_colors = get_palette_colors(color_palette, n_colors)) {
  # make data
  df_list <- list()
  for(i in seq(1:groups)) {
    df_list[[length(df_list) + 1]] <- data.frame(
        x = rep(i, groups),
        y = prop.table(sample(c(rep(0, 100), c(1:groups)), groups)),
        z = as.character(sample(1:groups, groups))
        )
  }
  df <- do.call(rbind, df_list)
  df <- df[order(df$x, df$y), ]
  df <- na.omit(df)

  # make plot
  gg <- ggplot2::ggplot(df, ggplot2::aes(x = x, y = y, color = z, fill = z)) +
    ggplot2::geom_area() +
    ggplot2::scale_color_manual(values = palette_colors) +
    ggplot2::scale_fill_manual(values = palette_colors)

  return(gg)

}
