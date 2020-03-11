test_that("is a ggplot theme", {
  expect_equal(class(theme_arrrt()), c("theme", "gg"))
})
