green <- get_palette_colors('Greens', 1)
test_that("returns character", {
  expect_equal(class(green), "character")
})
