# ISS Location Lookup
# Where is the International Space Station?
#
# Example:
# issLocation <- issLocation()

issLocation <- function() {

  url = "http://api.open-notify.org/iss-now.json"

  dataReturn <-
    httr::GET(url)

  if (httr::status_code(dataReturn) != "200") {
    stop(
      "\nSomething went wrong. Please check the function options to ensure valid values. \n",
      "\nStatus Code: ", httr::status_code(dataReturn)
    )

  } else {
    # Output as dataframe
    jsonlite::fromJSON(httr::content(dataReturn, type = "text"))
  }
}
