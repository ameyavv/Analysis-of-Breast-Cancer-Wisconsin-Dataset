This dataset consists information about breast cancer tumors and was initially
created by Dr. William H. Wolberg. The dataset was created to assist researchers and
machine learning practitioners in classifying tumors as either malignant(cancerous) or
benign (non-cancerous).

Link: https://www.kaggle.com/datasets/uciml/breast-cancer-wisconsin-
data/download?datasetVersionNumber=2&ref=hackernoon.com

Some of the variables included in this dataset:
• ID number
• Diagnosis (M = malignant, B = benign).
• Radius (the mean of distances from the centre to points on the perimeter).
• Texture (the standard deviation of gray-scale values).
• Perimeter
• Area
• Smoothness (the local variation in radius lengths).
• Compactness (the perimeter^2 / area - 1.0).
• Concavity (the severity of concave portions of the contour).
• Concave points (the number of concave portions of the contour).
• Symmetry
• Fractal dimension ("coastline approximation" - 1).

Tools required:
R Studio, R Compiler

Questions
1.
What is the proportion of malignant and benign cases? Count the occurrences of each class in the "diagnosis" column.
2.
Visualize the distribution of the "radius_mean" feature for malignant and benign cases using a box plot or violin plot.
3.
Conduct a hypothesis test to determine if there is a significant difference in the "area_mean" between malignant and benign cases.
4.
Calculate the correlation between different features (e.g., "radius_mean" and "texture_mean").
5.
Visualize the relationship between tumor area and smoothness using a scatter plot.
6.
Create a bar chart to compare the mean concavity values for malignant and benign cases.
7.
Conduct a hypothesis test to check if there is a significant difference in "symmetry_se" between malignant and benign cases.
8.
Plot a heatmap to visualize the correlation matrix of the features in the dataset.
