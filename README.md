
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MATSSforecasting

<!-- badges: start -->

[![Build
Status](https://travis-ci.org/weecology/MATSS-forecasting.svg?branch=master)](https://travis-ci.org/weecology/MATSS-forecasting)
[![Codecov test
coverage](https://codecov.io/gh/weecology/MATSS-forecasting/branch/master/graph/badge.svg)](https://codecov.io/gh/weecology/MATSS-forecasting?branch=master)
<!-- badges: end -->

## Overview

MATSSforecasting is a research compendium for investigationg different
approaches to forecasting ecological time series. It implements multiple
methods to forecasting single time series, as well as metrics of time
series complexity, with the goal of synthesizing the results to provide
guidance on forecasting methods.

## Running the code

This project is set up as an R package compendium. What this means is
much of the core functionality is bundled up into functions that are
documented, much like an R package would. The recommended way to run the
analysis, and/or contribute to the analyses is as follows:

### Installation

There are two main ways to install the package. You can install it using
the automated tools in `devtools`:

``` r
# install.packages("remotes")
remotes::install_github("weecology/MATSS-forecasting")
```

This will automatically install any dependencies, so can be a good way
to start.

### Cloning the repo

However, you will also want the analysis scripts, which are part of this
github repo and not part of the package. You will want to clone this
repo using Git. Here are [some
instructions](https://happygitwithr.com/rstudio-git-github.html) if you
are unfamiliar.

This will then enable you to get the most recent version of the code
from within RStudio, by opening the project, clicking on the Git pane,
and the “Pull” button.

*Since this project is under active development, the codebase is likely
to change rapidly from week to week.*

### Re-building the package

With changes to the package components, you will want to re-build and
install the latest copy. You can do this following the instructions
above using `devtools`. Or if you already have an updated copy within
RStudio, use “Install and Restart” from the “Build” pane.

### Analysis Code

The main control of analysis scripts can be found in `analysis/main.R`.

### Reports

Summarized reports generated via Rmarkdown are visible in the `reports`
folder. Any files with a `.md` extension should be viewable from within
GitHub.
