# FYS-STK4155_P1
The scripts are written in python and R. The calculation for each task is written in a stand alone  python script and the figures are plotted by R. Table \ref{tabScripts} gives an overview of scripts and their functions. Scripts can be downloaded from \url{https://github.com/honglioslo/FYS-STK4155_P1} \href{https://github.com/honglioslo/FYS-STK4155_P1}.
\begin{table}[htbp]
\centering
\small
\setlength\tabcolsep{2pt}
\caption{Overview of scripts and their functions.}
\label{tabScripts}
\begin{tabular}{ll}
\hline
Name                 & Function                                                               \\
\hline
P1\_OLS.ipynb      & Perform the OLS regression based on generated data and do cross validation                                                         \\
P1\_Ridge.ipynb      & Find $\lambda$ for the Ridge regression based on generated data and do cross validation                                                         \\
P1\_Ridge-0.01.ipynb & Perform Ridge regression with $\lambda$ is 0.01 based on generated data \\
P1\_Lasso.ipynb      & Find $\alpha$ for the Lasso regression based on generated data and do cross validation                                                         \\
P1\_Lasso-10e-20.ipynb & Perform the Lasso regression with $\alpha$ is 10e$^{20}$ based on generated data \\
real\_dataOLS.ipynb & Perform the OLS regression based on SRTM DTM    \\
real\_dataRidge.ipynb & Perform the Ridge regression based on SRTM DTM    \\
real\_dataLasso.ipynb & Perform the Lasso regression based on SRTM DTM    \\
plot\_fig1\_RidgeLambda.R & Plot Figure  1 and show the sensitivity of $\lambda$ for the Ridge regression     \\
plot\_fig2\_LassoAlpha.R & Plot Figure  2 and show the sensitivity of $\alpha$ for the Lasso regression     \\
plot\_fig3\_MSE\_R2.R & Plot Figure  3 and show performance of the OLS, Ridge and Lasso regression methods \\
plot\_fig4\_beta\_stability.R & Plot Figure  4 and show stability of $\beta$ \\
plot\_fig5\_realdata.R & Plot Figure  5 and show regression results based on SRTM DTM \\
\hline
\end{tabular}
\end{table}
