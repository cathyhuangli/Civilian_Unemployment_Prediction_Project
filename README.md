# Time_Series_Prediction_Project

## Introduction
 “The U.S. unemployment rate just fell below 5% for the first time since 2008… The economy is better than it was in the Great Recession, but not even President Obama is ready to declare it's booming…”. To understand how the unemployment rate is going to change before our graduation, we need to fit a time series model for the data and make a forecast to see if the economy is booming or it will still be hard to find a job. 

In this project, we applied time series analysis; check stationarity and seasonal pattern before fitting seasonal ARIMA models to the unemployment rate data and make forecasts.

## Goal
The unemployment rate is always a hot topic across the world, and especially concerned with us who are living and studying in the USA and probably trying to find a job after graduation. Therefore, we choose this dataset that is the summary of unemployment rate, which represents the number of unemployed as a percentage of the labor force [1].

The goal of our research is to analyze the properties of the time series object unemployment rate and to identify an adequate model to explain the data. By analyzing several possible model and select the most appropriate model to explain the time process that produced the data. After we selected the model, we will check the adequacy of the model using residual analysis and model diagnostics techniques, for example using back-testing procedures to validate the selected model on a testing.

## Metholody

First, we performed Descriptive analyze of Unemployment rate and Pattern discovery of Unemployment rate. And in order to build a model to fit the data, we need to firstly check the assumptions of non-stationarity and seasonal pattern in the data.

Next, we implemented Model fitting and selection.

Finally, we forecast the next 12 month's unemployment rate based on the selected model by BIC and Back testing method

Original vs Forecast from year 2012-2017



## Result

From the forecasted value of the unemployment rate, we would suggest anyone who is graduating try to find a job as soon as possible. It seems next year the overall unemployment rate is increasing.

At this point, we have achieved our goal of finding a match for our data and make a forecast using the model. From our selected model m2, ARIMA (2,1,2)(2,0,0) with logarithm transformation of the original data, it seems the unemployment rate is going to increase the following months, not good news to students who are graduating this summer. But the good news is the overall forecast is going to merge to the mean in the long run. So timing of finding a job is very important.  


### References
1.	The Federal Reserve bank of St. Louis, https://research.stlouisfed.org/fred2/series/UNRATE?catbc=1&utm_expid=19978471-2.Y0NpAPxIQfK_8K7-O4DTQg.1&utm_referrer=https%3A%2F%2Fresearch.stlouisfed.org%2Ffred2%2Frelease%3Frid%3D50#
2.	CNN news,
http://money.cnn.com/2016/02/06/news/economy/obama-us-jobs/
3.	The financial forecast center
http://www.forecasts.org/unemploy.htm
