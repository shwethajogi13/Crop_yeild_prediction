mydata <- read.csv(file.choose())

mydata

plot(mydata$Production ~ mydata$Area)
 
plot(mydata$Crop_Year ~ mydata$Production)

plot(mydata$Crop ~ mydata$Production)


plot(mydata$Production ~ mydata$Area)
linmod = lm(mydata$Area ~ mydata$Production)
abline(linmod, col="blue")
#without having any color
abline(linmod)
linmod
