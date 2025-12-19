# === {spatsoc} intragroup dynamics - {targets} workflow -----------------
# Alec L. Robitaille


# Packages ----------------------------------------------------------------
library(targets)
library(tarchetypes)
suppressPackageStartupMessages(library(qs2))

library(data.table)
library(spatsoc)
suppressPackageStartupMessages(library(units))


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
utm <- 32736

timegroup <- 'timegroup'
group <- 'group'

# edge_dist
returnDist <- TRUE
fillNA <- FALSE

# dyad_id
id1 <- 'ID1'
id2 <- 'ID2'

# fusion_id
n_min_length <- 3
n_max_missing <- 1
allow_split <- FALSE

# edge_delay
window <- 3


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

  tar_target(
    step_directions,
    direction_step(
      DT = spatial_groups,
      id = id,
      coords = coords,
    )
  ),

  tar_target(
    group_directions,
    direction_group(
      DT = step_directions
    ),
    description = 'direction_group()'
  ),

   tar_target(
    group_centroids,
    centroid_group(
      DT = group_directions,
      coords = coords
    ),
    description = 'centroid_group()'
  ),

  tar_target(
    group_direction_leaders,
    leader_direction_group(
      DT = group_centroids,
      coords = coords,
      return_rank = TRUE
    ),
    description = 'leader_direction_group()'
  ),

  tar_target(
    direction_to_group_dir_leaders,
    direction_to_leader(
      DT = group_direction_leaders,
      coords = coords
    ),
    description = 'direction_to_leader()'
  ),

  tar_target(
    distance_to_group_dir_leaders,
    distance_to_leader(
      group_direction_leaders,
      coords = coords
    ),
    description = 'distance_to_leader()'
  ),

  tar_target(
    distance_edges,
    edge_dist(
      DT = temporal_groups,
      threshold = spatial_threshold,
      id = id,
      coords = coords,
      timegroup = timegroup,
      returnDist = returnDist,
      fillNA = fillNA
    ),
    description = 'edge_dist()'
  ),

  tar_target(
    id_dyads,
    dyad_id(
      DT = distance_edges,
      id1 = id1,
      id2 = id2
    ),
    description = 'dyad_id()'
  ),

  tar_target(
    id_fusions,
    fusion_id(
      edges = id_dyads,
      threshold = spatial_threshold,
      n_min_length = n_min_length,
      n_max_missing = n_max_missing,
      allow_split = allow_split
    ),
    description = 'fusion_id()'
  ),

  tar_target(
    delay_edges,
    edge_delay(
      edges = id_fusions,
      DT = step_directions,
      window = window,
      id = id
    ),
    description = 'edge_delay()'
  ),

  tar_target(
    edge_delay_leaders,
    leader_edge_delay(
      edges = delay_edges
    ),
    description = 'leader_edge_delay()'
  ),

  tar_target(
    fusion_centroids,
    centroid_fusion(
      edges = id_fusions,
      DT = temporal_groups,
      id = id,
      coords = coords
    ),
    description = 'centroid_fusion()'
  ),

  tar_target(
    dyad_centroids,
    centroid_dyad(
      edges = id_dyads,
      DT = temporal_groups,
      id = id,
      coords = coords
    ),
    description = 'centroid_dyad()'
  ),

  tar_target(
    polarization,
    direction_polarization(
      DT = step_directions
    ),
    description = 'direction_polarization()'
  )

)
