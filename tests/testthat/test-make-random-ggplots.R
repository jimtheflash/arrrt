
clifford_attractor <- make_random_clifford_attractor(n_points = 1000)
test_that("make_random_clifford_attractor returns a graph", {
  expect_equal(class(clifford_attractor), c("gg", "ggplot"))
})

harmonograph <- make_random_harmonograph()
test_that("make_random_harmonograph returns a graph", {
  expect_equal(class(harmonograph), c("gg", "ggplot"))
})

scatterplot <- make_random_scatterplot()
test_that("make_random_scatterplot returns a graph", {
  expect_equal(class(scatterplot), c("gg", "ggplot"))
})

stacked_area <- make_random_stacked_area()
test_that("make_random_stacked_area returns a graph", {
  expect_equal(class(stacked_area), c("gg", "ggplot"))
})

stacked_density <- make_random_stacked_density()
test_that("make_random_stacked_density returns a graph", {
  expect_equal(class(stacked_density), c("gg", "ggplot"))
})

voronoi <- make_random_voronoi()
test_that("make_random_voronoi returns a graph", {
  expect_equal(class(voronoi), c("gg", "ggplot"))
})
