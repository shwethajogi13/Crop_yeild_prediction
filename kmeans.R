yeilddata <- read.csv("C:/Users/lenovo/OneDrive/Desktop/AgrcultureDataset.csv")
yielddata
head(yielddata,n=50)
tail(yielddata,n=50)
summary(yeilddata)
plot(yielddata)
# yield data labels
yielddata.labels = yeilddata$Season
table(yielddata.labels)
yielddata_crop <- yeilddata[, numeric()]
yielddata_crop
#scale data
yeilddata_crop_scale <- scale(yeilddata_crop)

