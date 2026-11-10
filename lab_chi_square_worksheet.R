# ------------------------------------------------------------------------------
# CHI-SQUARE TEST OF INDEPENDENCE (From Summary Table)
# ------------------------------------------------------------------------------

# 1. Enter the counts row-by-row (Row 1: Completed, Row 2: Abandoned)
yawned_counts <- matrix(c(25, 15, 29,   # Yawned
                            14, 23, 15),  # Didn't yawn
                          nrow = 2, 
                          byrow = TRUE)

# 2. Add row and column names
rownames(yawned_counts) <- c("Yawned", "Didn't Yawn")
colnames(yawned_counts) <- c("Morning", "Afternoon", "Evening")

# Display the 2-way table in console
yawned_counts

# 3. Run the Chi-Square Test
chi_test <- chisq.test(yawned_counts)
chi_test

# ------------------------------------------------------------------------------
# 4. CALCULATE COLUMN PROPORTIONS & PLOT STACKED BARS
# ------------------------------------------------------------------------------
# Compute proportions for each time-of-day column (margin = 2)
prop_table <- prop.table(yawned_counts, margin = 2)

# Create the stacked bar plot and save the X-coordinates of the bars
bar_x <- barplot(prop_table, 
                 beside = FALSE,                        # Stacks the bars
                 col = c("lightblue", "salmon"),        # Colors for Yawned / Didn't Yawn
                 ylim = c(0, 1.25),                     # Extra headroom for the legend
                 main = "Yawning Behavior by Time of Day",
                 xlab = "Time of Day", 
                 ylab = "Proportion")

# ------------------------------------------------------------------------------
# 5. CALCULATE Y-COORDINATES & ADD LABELS INSIDE SEGMENTS
# ------------------------------------------------------------------------------
# Y-center for bottom segment (Yawned): half of its proportion height
y_pos_yawned <- prop_table["Yawned", ] / 2

# Y-center for top segment (Didn't Yawn): starts above Yawned segment + half of Didn't Yawn
y_pos_didnt_yawn <- prop_table["Yawned", ] + (prop_table["Didn't Yawn", ] / 2)

# Stack the Y-positions to match the order of the rows in your matrix
y_positions <- rbind(y_pos_yawned, y_pos_didnt_yawn)

# Format the proportions as percentages (e.g., "64.1%")
labels_text <- paste0(round(prop_table * 100, 1), "%")

# Place text labels inside the respective segments
text(x = rep(bar_x, each = 2), 
     y = y_positions, 
     labels = labels_text, 
     col = "black",                                     # Change to "white" if using darker bar colors
     font = 2)

# Add Legend
legend("topright", 
       legend = rownames(prop_table), 
       fill = c("lightblue", "salmon"))


####################################
# Earlier version of bar charts that didn't work

# 4. Check expected cell counts (Assumption check: all expected counts >= 5)
chi_test$expected

# ------------------------------------------------------------------------------
# 1. CALCULATE COLUMN PROPORTIONS
# ------------------------------------------------------------------------------
# margin = 2 computes proportions down each column (within each checkout group)
prop_table <- prop.table(completed_counts, margin = 2)

# Display the calculated proportions in console
prop_table

# ------------------------------------------------------------------------------
# 1. PLOT STACKED BARS AND STORE X-POSITIONS
# ------------------------------------------------------------------------------
bar_x <- barplot(prop_table, 
                 beside = FALSE,                       
                 col = c("steelblue", "coral"),
                 ylim = c(0, 1.25),                    
                 main = "Distribution of Outcomes by Checkout Method",
                 xlab = "Checkout Method", 
                 ylab = "Proportion")

# ------------------------------------------------------------------------------
# 2. CALCULATE Y-COORDINATES FOR CENTER OF EACH SEGMENT
# ------------------------------------------------------------------------------
# Bottom segment (Completed): height is half of its proportion
y_pos_completed <- prop_table["Completed Purchase", ] / 2

# Top segment (Abandoned): height starts above Completed + half of Abandoned
y_pos_abandoned <- prop_table["Completed Purchase", ] + (prop_table["Abandoned Cart", ] / 2)

# Combine Y positions into a matrix matching bar positions
y_positions <- rbind(y_pos_completed, y_pos_abandoned)

# ------------------------------------------------------------------------------
# 3. ADD LABELS INSIDE THE SEGMENTS
# ------------------------------------------------------------------------------
labels_text <- paste0(round(prop_table * 100, 1), "%")

text(x = rep(bar_x, each = 2), 
     y = y_positions, 
     labels = labels_text, 
     col = "white",                                   # White text for readability inside colored bars
     font = 2)

legend("topright", 
       legend = rownames(prop_table), 
       fill = c("steelblue", "coral"))
