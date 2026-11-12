# Load the dataset
songs80s <- read.csv("1980.csv")

# Inspect column names and structure
str(songs80s)
head(songs80s)

# Fit a simple linear model
model_simple <- lm(pop ~ dB, data = songs80s)
summary(model_simple)

# Basic scatterplot (x = dB, y = pop)
plot(songs80s$dB, songs80s$pop,
     main = "1980s Song Popularity vs. Loudness",
     xlab = "Loudness (dB)",
     ylab = "Popularity Score",
     pch = 19,              # Solid circles
     col = "steelblue")     # Point color

# Optional: Add the simple linear regression line
abline(lm(pop ~ dB, data = songs80s), col = "darkred", lwd = 2)

# Fit a multiple linear regression model
model_mult <- lm(pop ~ dB + nrgy + dnce, data = songs80s)
summary(model_mult)

cor(songs80s$dB, songs80s$nrgy)

# Fit a simple linear model
model_simple <- lm(pop ~ nrgy, data = songs80s)
summary(model_simple)

# Basic scatterplot (x = dB, y = pop)
plot(songs80s$nrgy, songs80s$pop,
     main = "1980s Song Popularity vs. Energy",
     xlab = "Energy (nrgy)",
     ylab = "Popularity Score",
     pch = 19,              # Solid circles
     col = "steelblue")     # Point color


# Optional: Add the simple linear regression line
abline(lm(pop ~ nrgy, data = songs80s), col = "darkred", lwd = 2)
