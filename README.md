
[![DOI](https://zenodo.org/badge/1038067070.svg)](https://doi.org/10.5281/zenodo.16898183)

# targets-spatsoc-intragroup-dynamics

A template [`targets`](https://github.com/ropensci/targets) workflow for
measuring intragroup social dynamics from GPS data with
[`spatsoc`](https://github.com/ropensci/spatsoc/).

``` mermaid
graph LR
  style Legend fill:#FFFFFF00,stroke:#000000;
  style Graph fill:#FFFFFF00,stroke:#000000;
  subgraph Legend
    xf1522833a4d242c5(["Up to date"]):::uptodate
    xd03d7c7dd2ddda2b(["Regular target"]):::none
  end
  subgraph Graph
    direction LR
    x346d09d418e9b158(["step_directions"]):::uptodate --> x3beb570a7cf0e1dc(["delay_edges<br>edge_delay()"]):::uptodate
    x11880ed5069abb8c(["id_fusions<br>fusion_id()"]):::uptodate --> x3beb570a7cf0e1dc(["delay_edges<br>edge_delay()"]):::uptodate
    xd1855d56aaab0158(["id_dyads<br>dyad_id()"]):::uptodate --> xd135d6fa41781589(["direction_edges<br>edge_direction()"]):::uptodate
    x788f41fdc4e37558(["spatial_groups<br>group_pts()"]):::uptodate --> xd135d6fa41781589(["direction_edges<br>edge_direction()"]):::uptodate
    x6ba603f6e8293383(["group_centroids<br>centroid_group()"]):::uptodate --> x680328a354ce8bff(["direction_to_centroids<br>direction_to_centroid()"]):::uptodate
    xb817b55e688fdfc3(["group_direction_leaders<br>leader_direction_group()"]):::uptodate --> x82786d09c0fcc8be(["direction_to_group_dir_leaders<br>direction_to_leader()"]):::uptodate
    x1faf6e798011c143(["temporal_groups<br>group_times()"]):::uptodate --> x365b64b036e1db58(["distance_edges<br>edge_dist()"]):::uptodate
    x6ba603f6e8293383(["group_centroids<br>centroid_group()"]):::uptodate --> x24bed789ce236423(["distance_to_centroids<br>distance_to_centroid()"]):::uptodate
    xb817b55e688fdfc3(["group_direction_leaders<br>leader_direction_group()"]):::uptodate --> xa036b69b269981da(["distance_to_group_dir_leaders<br>distance_to_leader()"]):::uptodate
    xd1855d56aaab0158(["id_dyads<br>dyad_id()"]):::uptodate --> x884798be03ef20d0(["dyad_centroids<br>centroid_dyad()"]):::uptodate
    x1faf6e798011c143(["temporal_groups<br>group_times()"]):::uptodate --> x884798be03ef20d0(["dyad_centroids<br>centroid_dyad()"]):::uptodate
    x3beb570a7cf0e1dc(["delay_edges<br>edge_delay()"]):::uptodate --> x994414e4774e3751(["edge_delay_leaders<br>leader_edge_delay()"]):::uptodate
    x11880ed5069abb8c(["id_fusions<br>fusion_id()"]):::uptodate --> x25d985acde8f25cc(["fusion_centroids<br>centroid_fusion()"]):::uptodate
    x1faf6e798011c143(["temporal_groups<br>group_times()"]):::uptodate --> x25d985acde8f25cc(["fusion_centroids<br>centroid_fusion()"]):::uptodate
    x1073df0072bfb123(["group_directions<br>direction_group()"]):::uptodate --> x6ba603f6e8293383(["group_centroids<br>centroid_group()"]):::uptodate
    x6ba603f6e8293383(["group_centroids<br>centroid_group()"]):::uptodate --> xb817b55e688fdfc3(["group_direction_leaders<br>leader_direction_group()"]):::uptodate
    x346d09d418e9b158(["step_directions"]):::uptodate --> x1073df0072bfb123(["group_directions<br>direction_group()"]):::uptodate
    x365b64b036e1db58(["distance_edges<br>edge_dist()"]):::uptodate --> xd1855d56aaab0158(["id_dyads<br>dyad_id()"]):::uptodate
    xd1855d56aaab0158(["id_dyads<br>dyad_id()"]):::uptodate --> x11880ed5069abb8c(["id_fusions<br>fusion_id()"]):::uptodate
    x346d09d418e9b158(["step_directions"]):::uptodate --> x834929c790cf2d7b(["polarization<br>direction_polarization()"]):::uptodate
    x93f130c6adab4dbb(["prepared_geometry<br>get_geometry()"]):::uptodate --> x74f74fb4673261e6(["prepared_dates<br>prep_dates()"]):::uptodate
    x769da6568e9cd872(["input_data<br>fread(filepath)"]):::uptodate --> x93f130c6adab4dbb(["prepared_geometry<br>get_geometry()"]):::uptodate
    x1faf6e798011c143(["temporal_groups<br>group_times()"]):::uptodate --> x788f41fdc4e37558(["spatial_groups<br>group_pts()"]):::uptodate
    x788f41fdc4e37558(["spatial_groups<br>group_pts()"]):::uptodate --> x346d09d418e9b158(["step_directions"]):::uptodate
    x74f74fb4673261e6(["prepared_dates<br>prep_dates()"]):::uptodate --> x1faf6e798011c143(["temporal_groups<br>group_times()"]):::uptodate
    
  end
  classDef uptodate stroke:#000000,color:#ffffff,fill:#354823;
  classDef none stroke:#000000,color:#000000,fill:#94a4ac;
```

## Usage

1.  Clone/fork/download/etc make your own copy somewhere!
2.  Add your data to the input folder (and remove the example data)
3.  Open `_targets.R`
4.  Change the global variables in the Variables section
5.  Run `targets::tar_make()`

## Resources

- {spatsoc}
  - <https://docs.ropensci.org/spatsoc/>
- {targets}
  - <https://docs.ropensci.org/targets>
  - <https://books.ropensci.org/targets>
