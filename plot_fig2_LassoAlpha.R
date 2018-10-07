# plot figure 3 in report
library(ggplot2)
# plot MSE
all <- read.table("Lasso_mse_all.txt", header = TRUE, sep = ";")
cross <- read.table("Lasso_mse_cross.txt", header = TRUE, sep = ";")

lamda_values <- all[, 1]
n_l <- length(lamda_values)
conf_levels <- matrix(data = NA, nrow = n_l, ncol = 3)

for (i_l in seq(1, n_l, 1)) {
  temp_data <- cross[which(cross[,1] == lamda_values[i_l]),2]
  conf_levels[i_l,] <- quantile(temp_data, probs = c(0.025, 0.5, 0.975), names = TRUE)
}

plot_data <- data.frame(lamda = lamda_values, all = all[,2], 
                        cross_0.25 = conf_levels[, 1], 
                        cross_median = conf_levels[, 2], 
                        cross_0.75 = conf_levels[, 3])
p <- ggplot(data = plot_data)
p <- p  + geom_ribbon(aes(x = log10(lamda), ymin = cross_0.25, ymax = cross_0.75), fill = "grey70")
p <- p + geom_line(aes(x = log10(lamda), y = all), col = "black", size = 1.5) 
p <- p + geom_line(aes(x = log10(lamda), y = cross_median), col = "blue", size = 1.5)
p <- p + xlab(expression(log10(alpha))) + ylab("MSE")
p <- p + ggtitle("(a) MSE")
ggsave(plot = p, file = "Lasso_MSE.png", width = 3.5, height = 3, units = "in")

# plot R2
all <- read.table("Lasso_r2_all.txt", header = TRUE, sep = ";")
cross <- read.table("Lasso_r2_cross.txt", header = TRUE, sep = ";")

lamda_values <- all[, 1]
n_l <- length(lamda_values)
conf_levels <- matrix(data = NA, nrow = n_l, ncol = 3)

for (i_l in seq(1, n_l, 1)) {
  temp_data <- cross[which(cross[,1] == lamda_values[i_l]),2]
  conf_levels[i_l,] <- quantile(temp_data, probs = c(0.025, 0.5, 0.975), names = TRUE)
}

plot_data <- data.frame(lamda = lamda_values, all = all[,2], 
                        cross_0.25 = conf_levels[, 1], 
                        cross_median = conf_levels[, 2], 
                        cross_0.75 = conf_levels[, 3])
p <- ggplot(data = plot_data)
p <- p  + geom_ribbon(aes(x = log10(lamda), ymin = cross_0.25, ymax = cross_0.75), fill = "grey70")
p <- p + geom_line(aes(x = log10(lamda), y = all), col = "black", size = 1.5) 
p <- p + geom_line(aes(x = log10(lamda), y = cross_median), col = "blue", size = 1.5)
p <- p + xlab(expression(log10(alpha))) + ylab(expression(R^2))
p <- p + ylim(0.41, 0.52)
p <- p + ggtitle(bquote('(b)' ~ R^2))
ggsave(plot = p, file = "Lasso_R2.png", width = 3.5, height = 3, units = "in")

