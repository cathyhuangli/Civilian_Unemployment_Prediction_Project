library(TSA)
#win.graph(width=4.875, height=2.5,pointsize=8)
#since larain is already a time series format data, do not need to use zoo
data(larain); plot(larain,ylab='Inches',xlab='Year',type='o')
plot(y=larain,x=zlag(larain),ylab='Inches',
     xlab='Previous Year Inches')
data(color)
plot(color,ylab='Color Property',xlab='Batch',type='o')
plot(y=color,x=zlag(color),ylab='Color Property',
     xlab='Previous Batch Color Property')
data(hare); plot(hare,ylab='Abundance',xlab='Year',type='o')
plot(y=hare,x=zlag(hare),ylab='Abundance',
     xlab='Previous Year Abundance')
data(tempdub); plot(tempdub,ylab='Temperature',type='o')

data(oilfilters); plot(oilfilters,type='o',ylab='Sales')
plot(oilfilters,type='l',ylab='Sales')
points(y=oilfilters,x=time(oilfilters),
         pch=as.vector(season(oilfilters))) # add month initial on the graph

 # rwalk contains a simulated random walk
data(rwalk)
model1=lm(rwalk~time(rwalk))
summary(model1)
plot(rwalk,type='o',ylab='y')
abline(model1) # add the fitted least squares line from model1

data(tempdub)
month.=season(tempdub) # period added to improve table display
model2=lm(tempdub~month.-1) # -1 removes the intercept term
summary(model2)

library(fBasics)

