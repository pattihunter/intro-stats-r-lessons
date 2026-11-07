# ------------------------------------------------------------------------------
# CHI-SQUARE TEST OF INDEPENDENCE (From Summary Table)
# ------------------------------------------------------------------------------

# 1. Enter the counts row-by-row (Row 1: Completed, Row 2: Abandoned)
tip_counts <- matrix(c(32, 16, 24,   # Completed Purchase
                            48, 64, 56),  # Abandoned Cart
                          nrow = 2, 
                          byrow = TRUE)

# 2. Add row and column names
rownames(tip_counts) <- c("Left tip", "No tip")
colnames(tip_counts) <- c("Joke", "Ad", "No card")

# Display the 2-way table in console
tip_counts

# 3. Run the Chi-Square Test
chi_test <- chisq.test(tip_counts)
chi_test

# 4. Check expected cell counts (Assumption check: all expected counts >= 5)
chi_test$expected

# ------------------------------------------------------------------------------
# 1. CALCULATE COLUMN PROPORTIONS
# ------------------------------------------------------------------------------
# margin = 2 computes proportions down each column (within each checkout group)
prop_table <- prop.table(tip_counts, margin = 2)

# Display the calculated proportions in console
prop_table

# ------------------------------------------------------------------------------
# 2. Stacked Bar Chart (100% Stacked)
# ------------------------------------------------------------------------------
barplot(prop_table, 
        beside = FALSE,                       # Stacks bars on top of each other
        col = c("steelblue", "coral"),
        ylim = c(0, 1.25),                    # Leave headroom for the legend
        main = "Distribution of Outcomes by Card Type",
        xlab = "Card Type", 
        ylab = "Proportion")

legend("topright", 
       legend = rownames(prop_table), 
       fill = c("steelblue", "coral"))
