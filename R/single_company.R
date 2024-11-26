#'"Pull single company of data"
#'
#'@param url for the API on waterUK portal
#'@return a dataframe containing storm overflow data
#'@examples
#'df <- single_company(url)
#'@importFrom magrittr %>%
#'@export

single_company <- function(url){

  sf::read_sf(url) %>%
    dplyr::rename_with(tolower) %>%
    dplyr::select(
      id,
      company,
      status,
      statusstart,
      latesteventstart,
      latesteventend,
      latitude,
      longitude,
      receivingwatercourse,
      lastupdated,
      objectid,
      geometry
    ) %>%
    dplyr::mutate(
      dplyr::across(dplyr::contains(c("Start","End","Updated")),
                    ~ date_convert(.x)
      ),
      dplyr::across(dplyr::where(is.character),
                    ~ tolower(.x)
      ),
      status = dplyr::case_when(
        status==1 ~ "start",
        status==0 ~ "end",
        status==-1 ~ "offline"
      )
    )

}


#'change date formats single_company
#'@param x is a unix timestamp (to millisecs)
#'this changes to secs and converts to iso8601
#'@noRd

date_convert <- function(x) {
  suppressWarnings(
    dplyr::if_else(is.na(x)|!is.numeric(as.numeric(substr(x, 1, 10))),
            NA,
            as.POSIXct(as.numeric(substr(x, 1, 10)),
                       origin = "1970-01-01",
                       tz = "UTC"))
  )
}





