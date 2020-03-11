devtools::load_all()
ggplot2::theme_set(theme_arrrt())

make_random_stacked_density(n_lines = 50,
                            palette_colors =
                              sample(c(RColorBrewer::brewer.pal(9, "Oranges"),
                                       RColorBrewer::brewer.pal(9, "Blues")),
                                     50, replace = TRUE)) + ggplot2::theme(plot.margin = ggplot2::unit(c(-4, -4, -4, -4), 'cm'))

make_random_stacked_density(n_lines = 50)
make_random_harmonograph(n = 3, point_alpha = .1)
make_random_stacked_area(groups = 30)
# make_random_clifford_attractor(n_points = 10000000, point_alpha = .01)

make_random_voronoi() + theme_arrrt()

make_random_scatterplot(points = 30, point_shape = 'triangle',
                        size = 50, alpha = .5, background_color = "Light Blue",
                        color = "Purple")
