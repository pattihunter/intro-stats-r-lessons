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


# Fit a simple linear model
model_simple <- lm(pop ~ acous, data = songs80s)
summary(model_simple)

# Basic scatterplot (x = acous, y = pop)
plot(songs80s$acous, songs80s$pop,
     main = "1980s Song Popularity vs. Acoustic",
     xlab = "Acoustic",
     ylab = "Popularity Score",
     pch = 19,              # Solid circles
     col = "steelblue")     # Point color


# Optional: Add the simple linear regression line
abline(lm(pop ~ acous, data = songs80s), col = "darkred", lwd = 2)


# Fit a simple linear model
model_simple <- lm(nrgy ~ acous, data = songs80s)
summary(model_simple)

# Basic scatterplot (x = acous, y = nrgy)
plot(songs80s$nrgy, songs80s$acous,
     main = "1980s Song Energy vs. Acoustic",
     xlab = "Acoustic",
     ylab = "Energy",
     pch = 19,              # Solid circles
     col = "steelblue")     # Point color


# Optional: Add the simple linear regression line
abline(lm(nrgy ~ acous, data = songs80s), col = "darkred", lwd = 2)


# ---------------------------------------------------------
# 1. STUDENTS EDIT ONLY THESE TWO LINES (keep quotes):
EXPLANATORY <- "dB"
RESPONSE    <- "nrgy"
# ---------------------------------------------------------

# Build the formula dynamically
reg_formula <- as.formula(paste(RESPONSE, "~", EXPLANATORY))

# Fit the simple linear model
model_simple <- lm(reg_formula, data = songs80s)
summary(model_simple)

# Basic scatterplot (x = EXPLANATORY, y = RESPONSE)
plot(songs80s[[EXPLANATORY]], songs80s[[RESPONSE]],
     main = paste("1980s Song", RESPONSE, "vs.", EXPLANATORY),
     xlab = EXPLANATORY,
     ylab = RESPONSE,
     pch  = 19,
     col  = "steelblue")

# Add the simple linear regression line
abline(model_simple, col = "darkred", lwd = 2)
