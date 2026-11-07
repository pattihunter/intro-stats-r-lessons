# ==============================================================================
# TWO-SAMPLE T-TEST: Knee Surgery Recovery Time (LT 8)
# ==============================================================================
# Scenario: Comparing recovery time (in days) between patients receiving 
# Standard treatment vs. New anti-inflammatory medication.
# ==============================================================================

# ------------------------------------------------------------------------------
# STEP 1: Load Unstacked CSV Data
# ------------------------------------------------------------------------------
# Load data (Columns: Standard, New)
recovery_data <- read.csv("recovery_time.csv")

# Inspect the first 6 rows
head(recovery_data)

# ------------------------------------------------------------------------------
# STEP 2: Calculate Summary Statistics
# ------------------------------------------------------------------------------
# Calculate sample means (x_bar)
mean_standard <- mean(recovery_data$Standard, na.rm = TRUE)
mean_new      <- mean(recovery_data$New, na.rm = TRUE)

# Calculate sample standard deviations (sd)
sd_standard   <- sd(recovery_data$Standard, na.rm = TRUE)
sd_new        <- sd(recovery_data$New, na.rm = TRUE)

# Print summary statistics in console
cat("Standard Treatment -> Mean:", round(mean_standard, 1), "| SD:", round(sd_standard, 1), "\n")
cat("New Medication     -> Mean:", round(mean_new, 1),      "| SD:", round(sd_new, 1), "\n")

# ------------------------------------------------------------------------------
# STEP 3: Plot the Distributions
# ------------------------------------------------------------------------------
# Side-by-side boxplots to compare the distributions
boxplot(recovery_data$Standard, recovery_data$New,
        names = c("Standard", "New"),
        main = "Knee Replacement Recovery Time by Treatment",
        ylab = "Recovery Time (Days)",
        col = c("skyblue", "lightgreen"))

# Optional: Stacked dotplots / stripcharts to mirror your applet view
stripchart(list(Standard = recovery_data$Standard, New = recovery_data$New),
           method = "stack", 
           pch = 19, 
           col = c("blue", "darkgreen"),
           main = "Distribution of Recovery Times",
           xlab = "Recovery Time (Days)")

# ------------------------------------------------------------------------------
# STEP 4: Two-Sample t-Test & 95% Confidence Interval
# ------------------------------------------------------------------------------
# Run two-sample t-test comparing (mu_Standard - mu_New)
# H0: mu_Standard - mu_New = 0
# Ha: mu_Standard - mu_New != 0
t_test_output <- t.test(recovery_data$Standard, recovery_data$New)

# Display full t-test output in console
t_test_output

# Extract specific values for discussion:
# - p-value:
t_test_output$p.value

# - 95% Confidence Interval for (mu_Standard - mu_New):
t_test_output$conf.int
