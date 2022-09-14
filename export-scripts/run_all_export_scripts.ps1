###########################################################################################-
###########################################################################################-
##
## Running all data export scripts
##
###########################################################################################-
###########################################################################################-

#-----------------------------------------------------------------------------------------#
# setup
#-----------------------------------------------------------------------------------------#

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# get parent dir for absolute path
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

$base_dir = Get-Location | Split-Path

$Env:base_dir = $base_dir

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Choose database to use, set env var
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

$Env:data_env = Read-Host "staging [s] or prod [p]?"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #
# Tell conda which environment to load
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - #

conda activate r-reticulate

#=========================================================================================#
# R
#=========================================================================================#

#-----------------------------------------------------------------------------------------#
# EXP data
#-----------------------------------------------------------------------------------------#

Write-Output ">>> EXP_indicator_data_writer"

Rscript $base_dir\export-scripts\EXP_indicator_data_writer.R

#-----------------------------------------------------------------------------------------#
# NR viz data (for VegaLite)
#-----------------------------------------------------------------------------------------#

Write-Output ">>> NR_data_csv_writer"

Rscript $base_dir\export-scripts\NR_data_csv_writer.R

#-----------------------------------------------------------------------------------------#
# NR JSON data (for report)
#-----------------------------------------------------------------------------------------#

Write-Output ">>> NR_json_writer"

Rscript $base_dir\export-scripts\NR_json_writer.R


#=========================================================================================#
# Python
#=========================================================================================#

#-----------------------------------------------------------------------------------------#
# EXP metadata
#-----------------------------------------------------------------------------------------#

Write-Output ">>> EXP_indicator_metadata_writer"

python $base_dir\export-scripts\EXP_indicator_metadata_writer.py

#-----------------------------------------------------------------------------------------#
# NR spark bars
#-----------------------------------------------------------------------------------------#

Write-Output ">>> NR_SparkBarExport"

python $base_dir\export-scripts\NR_SparkBarExport.py


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# #
# #                             ---- THIS IS THE END! ----
# #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
