#!/bin/bash
dir=https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/;
msg1=time_series_covid19_confirmed_global.csv;
msg2=time_series_covid19_deaths_global.csv;
curl $dir$msg1>$msg1
curl $dir$msg2>$msg2