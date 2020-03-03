# get the base image, the rocker/verse has R, RStudio and pandoc
FROM rocker/verse:3.6.1

# required
MAINTAINER Advika Battini <your_email@somewhere.com>

COPY . /data598week7

# go into the repo directory
RUN . /etc/environment \
  # Install linux depedendencies here
  # e.g. need this for ggforce::geom_sina
  && sudo apt-get update \
  && sudo apt-get install libudunits2-dev -y \
  # build this compendium package
  && R -e "devtools::install('/data598week7', dep=TRUE)" \
  # render the manuscript into a docx, you'll need to edit this if you've
  # customised the location and name of your main Rmd file
  && R -e "devtools::check('/data598week7',error_on = 'error')"
