# R scripts for FRE 6411 
# Original Code written by Jerzy
# Edited by Po-Hsuan (Michael) Lin
# Date: 03/16/2018

# Select the data for extraction
symbols <- c("DGS1", "DGS2", "DGS3", "DGS5", "DGS10", "DGS20", "DGS30")
# Use the library quantmod which has a built-in library of functions
library(quantmod)
# Create a new environment for data
env_fred <- new.env()
# Extract data
getSymbols(symbols, env=env_fred, src="FRED")
# Show each individual series using chart_Series
# chart_Series(env_fred$DGS1["1990/"],name="1-year constant maturity Treasury rate")

# get end-of-year dates since 2006
dates <- xts::endpoints(env_fred$DGS1["2006/"], on="years")
dates <- zoo::index(env_fred$DGS1["2006/"])[dates]
# create time series of end-of-year rates
rates <- eapply(env_fred, function(rate) rate[dates])
rates <- rutils::do_call(cbind, rates)
# rename columns and rows, sort columns, and transpose into matrix
colnames(rates) <- substr(colnames(rates), start=4, stop=11)
rates <- rates[, order(as.numeric(colnames(rates)))]
colnames(rates) <- paste0(colnames(rates), "yr")
rates <- t(rates)
colnames(rates) <- substr(colnames(rates), start=1, stop=4)
# plot matrix using plot.zoo()
col_ors <- colorRampPalette(c("red", "blue"))(NCOL(rates))
plot.zoo(rate_s, main="Yield curve since 2006", lwd=3, xaxt="n",
         plot.type="single", xlab="maturity", ylab="yield", col=col_ors)
# add x-axis
axis(1, seq_along(rownames(rates)), rownames(rates))
# add legend
legend("bottomright", legend=colnames(rates),
       col=col_ors, lty=1, lwd=4, inset=0.05, cex=0.8)

