require "forecast_io"

# configure the Dark Sky API with your API key
ForecastIO.api_key = "2032ae6f9df85d324aa2fd4f3020b8dd"

# do the heavy lifting, use Global Hub lat/long
forecast = ForecastIO.forecast(42.0574063,-87.6722787).to_hash

# pp = pretty print
# use instead of `puts` to make reading a hash a lot easier
# e.g. `pp forecast`
#pp forecast

pp "In Chicago, it is currently #{forecast["currently"]["temperature"]} degrees and #{forecast["currently"]["summary"]}"

day = forecast["daily"]["data"].slice(0,7)

a = 1

for x in day
    pp "#{a} days from now, it will be #{x["temperatureHigh"]} with #{x["summary"]}"
    a = a + 1
end

# Example output:
#
# In Chicago, it is currently 33.89 degress and Clear
# Extended forecast:
# A high temperature of 36.47 and Possible flurries in the afternoon.
# A high temperature of 33.98 and Mostly cloudy throughout the day.
# A high temperature of 33.94 and Possible light snow until evening.
# A high temperature of 32.73 and Mostly cloudy throughout the day.
# A high temperature of 32.51 and Partly cloudy throughout the day.
# A high temperature of 40.42 and Clear throughout the day.
# A high temperature of 23.21 and Overcast throughout the day.
# A high temperature of 29.12 and Clear throughout the day.