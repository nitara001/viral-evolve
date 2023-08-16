# viral-evolve

Repository contains scripts, data and key outputs for MSc project examining whether zoonotic viruses are evolving faster in locations experiencing greater environmental disturbance


Datasets used in the analysis:

↳ data → viruses.csv [all viral RNA sequence metadata] 

↳ data → Rabies 

                ↳ rabies.fasta [rabies virus sequences in fasta format]
                ↳ rabies_metadata.csv [rabies metadata]
                ↳ rabies_coords.csv [rabies metadata with latitude and longitude co-ordinates of locations]
                ↳ rabies_tree [rabies phylogeny in newick format]
                

↳ data → West Nile 

                ↳ west nile virus fasta.fasta [west nile virus sequences in fasta format]
                ↳ west_nile_metadata.csv [west nile metadata]
                ↳ westnile_coords.csv [west nile metadata with latitude and longitude co-ordinates of locations]
                ↳ west_nile_tree [west nile phylogeny in newick format]

↳ data → Rasters

                ↳ HILDAplus_vGLOB-1.0_luc_change-freq_1960-2019_wgs84.tif [land use change raster]
                ↳ precip_meanchange_baselinetopresent.tif [precipitaiton change raster]
                ↳ temperature_meanchange_baselinetopresent.tif [temperature change raster]

Scripts to run all models and produce figures:

↳ scripts → data processing
                
                ↳ Distribution of sequences.R [filtering and data availability exploration]
                ↳ gadm subset.R [city and state size calcs]
                ↳ geocode.py [python script- locations to co-ords]
                ↳ tree annotation.R [phylogenetic import]
                ↳ matching tree and metadata.R [extract branch length]
                ↳ data aggregation [group by location]

↳ scripts → models
                
                ↳ correlation_geo_phylo.R [correlation phylogenetic and spatial distances]
                ↳ models.R [gam]
                ↳ moran test.R [spatial autocorrelation residuals]
                ↳ k-cross val.R [k-cross validation ]

↳ scripts → figures
                
                ↳ map of temp change.R [temperature raster with sequence distribution]
                ↳ residual plots.R [test for normality of residuals
