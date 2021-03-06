#' @title Read in the LPI time series
#'
#' @description Import LPI abundance time series that are included with the 
#'   `rlpi` package
#' 
#' @param min_time_series_length the minimum length for time series to be 
#'   included
#' @return list of two dataframes (one with abundance data, the other with 
#'   covariate data) and one list of metadata.
#'
#' @export
#' 
get_LPI_data <- function(min_time_series_length = 25)
{

    dat <- readr::read_csv("https://raw.githubusercontent.com/Zoological-Society-of-London/rlpi/master/inst/extdata/example_data/LPI_LPR2016data_public.csv") %>%
        
        # convert "NULL" data to proper NA values
        replace(., . == "NULL", NA) %>%
        
        # convert abundances to numeric
        dplyr::mutate_at(dplyr::vars(dplyr::starts_with("19")), as.numeric) %>%
        dplyr::mutate_at(dplyr::vars(dplyr::starts_with("20")), as.numeric) %>%
        
        # convert wide-format years into long-format
        tidyr::gather("Year", "Value", "1950":"2015") %>%
        dplyr::mutate_at(dplyr::vars("Year", "Value"), as.numeric) %>%
        
        # count number of observations
        dplyr::group_by(.data$ID) %>%
        dplyr::filter(is.finite(.data$Value)) %>%
        dplyr::mutate(num_obs = dplyr::n()) %>%
        dplyr::ungroup() %>%
        
        # keep only the species with at least 25 observations
        dplyr::filter(.data$num_obs >= min_time_series_length) %>%
        
        # rename variables to be all lowercase
        dplyr::rename_all(tolower) %>%
        
        # make all ids unique %>%
        dplyr::mutate(id = dplyr::group_indices(., id))
    
    # spread species to separate columns
    abundance_table <- dat %>%
        dplyr::select(c("id", "year", "value")) %>%
        tidyr::spread(.data$id, .data$value)
    
    # calculate start and end time for each time series to be added to metadata
    time_table <- dat %>%
        dplyr::select(c("id", "year", "value")) %>%
        dplyr::group_by(id) %>%
        dplyr::summarize(start_time = min(.data$year), end_time = max(.data$year))
    
    data_LPI <- list(abundance = abundance_table %>%
                         dplyr::select(-.data$year), 
                     covariates = abundance_table %>% 
                         dplyr::select(.data$year), 
                     metadata = list(species_table = dat %>%
                                         dplyr::select(c("id", "Species_name" = "binomial", 
                                                         "class", "order", "family", "genus", "species", "subspecies", 
                                                         "location", "country", "region", 
                                                         "latitude", "longitude", 
                                                         "system", "t_realm", 
                                                         "t_biome", "fw_realm", "fw_biome", 
                                                         "m_realm", "m_ocean", "m_biome", 
                                                         "units", "method")) %>%
                                         dplyr::distinct(.data$id, .keep_all = TRUE) %>%
                                         dplyr::full_join(time_table, by = "id"), 
                                     timename = "year")
                     
    )
    return(data_LPI)
}
