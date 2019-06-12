

library(readr)

data <- read_delim("data.csv", ";", escape_double = FALSE, 
                   col_types = cols(Timestamp = col_datetime(format = "%Y-%m-%dT%H:%M")), 
                   trim_ws = TRUE)

temperature <- read_delim("temperature.csv", ";", escape_double = FALSE,
                          col_types = cols(Timestamp = col_datetime(format = "%Y-%m-%dT%H:%M")), 
                          trim_ws = TRUE)

temperature$StationName = NULL
yhdistetty = merge(data,temperature, by="Timestamp")


write_delim(yhdistetty, "yhdistetty.csv", delim = ";")
