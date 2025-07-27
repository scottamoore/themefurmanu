# FILE: R/zzz.R

# This file defines behavior when the package is loaded or attached.

.onAttach <- function(libname, pkgname) {
  try(register_furmanu_fonts(), silent = FALSE)
}

.onLoad <- function(libname, pkgname) {
  # Future-proofing: could add other registration logic here
  invisible(NULL)
}
