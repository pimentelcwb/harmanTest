# Hausman Test for Panel Data Analysis
## This script estimates fixed and random effects models and conducts the Hausman Test to determine the appropriate model for panel data.

# INSTALL AND LOAD PACKAGES
install.packages("plm")   # Package for panel data models
install.packages("lmtest") # Package for statistical tests
library(plm)
library(lmtest)

# USER GUIDE: ADAPTING YOUR DATASET
## ID  -> Identifier for panel data (e.g., firm name, country code, individual ID)
## DV  -> Dependent Variable (e.g., financial returns, productivity, sales growth)
## IVs -> Independent Variables (e.g., marketing spend, R&D investment, economic indicators)

# HOW TO ADAPT:
## - Replace "dataset" with your actual dataset.
## - Ensure your dataset contains a unique ID column and multiple time-series observations.
## - Modify DV and IV1, IV2, IV3, IVn etc. to match your dataset's column names.

# LOAD DATASET
## Ensure your dataset is correctly formatted (e.g., CSV)
dataset <- read.csv("your_dataset.csv")  # Uncomment and replace with the correct file path

# CONVERT DATASET TO PANEL FORMAT
## The dataset should contain an ID column (firm, country, or individual) and multiple observations over time.
dataset <- pdata.frame(dataset, index = c("ID")) # Replace "ID" with the actual column name for the panel identifier

# FIXED EFFECTS MODEL
## This model controls for unobserved, time-invariant differences within each entity (e.g., firm, country).
fixed_effects_model <- plm(DV ~ IV1 + IV2 + IV3 + IVn, 
                           data = dataset, model = "within")
summary(fixed_effects_model)

# RANDOM EFFECTS MODEL
## This model assumes that entity-specific effects are uncorrelated with the independent variables.
random_effects_model <- plm(DV ~ IV1 + IV2 + IV3 + IVn, 
                            data = dataset, model = "random")
summary(random_effects_model)

# HAUSMAN TEST: FIXED VS RANDOM EFFECTS INTERPRETATION AND MODEL CHOICE
## The Hausman test helps decide between fixed and random effects models.
## H0 (Null Hypothesis): Random effects model is preferred.
## H1 (Alternative Hypothesis): Fixed effects model is preferred.
## If p-value < 0.05, reject H0 → Use Fixed Effects.
hausman_test <- phtest(fixed_effects_model, random_effects_model)
print(hausman_test)

# SIMPLE LINEAR REGRESSION
## This model provides a general estimate of relationships but does not account for panel structure.
linear_model <- lm(DV ~ IV1 + IV2 + IV3 + IVn, data = dataset)
summary(linear_model)

# INTERPRETATION:
## - If Hausman Test p-value < 0.05 → Prefer Fixed Effects.
## - If Hausman Test p-value > 0.05 → Prefer Random Effects.
## - Linear regression is included for comparison but does not handle panel data correctly.
