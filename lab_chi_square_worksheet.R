# ------------------------------------------------------------------------------
# CHI-SQUARE TEST OF INDEPENDENCE (From Summary Table)
# ------------------------------------------------------------------------------

# 1. Enter the counts row-by-row (Row 1: Completed, Row 2: Abandoned)
completed_counts <- matrix(c(20, 15, 23,   # Completed Purchase
                            8, 12, 13),  # Abandoned Cart
                          nrow = 2, 
                          byrow = TRUE)

# 2. Add row and column names
rownames(completed_counts) <- c("Completed purchase", "Abandoned cart")
colnames(completed_counts) <- c("Standard", "One-click", "Progress")

# Display the 2-way table in console
completed_counts

# 3. Run the Chi-Square Test
chi_test <- chisq.test(completed_counts)
chi_test

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
# 2. Stacked Bar Chart (100% Stacked)
# ------------------------------------------------------------------------------
barplot(prop_table, 
        beside = FALSE,                       # Stacks bars on top of each other
        col = c("steelblue", "coral"),
        ylim = c(0, 1.25),                    # Leave headroom for the legend
        main = "Distribution of Outcomes by Page Design",
        xlab = "Page Design", 
        ylab = "Proportion")

legend("topright", 
       legend = rownames(prop_table), 
       fill = c("steelblue", "coral"))
