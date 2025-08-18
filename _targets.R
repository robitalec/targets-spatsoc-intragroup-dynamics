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



# Targets -----------------------------------------------------------------
target_list <- c(
  tar_target(
    input_data,
    fread(filepath),
    description = 'fread(filepath)'
  ),

  tar_target(
    prepared_dates,
    prep_dates(
      DT = input_data,
      datetime = datetime
    ),
    description = 'prep_dates()'
  ),

  tar_target(
    temporal_groups,
    group_times(
      DT = prepared_dates,
      datetime = datetime,
      threshold = temporal_threshold
    ),
    description = 'group_times()'
  ),

  tar_target(
    spatial_groups,
    group_pts(
      DT = temporal_groups,
      threshold = spatial_threshold,
      id = id,
      coords = coords,
      timegroup = timegroup
    ),
    description = 'group_pts()'
  ),

