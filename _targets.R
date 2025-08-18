# === {spatsoc} intragroup dynamics - {targets} workflow -----------------
# Alec L. Robitaille


# Packages ----------------------------------------------------------------
library(targets)
library(tarchetypes)
library(qs2)

library(data.table)
library(spatsoc)
library(units)


# Functions ---------------------------------------------------------------
tar_source('R')



# Targets options ---------------------------------------------------------
tar_option_set(format = 'qs')


# Variables --------------------------------------------------------------
filepath <- file.path('input', 'DT.csv')
temporal_threshold <- '10 minutes'
spatial_threshold <- 50

datetime <- 'datetime'
id <- 'ID'
coords <- c('X', 'Y')
projection <- 32736

timegroup <- 'timegroup'
group <- 'group'



