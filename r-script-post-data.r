# ─────────────────────────────────────────────────────────────────────────────
# THESIS STATISTICAL ANALYSIS
# "The Effect of Geometric Detail on Sense of Presence in Mixed Reality Gaming"
# Lyuboslav Stefanov Nemtsov — BUas MGT 2025-2026
#
# Required packages: psych, coin, car
# Install if needed:
#   install.packages("psych")
#   install.packages("coin")
#   install.packages("car")
# ─────────────────────────────────────────────────────────────────────────────

library(psych)
library(coin)
library(car)

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 1: RAW DATA — Q1 to Q19 per participant
# Source: Qualtrics export, post-questionnaire
# Condition: ODD participant numbers = Low-poly, EVEN = Realistic
# ─────────────────────────────────────────────────────────────────────────────

raw <- data.frame(
  id   = c("P001","P002","P003","P004","P005","P006","P007","P008","P009","P010",
           "P011","P012","P013","P014","P015","P016","P017","P018","P019","P020",
           "P021","P022","P023","P024","P025","P026","P027","P028","P029","P030"),
  cond = c("Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic",
           "Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic",
           "Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic",
           "Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic",
           "Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic"),
  Q1  = c(6,7,6,5,6,6,5,6,6,6,6,6,6,7,7,4,6,5,7,6,7,5,6,2,6,5,7,5,1,5),
  Q2  = c(5,6,4,6,7,5,7,4,6,7,6,7,6,6,3,7,6,4,6,5,5,5,6,4,6,6,7,6,6,6),
  Q3  = c(5,7,4,5,6,7,7,7,5,6,6,2,5,7,4,6,7,6,7,6,5,5,7,2,6,5,5,5,4,4),
  Q4  = c(4,5,5,4,7,7,5,4,4,7,2,4,4,3,6,7,7,2,4,3,3,3,7,4,4,6,4,4,2,3),
  Q5  = c(7,5,4,7,7,7,6,7,6,7,7,6,6,7,6,7,7,4,5,7,7,7,6,7,7,5,5,6,7,5),
  Q6  = c(6,4,3,5,4,7,6,7,4,7,6,2,5,7,6,7,7,4,7,4,6,6,7,4,4,5,4,4,6,3),
  Q7  = c(6,7,4,4,5,7,4,5,4,5,5,1,5,5,2,7,7,4,7,6,6,6,7,3,3,4,4,4,3,6),
  Q8  = c(5,7,4,5,2,7,7,6,6,6,6,7,6,6,6,7,6,4,5,6,6,5,7,4,6,5,6,5,6,6),
  Q9  = c(6,7,6,6,6,7,6,7,6,6,7,7,6,4,7,7,6,3,7,7,5,7,7,7,5,6,6,6,6,5),
  Q10 = c(7,7,5,6,7,7,6,7,6,7,6,7,6,6,6,7,7,5,7,7,6,6,6,6,7,6,7,6,7,4),
  Q11 = c(3,6,6,4,7,7,4,7,7,6,7,4,6,6,3,7,5,6,7,7,6,6,5,7,5,5,7,6,5,5),
  Q12 = c(5,7,5,5,6,7,5,7,7,6,7,4,6,7,3,4,6,6,7,7,7,6,5,6,5,5,1,6,6,5),
  Q13 = c(6,7,5,6,7,7,6,7,6,7,5,5,6,5,4,7,7,4,6,6,7,6,6,4,6,6,6,5,5,4),
  Q14 = c(1,1,2,2,1,1,1,1,2,1,1,1,2,1,1,1,1,2,2,2,1,2,1,5,3,3,1,2,1,1),
  Q15 = c(7,7,7,7,6,7,7,7,7,7,7,7,7,6,7,7,7,7,7,7,7,7,7,7,6,5,7,7,7,4),
  Q16 = c(6,4,5,6,7,7,7,6,6,7,7,7,7,7,7,7,6,5,7,7,6,7,7,6,6,5,7,6,7,4),
  Q17 = c(1,1,1,5,1,1,1,4,3,1,1,1,2,1,1,1,1,1,4,2,4,2,1,4,2,2,5,2,1,1),
  Q18 = c(1,1,1,2,1,1,1,1,2,1,2,2,2,1,2,1,1,1,1,2,1,2,2,3,1,4,1,2,1,2),
  Q19 = c(7,7,7,5,6,7,4,7,7,6,7,6,6,7,7,7,7,7,7,5,7,6,6,6,5,5,7,6,7,5)
)

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 2: SCORE CALCULATION
# Source: UQO Cyberpsychology Lab (2004) revised PQ scoring instructions
# Reverse items: Q14, Q17, Q18 → reversed = 8 - raw
# ─────────────────────────────────────────────────────────────────────────────

