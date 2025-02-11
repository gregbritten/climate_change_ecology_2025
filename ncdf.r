
#load libraries
library(ncdf4)
library(here)
library(fields)

#read nc file
nc <- nc_open("../data/boats_gfdl-esm4_nobasd_picontrol_nat_default_tcb_global_monthly_2015_2100.nc")

#coordinates
lon <-  ncvar_get(nc,"lon")
lat <- -ncvar_get(nc,"lat")  #latitude is given from south -> north, but plotting packages wants it reversed

#variables
tcb <- ncvar_get(nc,"tcb")[,length(lat):1,]   #reverse lat order according to reverse order of latitude

#make a basic plot
image.plot(lon,lat,tcb[,,1],xlab='',ylab='')    
mtext('latitude',side=2,line=3)
mtext('longitude',side=1,line=3)
mtext(expression('Total consumer biomass [g m'^{-2}*']'),line=0,adj=0.1)

