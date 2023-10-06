# Predicting Patient Treatment Discontinuation Using Python

## Overview
This repository contains a Python model that predicts the probability of a patient discontinuing treatment. The model was trained on a dataset of patient features, such as age, gender, medical history, and treatment type. The data cannot be made available as it was part of a competition.

I used logistic regression, random forest, XGBoost, LightGBM, and CatBoost to predict the probability of discontinuation. Based on model comparison using various techniques (such as cross-validation and AUC scores), I chose CatBoost as my final model. The CatBoost model can be found in the Jupyter notebook included in this repository.

The data came in three tables with a 1:N connection. I used PostgreSQL to pre-process the data into the required format for training the models.

## Model Comparison Techniques
Here are some of the model comparison techniques that I used to select the best model:

Cross-validation: I performed 5-fold cross-validation on each model to evaluate their performance on unseen data.
AUC scores: I calculated the AUC scores for each model on the validation set. AUC is a metric that measures the ability of a model to distinguish between positive and negative cases.
Other metrics: I also considered other metrics, such as accuracy, precision, and recall, when comparing the models.

## Conclusion
I hope this repository is helpful for others who are interested in predicting patient treatment discontinuation using Python. Please let me know if you have any questions or suggestions.
