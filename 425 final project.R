library(tseries)
library(fBasics)
library(zoo)
library(forecast)
library(lmtest)
library(fUnitRoots)
myd=read.table("UnemploymentRecord.csv",header=T, sep=',') 
x=myd$unrate
summary(x)
hist(x,main="unemployment rate")
xts=ts(myd$unrate,frequency=12,start=c(1948,1))
plot(xts,main="Time plot of unemployment rate")
## normality test
basicStats(xts)
par(mfcol=c(1,2)) 
hist(xts, prob=TRUE, main="Histogram of unemployment rate")
# add approximating normal density curve
xfit<-seq(min(xts),max(xts),length=40)
yfit<-dnorm(xfit,mean=mean(xts),sd=sd(xts))
lines(xfit, yfit, col="blue", lwd=2) 
qqnorm(xts)
qqline(xts, col = 2) 
# Ljung box test
Box.test(xts,lag=3,type='Ljung')
Box.test(xts,lag=6, type='Ljung')
Box.test(xts,lag=20, type='Ljung')
library(fUnitRoots)
adfTest(xts,lags=3,type="nc")#non-stationarity as null hypothesis
adfTest(xts,lags=6,type="nc")
adfTest(xts,lags=20,type="nc")#non-stationarity as null hypothesis
#
par(mfcol=c(1,2)) 
acf(as.vector(xts),lag.max=30, main="ACF plot")
pacf(as.vector(xts),lag.max=30, main="PACF plot")
dxts=diff(xts)
acf(as.vector(dxts),lag.max=40, main="ACF plot")
# 
m1=auto.arima(xts, seasonal=T,allowdrift=T, ic="bic")
coeftest(m1)
acf(as.vector(m1$residuals))
Box.test(m1$residuals, 12, "Ljung-Box",fitdf=length(m1$coef) ) 
Box.test(m1$residuals, 15, "Ljung-Box", fitdf=length(m1$coef)) 

# transform xts
lxts=log(xts)
plot(lxts)
acf(lxts)
pacf(lxts)
dlxts=diff(lxts)
acf(as.vector(dlxts),lag.max=40, main="ACF plot")
# analysis lxts
library(fUnitRoots)
adfTest(lxts,lags=3,type="nc")#non-stationarity as null hypothesis
adfTest(lxts,lags=6,type="nc")
adfTest(lxts,lags=20,type="nc")#
## normality test
basicStats(lxts)
par(mfcol=c(1,2)) 
hist(lxts, prob=TRUE, main="Histogram")
# add approximating normal density curve
xfit<-seq(min(lxts),max(lxts),length=40)
yfit<-dnorm(xfit,mean=mean(lxts),sd=sd(lxts))
lines(xfit, yfit, col="blue", lwd=2) 
qqnorm(lxts)
qqline(lxts, col = 2) 
# Ljung box test
Box.test(lxts,lag=3,type='Ljung')
Box.test(lxts,lag=6, type='Ljung')
Box.test(lxts,lag=20, type='Ljung')
#
acf(as.vector(lxts),lag.max=30, main="ACF plot")
pacf(as.vector(lxts),lag.max=30, main="PACF plot")

# 
m2=auto.arima(lxts, seasonal=T, allowdrift=T,ic="bic")
coeftest(m2)
acf(as.vector(m2$residuals))
Box.test(m2$residuals, 12, "Ljung-Box",fitdf=length(m2$coef) ) 
Box.test(m2$residuals, 15, "Ljung-Box", fitdf=length(m2$coef)) 

# compare m1, m2

source("backtest.R")
ntrain=round(0.9*length(xts))
backtest(m1,xts,ntrain,1)
backtest(m2,lxts,ntrain,1)

# forecast
f2=forecast(m2,h=12)
plot(f2, include=817)
lines(ts(c(f2$fitted,f2$mean), frequency=12,start=c(1948,1)),col="blue")

plot(f2, include=50)
lines(ts(c(f2$fitted, f2$mean), frequency=12,start=c(1948,1)),col="blue")

