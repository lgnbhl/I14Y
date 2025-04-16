# https://rlang.r-lib.org/reference/topic-error-call.html#input-checkers-and-caller-arg-
check_string <- function(x,
                         arg = caller_arg(x),
                         call = caller_env()) {
  if (!is_string(x)) {
    cli::cli_abort("{.arg {arg}} must be a string.", call = call)
  }
}
check_integer <- function(x,
                         arg = caller_arg(x),
                         call = caller_env()) {
  if (!rlang::is_integerish(x)) {
    cli::cli_abort("{.arg {arg}} must be an integer.", call = call)
  }
}
check_logical <- function(x,
                          arg = caller_arg(x),
                          call = caller_env()) {
  if (!is_logical(x)) {
    cli::cli_abort("{.arg {arg}} must be logical.", call = call)
  }
}
check_not_null <- function(x,
                         arg = caller_arg(x),
                         call = caller_env()) {
  if (is_null(x)) {
    cli::cli_abort("{.arg {arg}} should not be null.", call = call)
  }
}
check_internet <- function(x,
                     arg = caller_arg(x),
                     call = caller_env()) {
  if (!curl::has_internet()) {
    cli::cli_abort("No internet connection.", call = call)
  }
}
