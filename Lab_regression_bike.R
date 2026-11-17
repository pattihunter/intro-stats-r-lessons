# 1. Load the daily bike share data
bikes <- read.csv("day.csv")

# 2. Rescale normalized weather columns into familiar units
#    (In the raw UCI file, temp is divided by 41 C and hum by 100)
bikes$temp_C   <- bikes$temp * 41
bikes$temp_F   <- bikes$temp_C * 1.8 + 32
bikes$humidity <- bikes$hum * 100

# 3. Inspect the variables we will use
summary(bikes[, c("cnt", "temp_F", "humidity", "workingday", "yr")])

# Inspect column names and structure
str(bikes)
head(bikes)

# Fit simple linear regression
model_1 <- lm(cnt ~ temp_F, data = bikes)
summary(model_1)

# Visualize the relationship
plot(bikes$temp_F, bikes$cnt,
     main = "Daily Bike Rentals vs. Temperature",
     xlab = "Temperature (°F)",
     ylab = "Total Daily Rentals (cnt)",
     pch = 19, col = "steelblue")
abline(model_1, col = "darkred", lwd = 2)

# Fit multiple regression with two numeric predictors
model_2 <- lm(cnt ~ temp_F + humidity, data = bikes)
summary(model_2)

# You can verify your hand calculation with R:
predict(model_2, newdata = data.frame(temp_F = c(75, 75), humidity = c(80, 40)))

# Add workingday and yr to the model
model_3 <- lm(cnt ~ temp_F + humidity + workingday + yr, data = bikes)
summary(model_3)
