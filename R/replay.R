lastFuzzTest <- new.env(parent = emptyenv())

replay <- function(indices = integer(), debug = TRUE) {
  assertthat::assert_that(assertthat::is.flag(debug))
  purrr::map(indices, function(index) assertthat::assert_that(assertthat::is.count(index)))
  purrr::map(indices, function(index) {
    if (debug) debugonce(lastFuzzTest$results[[index]][["test_result"]][["call"]][["fun"]])
    do.call(
      lastFuzzTest$results[[index]][["test_result"]][["call"]][["fun"]],
      lastFuzzTest$results[[index]][["test_result"]][["call"]][["args"]]
    )
  })
}
