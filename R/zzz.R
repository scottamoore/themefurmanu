# FILE: R/zzz.R

# This file defines behavior when the package is loaded or attached.

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("themefurmanu loaded. For help: ?themefurmanu_help or open_furmanu_demo()")
  try(register_furmanu_fonts(), silent = FALSE)
}

.onLoad <- function(libname, pkgname) {
  # Future-proofing: could add other registration logic here
  invisible(NULL)
}
