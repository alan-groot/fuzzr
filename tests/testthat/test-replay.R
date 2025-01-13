test_that("replay works", {
  fr3 <- fuzz_function_call(quote(dirname(".")))

  result <- replay(indices = c(1L, 2L), debug = FALSE)
  expect_identical(
    result, list(fr3[[1]]$test_result$value, fr3[[2]]$test_result$value)
  )
})
