#' Get colors from specified color palette
#' @param color_palette chr name of color palette; if NULL selects random palette from `grDevices::hcl.pals()`
#' @param n_colors num how many colors to return
#' @return chr vector of colors from palette
#' @export
get_palette_colors <- function(color_palette = NULL,
                               n_colors) {
  # if no color_palette, use a random palette
  if(is.null(color_palette) || !(color_palette %in% grDevices::hcl.pals())) {
    color_palette <- sample(grDevices::hcl.pals(), 1)
    message("Unknown or missing color_palette; randomly selected ", color_palette)
  }
  # get vector of colors
  palette_colors <- grDevices::hcl.colors(n = n_colors, palette = color_palette)
  # return vector of colors
  return(palette_colors)
}
