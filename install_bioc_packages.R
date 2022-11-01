BiocManager::install(version = "3.15")
BiocManager::install(
  c(
    'pcaMethods', 
    'Biostrings',
    'Rsubread',
    'DropletUtils',
    'BiocGenerics',
    'DelayedArray',
    'DelayedMatrixStats',
    'limma',
    'lme4',
    'S4Vectors',
    'SingleCellExperiment',
    'SummarizedExperiment',
    'batchelor',
    'Matrix.utils',
    'HDF5Array',
    'terra',
    'ggrastr',
    'celda',
    'GENIE3'
  ), version = "3.15", clean = TRUE
)
