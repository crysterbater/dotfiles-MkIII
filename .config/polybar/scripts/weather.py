import pyowm
# -*- coding: utf-8 -*-

owm = pyowm.OWM('55a6d5e8e1732eba9f2faebc3390dfc2') 
observation = owm.weather_at_place("Victoria, Canada")
w = observation.get_weather()
temperature = w.get_temperature()
temperature = temperature['temp_max'] - 273.15
status = w.get_status();
icon_code = w.get_weather_code()
icon = ""
print status, int(temperature)