# Reverse score items 14, 17, 18
raw$Q14r <- 8 - raw$Q14
raw$Q17r <- 8 - raw$Q17
raw$Q18r <- 8 - raw$Q18

# Subscales
raw$realism   <- raw$Q3  + raw$Q4  + raw$Q5  + raw$Q6  + raw$Q7  + raw$Q10 + raw$Q13
raw$possAct   <- raw$Q1  + raw$Q2  + raw$Q8  + raw$Q9
raw$interface <- raw$Q14r + raw$Q17r + raw$Q18r
raw$examine   <- raw$Q11 + raw$Q12 + raw$Q19
raw$selfEval  <- raw$Q15 + raw$Q16

# Total presence score
raw$total <- raw$Q1 + raw$Q2 + raw$Q3 + raw$Q4 + raw$Q5 + raw$Q6 + raw$Q7 +
             raw$Q8 + raw$Q9 + raw$Q10 + raw$Q11 + raw$Q12 + raw$Q13 +
             raw$Q14r + raw$Q15 + raw$Q16 + raw$Q17r + raw$Q18r + raw$Q19

# Verify: subscale sums should equal total for all participants
raw$check <- raw$realism + raw$possAct + raw$interface + raw$examine + raw$selfEval
cat("=== SUBSCALE SUM CHECK (all should be TRUE) ===\n")
print(raw$check == raw$total)

# Split by condition
lp <- subset(raw, cond == "Low-poly")
re <- subset(raw, cond == "Realistic")

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 3: DESCRIPTIVE STATISTICS
# ─────────────────────────────────────────────────────────────────────────────

cat("\n=== DESCRIPTIVE STATISTICS: TOTAL PRESENCE ===\n")
cat("Low-poly:  n=", nrow(lp), " Mean=", round(mean(lp$total),2),
    " SD=", round(sd(lp$total),2),
    " Median=", median(lp$total),
    " Min=", min(lp$total), " Max=", max(lp$total), "\n")
cat("Realistic: n=", nrow(re), " Mean=", round(mean(re$total),2),
    " SD=", round(sd(re$total),2),
    " Median=", median(re$total),
    " Min=", min(re$total), " Max=", max(re$total), "\n")
cat("All N=30:  Mean=", round(mean(raw$total),2),
    " SD=", round(sd(raw$total),2),
    " Min=", min(raw$total), " Max=", max(raw$total), "\n")

cat("\n=== DESCRIPTIVE STATISTICS: SUBSCALES ===\n")
for (sub in c("realism","possAct","interface","examine","selfEval")) {
  cat(sub, "— LP: M=", round(mean(lp[[sub]]),2), "SD=", round(sd(lp[[sub]]),2),
      " | RE: M=", round(mean(re[[sub]]),2), "SD=", round(sd(re[[sub]]),2), "\n")
}

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 3b: MEDIAN & IQR FOR SUBSCALES (for non-parametric reporting)
# When using Mann-Whitney U tests, medians and IQRs are the appropriate
# descriptive statistics to report alongside the test results.
# ─────────────────────────────────────────────────────────────────────────────

cat("\n=== DESCRIPTIVE STATISTICS: SUBSCALE MEDIANS & IQR ===\n")
for (sub in c("realism","possAct","interface","examine","selfEval")) {
  cat(sub, "— LP: Mdn=", median(lp[[sub]]),
      " IQR=", IQR(lp[[sub]]),
      " (Q1=", quantile(lp[[sub]], 0.25),
      ", Q3=", quantile(lp[[sub]], 0.75), ")",
      " | RE: Mdn=", median(re[[sub]]),
      " IQR=", IQR(re[[sub]]),
      " (Q1=", quantile(re[[sub]], 0.25),
      ", Q3=", quantile(re[[sub]], 0.75), ")\n")
}

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 4: SHAPIRO-WILK NORMALITY TESTS
# Source: Shapiro, S.S. & Wilk, M.B. (1965). Biometrika, 52(3-4), 591-611.
# Applied per group per variable
# ─────────────────────────────────────────────────────────────────────────────

