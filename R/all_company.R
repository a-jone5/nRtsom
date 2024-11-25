#'"Pull single company of data"
#'
#'@return a dataframe containing storm overflow data for
#'all water companies on the portal
#'@examples
#'df <- all_company()
#'@importFrom magrittr %>%
#'@export

all_company <- function(){

  ang <- "https://services3.arcgis.com/VCOY1atHWVcDlvlJ/arcgis/rest/services/stream_service_outfall_locations_view/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
  yks <- "https://services-eu1.arcgis.com/1WqkK5cDKUbF0CkH/arcgis/rest/services/Yorkshire_Water_Storm_Overflow_Activity/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
  nwl <- "https://services-eu1.arcgis.com/MSNNjkZ51iVh8yBj/arcgis/rest/services/Northumbrian_Water_Storm_Overflow_Activity_2_view/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
  svt <- "https://services1.arcgis.com/NO7lTIlnxRMMG9Gw/arcgis/rest/services/Severn_Trent_Water_Storm_Overflow_Activity/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
  sou <- "https://services-eu1.arcgis.com/XxS6FebPX29TRGDJ/arcgis/rest/services/Southern_Water_Storm_Overflow_Activity/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
  sww <- "https://services-eu1.arcgis.com/OMdMOtfhATJPcHe3/arcgis/rest/services/NEH_outlets_PROD/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
  tha <- "https://services2.arcgis.com/g6o32ZDQ33GpCIu3/arcgis/rest/services/Thames_Water_Storm_Overflow_Activity_(Production)_view/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
  uu <- "https://services5.arcgis.com/5eoLvR0f8HKb7HWP/arcgis/rest/services/United_Utilities_Storm_Overflow_Activity/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"
  wes <- "https://services.arcgis.com/3SZ6e0uCvPROr4mS/arcgis/rest/services/Wessex_Water_Storm_Overflow_Activity/FeatureServer/0/query?outFields=*&where=1%3D1&f=geojson"

  urls <- list(c(ang,yks,nwl,svt,sou,sww,tha,uu,wes))

  dat <- purrr::map(urls[[1]],
                    single_company,
                    .progress = T) %>%
    dplyr::bind_rows()

  return(dat)

}

