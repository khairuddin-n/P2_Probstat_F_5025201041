# 1a
# Data Sebelum melakukan aktivitas
x <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)

# Data Setelah melakukan aktivitas
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

# Standar Devisiasi sebelum aktivitas
sd_before <- sd(x)
sd_before

# Standar Devisiasi setelah aktivitas
sd_after <- sd(y)
sd_after

# 1b
# carilah nilai t (p-value)

# Mencari nilai t(p-value) dengan t-test
t.test(x, y, alternative = "greater", var.equal = FALSE)

# 1c
var.test(x, y)

t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE)
