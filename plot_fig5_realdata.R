# plot figure 1 in report
library(ggplot2)
OLS <- read.table("real_dataOLS_p.txt", header = TRUE, sep = ";")
OLS <- cbind(rep("OLS", dim(OLS)[1]), OLS)
colnames(OLS) <- c("method", "picth", "true", "fitted")

Ridge <- read.table("real_dataRidge_p.txt", header = TRUE, sep = ";")
Ridge <- cbind(rep("Ridge", dim(Ridge)[1]), Ridge)
colnames(Ridge) <- c("method", "picth", "true", "fitted")

Lasso <- read.table("real_dataLasso_p.txt", header = TRUE, sep = ";")
Lasso <- data.frame(cbind(rep("Lasso", dim(Lasso)[1]), Lasso))
colnames(Lasso) <- c("method", "picth", "true", "fitted")

plot_data <- rbind(OLS, Ridge)
plot_data <- rbind(plot_data, Lasso)

colnames(plot_data) <- c("method", "pitch", "true", "fitted")
diff <- plot_data[, 4] - plot_data[,3]
plot_data <- cbind(plot_data, diff)

for (i in seq(1, 4)) {
  pitch = plot_data[which(plot_data[, 2] == i), ]
  p <- ggplot()
  p <- p + geom_point(data = pitch, aes(x = true, y = fitted), cex = 0.8, alpha = 0.6)
  #p <- p + geom_line(y = x, col = "red")
  p <- p + facet_grid(. ~ method )
  #p <- p + coord_fixed()
  p <- p + geom_abline(intercept = 0, slope = 1, col = "red", cex = 1, alpha = 0.5)
  
  #r<-max(abs(ggplot_build(p)$panel$ranges[[1]]$x.range))
  #s<-max(abs(ggplot_build(p)$panel$ranges[[1]]$y.range))
  #t<-round(max(r,s),1)
  #p<-p+coord_equal(xlim=c(-t,t),ylim=c(-t,t))
  
  p <- p +coord_equal()
  p <- p + ggtitle(sprintf("pitch %d", i))

  ggsave(plot = p, file = sprintf("pitch_%d.png", i), width = 10, height = 4, units = "in")
}

true <- plot_data[which(plot_data[,1] == "OLS"), c(2, 3)]
for (i in seq(1, 4)) {
  true_pitch = true[which(true[, 1] == i), 2]
  print(c(mean(true_pitch), sd(true_pitch)/mean(true_pitch)))
  print(c(min(true_pitch), max(true_pitch)))
}