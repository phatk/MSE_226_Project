# MSE 226 Project with Professor Ramesh

Files: 
minip1.pdf + minip2.pdf - pdf of assignments
226-p1-final and 226-p2-final - reports

p1_prediction_final.Rmd, p1_prediction_final.pdf, p2_inference_final.Rmd, p2_inference_final.pdf - codes in pdf and R markdown


Descriptions:
We had to train a dataset after splitting into training and testing set and build the ‘best’ predictive model for regression and classification tasks.

If best model is defined in terms of lowest error, 
Best model for regression: backward stepwise regression. Best model for classification: SVM with a radial kernel

For inference, 6 (distance left for first down, positions such as QB or RB, and player’s age) out of 14 covariates were statistically significant from our best model for regression trained on both training data. 

Using bootstrap to estimate confidence intervals, number of defenders in the box and amount home team is winning or losing by are statistically significant. For multiple hypothesis testing, Bonferroni correction and Benjamini Hochberg correction (lower false pos. rate) mean that two covariates – distance and number of defenders in the box are significant. 
