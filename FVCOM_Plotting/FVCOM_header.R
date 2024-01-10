## ---------------------------
## Script name: FVCOM_header.R
##
## Purpose of script: installs and opens dependencies for FVCOM plotting with R
##
## Date Created: 2024-01-10
##
## Software code created by U.S. Government employees is 
## not subject to copyright in the United States 
## (17 U.S.C. §105).
##
## Email: george.maynard@noaa.gov
##
## ---------------------------
## Notes: based on information from https://github.com/BigelowLab/fvcom
##   
##
## ---------------------------

## List of packages
packages=c(
  "ncdf4",
  "rlang",
  "dplyr",
  "tibble",
  "sf",
  "raster",
  "fasterize",
  "locate",
  "devtools"
)

## Check to see if the packages are installed. If not, install them.
for(p in packages){
  if(p %in% installed.packages()==FALSE){
    install.packages(p)
  }
}

## Manually add the FVCOM plotting package from github if necessary
if("fvcom" %in% install.packages()==FALSE){
  devtools::install_github("BigelowLab/fvcom")
}

## Load all necessary packages
packages=c(
  packages,
  "fvcom"
)
for(p in packages){
  eval(bquote(library(.(p))))
}

## Open an FVCOM