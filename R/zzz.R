# FILE: R/zzz.R

# This file defines behavior when the package is loaded or attached.

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Registering Furman fonts...")
  try(register_furmanu_fonts(), silent = TRUE)
}

.onLoad <- function(libname, pkgname) {
  # Future-proofing: could add other registration logic here
  invisible(NULL)
}
