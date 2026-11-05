# ==============================================================================
# LAB 1: ANOVA & COMPARING MULTIPLE MEANS
# Course: Introductory Statistics
# ==============================================================================
# INSTRUCTIONS: 
# 1. Highlight code lines and click "Run" (or press Ctrl+Enter / Cmd+Enter).
# 2. Answer the reflection questions directly in this file by typing after the #.
# ==============================================================================

# ------------------------------------------------------------------------------
# TASK 1: Load the Data & View Summary Statistics
# ------------------------------------------------------------------------------

# 1a. Run this line to load the dataset into R:
study_data <- read.csv("sound_study.csv")

# 1b. View the first few rows of the data:
head(study_data)

# 1c. Run these lines to calculate sample means and standard deviations by group:
tapply(study_data$words, study_data$sound, mean)
tapply(study_data$words, study_data$sound, sd)

# QUESTION 1: Record your sample means below:
# x_bar (music):   
# x_bar (silence): 
# x_bar (rain):    

# ------------------------------------------------------------------------------
# TASK 2: Graphical Summaries (Boxplots)
# ------------------------------------------------------------------------------

# 2a. Run this line to create side-by-side boxplots:
boxplot(words ~ sound, data = study_data, 
        main = "Word Recall by Sound Condition",
        xlab = "Sound Group", 
        ylab = "Words Remembered")

# QUESTION 2: Do any of the three groups show strong skewness or outliers?
# Answer: 

# ------------------------------------------------------------------------------
# TASK 3: Fit One-Way ANOVA Model
# ------------------------------------------------------------------------------

# 3a. Run this line to fit the ANOVA model:
anova_model <- aov(words ~ sound, data = study_data)

# 3b. Display the ANOVA table:
summary(anova_model)

# QUESTION 3: Record the F-statistic and p-value from the output:
# F-statistic: 
# p-value: 

# QUESTION 4: Based on the p-value (α = 0.05), what do you conclude about 
# H0: mu_music = mu_rain = mu_silence?
# Answer: 

# ------------------------------------------------------------------------------
# TASK 4: Pairwise Confidence Intervals (Tukey HSD)
# ------------------------------------------------------------------------------

# 4a. Run this line to compute 95% confidence intervals for differences in means:
TukeyHSD(anova_model)

# QUESTION 5: Look at the Tukey output in the console. 
# Write down the 95% confidence intervals for:
# - rain minus music:    [          ,          ]
# - silence minus music: [          ,          ]
# - silence minus rain:  [          ,          ]

# QUESTION 6: Which interval(s) contain zero? What does an interval containing zero 
# tell us about the difference between those two population means?
# Answer:
