 ## SQL query to save the records as a CSV file
copy (SELECT flights.year || '-' || flights.month  || '-' || flights.day  as flightdate, flights.dep_Time,
      flights.origin, 
      flights.carrier, 
      flights.dep_delay, 
      flights.arr_delay, 
      flights.air_time, 
      weather.temp, 
      planes.seats
      FROM 
      public.flights left outer join  public.weather on (
        flights.year = weather.year AND   flights.month = weather.month AND   flights.day = weather.day AND   flights.hour = weather.hour) 
      left Outer join  public.planes on  flights.tailnum = planes.tailnum
      WHERE 
      flights.dest='LAX' 
      AND flights.year=2013 AND ((flights.month =2 AND flights.day in (23, 28)) OR (flights.month =3 AND flights.day =1))) 
TO 'C:\Users\Rajeev\Documents\GitHub\607Project1\FlightInfo.csv' DELIMITER ',' CSV HEADER


## R commands to display the records from CSV file 
library(gdata)
setwd("C:/Users/Rajeev/Documents/GitHub/607Project1")
flightData = read.table(file="FlightInfo.csv", header=TRUE, sep=",")
head(flightData)


  