cat("\n=== SHAPIRO-WILK NORMALITY TESTS ===\n")
cat("--- Total Presence ---\n")
print(shapiro.test(lp$total))
print(shapiro.test(re$total))

cat("--- Subscales (Low-poly) ---\n")
for (sub in c("realism","possAct","interface","examine","selfEval")) {
  cat(sub, ": "); print(shapiro.test(lp[[sub]]))
}
cat("--- Subscales (Realistic) ---\n")
for (sub in c("realism","possAct","interface","examine","selfEval")) {
  cat(sub, ": "); print(shapiro.test(re[[sub]]))
}

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 4b: WELCH'S T-TEST FOR TOTAL PRESENCE
# Source: Welch, B.L. (1947). Biometrika, 34(1-2), 28-35.
# Used because both groups passed Shapiro-Wilk normality (Section 4)
# Welch's t-test does not assume equal variances
# ─────────────────────────────────────────────────────────────────────────────

cat("\n=== WELCH'S INDEPENDENT SAMPLES T-TEST: TOTAL PRESENCE ===\n")
t_result <- t.test(lp$total, re$total, var.equal = FALSE)
print(t_result)

# Cohen's d (manual calculation)
pooled_sd <- sqrt(((nrow(lp)-1)*sd(lp$total)^2 + (nrow(re)-1)*sd(re$total)^2) /
                    (nrow(lp) + nrow(re) - 2))
cohens_d <- (mean(lp$total) - mean(re$total)) / pooled_sd
cat("Cohen's d =", round(cohens_d, 3), "\n")

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 4c: VARIANCE EQUALITY TESTS — TOTAL PRESENCE
# Purpose: Formally test whether the observed variance difference between
#          conditions (SD = 7.12 vs 12.60) is statistically significant.
#
# Two tests are reported:
#   1. F-test for equality of variances (var.test)
#      - Assumes both populations are normally distributed
#      - Both groups passed Shapiro-Wilk (Section 4), so assumption is met
#      - Source: Snedecor, G.W. & Cochran, W.G. (1989). Statistical Methods.
#
#   2. Levene's test (car::leveneTest)
#      - More robust alternative that does not assume normality
#      - Uses median-based version (default in car package) for robustness
#      - Source: Levene, H. (1960). In Contributions to Probability and
#        Statistics: Essays in Honor of Harold Hotelling (pp. 278-292).
#
# If significant: report as secondary finding — realistic condition produces
# more variable presence experiences than low-poly condition.
# If not significant: note that the observed variance difference was not
# statistically reliable at this sample size; keep informal observation
# in discussion as-is.
# ─────────────────────────────────────────────────────────────────────────────

cat("\n=== VARIANCE EQUALITY TESTS: TOTAL PRESENCE ===\n")

# F-test for equality of variances
cat("--- F-test (var.test) ---\n")
f_result <- var.test(lp$total, re$total)
print(f_result)
cat("Variance ratio (Realistic / Low-poly):",
    round(var(re$total) / var(lp$total), 3), "\n")

# Levene's test (more robust, does not assume normality)
cat("\n--- Levene's Test (car package, median-based) ---\n")
levene_result <- leveneTest(total ~ as.factor(cond), data = raw, center = median)
print(levene_result)

# Summary interpretation
cat("\n--- Interpretation Guide ---\n")
cat("F-test:   F(", f_result$parameter[1], ",", f_result$parameter[2], ") =",
    round(f_result$statistic, 3), ", p =", round(f_result$p.value, 3), "\n")
cat("Levene's: F(", levene_result$Df[1], ",", levene_result$Df[2], ") =",
    round(levene_result$`F value`[1], 3), ", p =",
    round(levene_result$`Pr(>F)`[1], 3), "\n")
if (f_result$p.value < 0.05) {
  cat(">> Variance difference IS statistically significant.\n")
  cat(">> Report as secondary finding in Section 4.4.\n")
} else {
  cat(">> Variance difference is NOT statistically significant.\n")
  cat(">> Keep as informal observation in discussion.\n")
}

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 5: MANN-WHITNEY U TESTS
# Source: Mann, H.B. & Whitney, D.R. (1947). Annals of Mathematical Statistics,
#         18(1), 50-60.
# Used when normality is violated (per Shapiro-Wilk results above)
# Effect size r = Z / sqrt(N), where N = total sample size
# Source for effect size: Field, A. (2013). Discovering Statistics. SAGE. p.226
# ─────────────────────────────────────────────────────────────────────────────

