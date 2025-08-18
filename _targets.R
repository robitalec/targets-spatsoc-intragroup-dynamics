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

