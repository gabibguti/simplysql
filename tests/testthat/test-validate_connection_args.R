# skip the actual connection attempt
mockery::stub(.validate_connection_args, "DBI::dbCanConnect", TRUE)

test_that("DBI::dbConnect() calls with named args and with valid `drv` succeed", {
  # fully namespaced call to `DBI::dbConnect`
  expr <- list(
    drv    = quote(RSQLite::SQLite()),
    dbname = ":memory:"
  )

  expect_error(.validate_connection_args(expr), NA)
})

test_that("DBI::dbConnect() calls with unnamed args fail", {
  expr <- list(
    drv = quote(RSQLite::SQLite()),
    ":memory:"
  )

  expect_error(.validate_connection_args(expr))
})

test_that("DBI::dbConnect() calls with unnamespaced `drv` fail", {
  expr <- list(
    drv = quote(SQLite()),
    dbname = ":memory:"
  )

  expect_error(.validate_connection_args(expr))
})

test_that("DBI::dbConnect() calls without drv arg fail", {
  expr <- list(
    dbname = ":memory:"
  )

  expect_error(.validate_connection_args(expr))
})
