# ------------------------------------------------------------------------------
# CHI-SQUARE TEST OF INDEPENDENCE (From Summary Table)
# ------------------------------------------------------------------------------

# 1. Enter the counts row-by-row (Row 1: Completed, Row 2: Abandoned)
checkout_counts <- matrix(c(20, 15, 23,   # Completed Purchase
                            8, 12, 13),  # Abandoned Cart
                          nrow = 2, 
                          byrow = TRUE)

# 2. Add row and column names
rownames(checkout_counts) <- c("Completed Purchase", "Abandoned Cart")
colnames(checkout_counts) <- c("Standard", "One-Click", "Progress")

# Display the 2-way table in console
checkout_counts

# 3. Run the Chi-Square Test
chi_test <- chisq.test(checkout_counts)
chi_test

# 4. Check expected cell counts (Assumption check: all expected counts >= 5)
chi_test$expected

# ------------------------------------------------------------------------------
# 1. CALCULATE COLUMN PROPORTIONS
# ------------------------------------------------------------------------------
# margin = 2 computes proportions down each column (within each checkout group)
prop_table <- prop.table(checkout_counts, margin = 2)

# Display the calculated proportions in console
prop_table

# ------------------------------------------------------------------------------
# 2. Stacked Bar Chart (100% Stacked)
# ------------------------------------------------------------------------------
barplot(prop_table, 
        beside = FALSE,                       # Stacks bars on top of each other
        col = c("steelblue", "coral"),
        ylim = c(0, 1.25),                    # Leave headroom for the legend
        main = "Distribution of Outcomes by Checkout Method",
        xlab = "Checkout Method", 
        ylab = "Proportion")

legend("topright", 
       legend = rownames(prop_table), 
       fill = c("steelblue", "coral"))