run_mwu <- function(var_lp, var_re, label, N=30) {
  test <- wilcox.test(var_lp, var_re, exact=FALSE, correct=FALSE)
  z <- qnorm(test$p.value / 2) * sign(test$statistic - (length(var_lp)*length(var_re)/2))
  r <- abs(z) / sqrt(N)
  cat(label, "— U=", test$statistic,
      " p=", round(test$p.value, 3),
      " z=", round(z, 3),
      " r=", round(r, 3), "\n")
}

cat("\n=== MANN-WHITNEY U TESTS ===\n")
run_mwu(lp$total,    re$total,    "Total Presence")
run_mwu(lp$realism,  re$realism,  "Realism")
run_mwu(lp$possAct,  re$possAct,  "Possibility to Act")
run_mwu(lp$interface,re$interface,"Quality of Interface")
run_mwu(lp$examine,  re$examine,  "Possibility to Examine")
run_mwu(lp$selfEval, re$selfEval, "Self-Eval of Performance")

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 6: CRONBACH'S ALPHA
# Source: Cronbach, L.J. (1951). Psychometrika, 16(3), 297-334.
# Calculated on all 19 items (with reversals applied) for full sample N=30
# Using psych package: Revelle, W. (2023). psych: Procedures for Psychological,
#   Psychometric, and Personality Research. R package.
# ─────────────────────────────────────────────────────────────────────────────

cat("\n=== CRONBACH'S ALPHA (full sample, N=30, 19 items with reversals) ===\n")
items_for_alpha <- raw[, c("Q1","Q2","Q3","Q4","Q5","Q6","Q7","Q8","Q9","Q10",
                           "Q11","Q12","Q13","Q14r","Q15","Q16","Q17r","Q18r","Q19")]
alpha_result <- alpha(items_for_alpha)
print(alpha_result$total)

# ─────────────────────────────────────────────────────────────────────────────
# SECTION 7: GROUP BALANCE — MANN-WHITNEY U FOR PRE-TEST VARIABLES
# ─────────────────────────────────────────────────────────────────────────────

# Pre-test data (from Qualtrics pre-questionnaire export)
pre <- data.frame(
  id        = c("P001","P002","P003","P004","P005","P006","P007","P008","P009","P010",
                "P011","P012","P013","P014","P015","P016","P017","P018","P019","P020",
                "P021","P022","P023","P024","P025","P026","P027","P028","P029","P030"),
  cond      = c("Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic",
                "Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic",
                "Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic",
                "Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic",
                "Low-poly","Realistic","Low-poly","Realistic","Low-poly","Realistic"),
  vrExp     = c(2,3,1,5,2,1,5,1,3,2,5,4,5,4,4,5,2,5,4,2,3,5,3,5,2,1,2,3,5,1),
  vrGaming  = c(5,5,1,3,5,4,3,1,4,4,5,5,5,5,5,3,5,1,2,1,5,5,5,1,3,4,5,1,5,5),
  gaming    = c(5,1,1,3,4,1,5,3,1,2,4,3,1,3,2,3,3,4,4,1,3,3,1,4,4,3,1,2,2,2),
  metaQuest = c(1,1,1,1,2,1,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,2,1,1,2),
  lowPolyFam= c(5,4,4,5,5,2,3,5,5,5,5,5,5,5,4,4,5,5,5,5,5,4,3,5,5,4,4,4,4,5)
)

pre_lp <- subset(pre, cond=="Low-poly")
pre_re <- subset(pre, cond=="Realistic")

cat("\n=== GROUP BALANCE: MANN-WHITNEY U (pre-test variables) ===\n")
for (v in c("vrExp","vrGaming","gaming","lowPolyFam")) {
  test <- wilcox.test(pre_lp[[v]], pre_re[[v]], exact=FALSE, correct=FALSE)
  cat(v, "— U=", test$statistic, " p=", round(test$p.value,3), "\n")
}

cat("\n=== GROUP BALANCE: CHI-SQUARE (Meta Quest familiarity) ===\n")
mq_table <- table(pre$cond, pre$metaQuest)
print(mq_table)
print(chisq.test(mq_table, correct=FALSE))

cat("\n=== ALL DONE. Paste output back to verify thesis values. ===\n")
