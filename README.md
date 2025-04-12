# HausmanTest overview
This repository provides a structured approach to **panel data analysis**, utilizing **fixed effects, random effects models, and the Hausman Test** to determine the most appropriate econometric model for analyzing panel datasets. Panel data allows for improved accuracy in statistical inference by accounting for **heterogeneity across entities** over time.

By implementing **panel regression models**, this script enables users to analyze relationships between independent variables (**IVs**) and a dependent variable (**DV**) while handling potential omitted variable bias.


# Objective
This repository is designed to:
1. Estimate **fixed effects** and **random effects** panel models.
2. Conduct the **Hausman Test** to compare the two models and determine which is more appropriate.
3. Provide a **simple linear regression** as a baseline for comparison.
4. Offer a **structured and adaptable framework** for users working with panel data.

## Key Concepts

### **1. Panel Data and Its Advantages**
Panel data tracks the same entities (e.g., firms, countries, individuals) over multiple time periods, offering several advantages:
- Controls for **unobservable, time-invariant factors** (e.g., corporate culture, managerial skills).
- Captures **dynamic effects** that cross-sectional studies cannot.
- Reduces **omitted variable bias** by leveraging variation within entities.

---

### **2. Fixed vs. Random Effects Models**
#### **Fixed Effects Model**
- Controls for **entity-specific unobservable characteristics**.
- Assumes that **individual heterogeneity is correlated with explanatory variables**.
- Best suited when unobserved factors **differ across entities but remain constant over time**.

#### **Random Effects Model**
- Assumes that **entity-specific effects are uncorrelated with explanatory variables**.
- More efficient than fixed effects if the assumption holds.
- Recommended when variation across entities is **random and not systematically related to predictors**.

---

### **3. Hausman Test for Model Selection**
The **Hausman Test** determines whether **fixed effects or random effects** should be used:
- **H₀ (Null Hypothesis):** Random effects model is preferred.
- **H₁ (Alternative Hypothesis):** Fixed effects model is preferred.
- If **p-value < 0.05**, reject H₀ → Use **Fixed Effects**.
- If **p-value > 0.05**, fail to reject H₀ → Use **Random Effects**.

---

## Repository Contents

### 1. HARMAN_TEST.R
The main R script, which includes:
- Installation of **required R packages**.
- **Panel data formatting** and transformation.
- Estimation of **fixed and random effects models**.
- **Hausman Test execution** for model selection.
- **Simple linear regression** for comparison.

### 2. README.md
Comprehensive documentation detailing:
- How to **install and set up** the script.
- How to **adapt it to different datasets**.
- **Theoretical background** on panel models.
- A step-by-step **workflow** for implementation.

---
## References
- GUJARATI, Damodar N. Basic Econometrics. 4. ed. New York: The McGraw-Hill Companies Inc., 2004.
- HAUSMAN, J. A. Specification Tests in Econometrics. Econometrica Vol. 46, No. 6 (Nov., 1978), pp. 1251-1271.
- WOOLDRIGE, Jeffrey M. Regression Analysis with Cross-Sectional Data. In: Introductory Econometrics: A =Modern Approach. 5. ed. South-Western: Cengage Learning, 2013.
  
