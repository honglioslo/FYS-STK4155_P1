# plot figure 1 in report
library(ggplot2)
methods <- c("OLS", "Ridge", "Lasso")

for (im in seq(length(methods))) {
  if (im == 1) {
  MSE_all <- read.table("OLS_mse_all.txt", header = TRUE, sep = ";")
  MSE_cross <- read.table("OLS_mse_cross.txt", header = TRUE, sep = ";")

  R2_all <- read.table("OLS_r2_all.txt", header = TRUE, sep = ";")
  R2_cross <- read.table("OLS_r2_cross.txt", header = TRUE, sep = ";")
  
  plot_data_all <- data.frame(method = rep(methods[im], length(MSE_all)), MSE = MSE_all, R2 = R2_all)
  plot_data_cross <- data.frame(method = rep(methods[im], length(MSE_cross)), MSE = MSE_cross, R2 = R2_cross)
  } else {
    
    MSE_all <- read.table(sprintf("%s_mse_all.txt", methods[im]), header = TRUE, sep = ";")
    MSE_cross <- read.table(sprintf("%s_mse_cross.txt", methods[im]), header = TRUE, sep = ";")
    
    R2_all <- read.table(sprintf("%s_r2_all.txt", methods[im]), header = TRUE, sep = ";")
    R2_cross <- read.table(sprintf("%s_r2_cross.txt", methods[im]), header = TRUE, sep = ";")
    
    temp_data_all = data.frame(method = rep(methods[im], length(MSE_all)), MSE = MSE_all[, 2], R2 = R2_all[, 2])
    temp_data_cross = data.frame(method = rep(methods[im], length(MSE_cross)), MSE = MSE_cross[, 2], R2 = R2_cross[, 2])
    plot_data_all <- rbind(plot_data_all, temp_data_all)
    plot_data_cross <- rbind(plot_data_cross, temp_data_cross)
  }
}


p <- ggplot()
p <- p + geom_point(data = plot_data_cross, aes(x = MSE, y = R2), col = "blue", alpha = 0.6, cex = 2)
p <- p  + geom_point(data = plot_data_all, aes(x = MSE, y = R2), col = "black", alpha = 1, cex = 2.5)

p <- p + xlab("MSE") + ylab(expression(R^2))
p <- p + xlim(0.08, 0.09) + ylim(0.42, 0.52)
p <- p +facet_grid(.~ method)
ggsave(plot = p, file = "MSE_R2.png", width = 10, height = 4, units = "in")

