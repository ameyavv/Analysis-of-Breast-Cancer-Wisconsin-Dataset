str(data)

# Check for missing values in the entire dataset
missing_values <- sapply(data, function(x) sum(is.na(x)))

# Print the number of missing values for each column
print(missing_values)

# Specify the numerical columns you want to plot
numerical_columns <- c(
  "radius_mean", "texture_mean", "perimeter_mean"
)

# Loop through the selected numerical columns and plot histograms
for (col in numerical_columns) {
  hist_data <- data[[col]]  # Extract the data for the column
  hist_title <- paste("Histogram of", col)  # Create a title
  hist(x = hist_data, main = hist_title, xlab = col)  # Plot the histogram
}

# Load the necessary library for plotting
library(ggplot2)

# Create a bar plot for the 'diagnosis' column
class_distribution <- table(data$diagnosis)
class_distribution_df <- as.data.frame(class_distribution)
colnames(class_distribution_df) <- c("Class", "Count")

# Create a bar plot
ggplot(class_distribution_df, aes(x = Class, y = Count, fill = Class)) +
  geom_bar(stat = "identity") +
  labs(title = "Class Distribution", x = "Class", y = "Count") +
  theme_minimal()


# Calculate the count of each class in the "diagnosis" column
class_counts <- table(data$diagnosis)

# Extract the counts for malignant (M) and benign (B)
count_malignant <- class_counts["M"]
count_benign <- class_counts["B"]

# Calculate the proportion of malignant and benign cases
total_cases <- sum(class_counts)
proportion_malignant <- count_malignant / total_cases
proportion_benign <- count_benign / total_cases

# Print the results
cat("Number of Malignant (M) cases:", count_malignant, "\n")
cat("Number of Benign (B) cases:", count_benign, "\n")
cat("Proportion of Malignant (M) cases:", proportion_malignant, "\n")
cat("Proportion of Benign (B) cases:", proportion_benign, "\n")


# Load the necessary library for plotting
library(ggplot2)

# Filter the dataset for malignant (M) and benign (B) cases
malignant_data <- data[data$diagnosis == "M", ]
benign_data <- data[data$diagnosis == "B", ]

# Create a box plot for the "radius_mean" feature
ggplot() +
  geom_boxplot(data = malignant_data, aes(x = "Malignant", y = radius_mean), fill = "red", alpha = 0.7) +
  geom_boxplot(data = benign_data, aes(x = "Benign", y = radius_mean), fill = "blue", alpha = 0.7) +
  labs(title = "Distribution of radius_mean for Malignant and Benign Cases", x = "Diagnosis", y = "radius_mean") +
  theme_minimal() +
  scale_x_discrete(labels = c("Malignant", "Benign"))


# Subset the data into two groups: Malignant and Benign
malignant_data <- data[data$diagnosis == "M", ]
benign_data <- data[data$diagnosis == "B", ]

# Perform a two-sample t-test for "area_mean"
t_test_result <- t.test(malignant_data$area_mean, benign_data$area_mean)

# Print the test result
cat("Two-Sample t-Test Result for 'area_mean':\n")
print(t_test_result)

# Check if there is a significant difference based on the p-value
alpha <- 0.05  # Set your desired significance level (e.g., 0.05)

if (t_test_result$p.value < alpha) {
  cat("There is a significant difference in 'area_mean' between malignant and benign cases (p <", alpha, ")\n")
} else {
  cat("There is no significant difference in 'area_mean' between malignant and benign cases (p >=", alpha, ")\n")
}


# Calculate the correlation between "radius_mean" and "texture_mean"
correlation <- cor(data$radius_mean, data$texture_mean)

# Print the correlation result
cat("Correlation between 'radius_mean' and 'texture_mean':", correlation, "\n")


# Specify the columns you want to include in the correlation matrix
selected_columns <- c("radius_mean", "texture_mean", "perimeter_mean", "area_mean")

# Calculate the correlation matrix for the selected columns
correlation_matrix <- cor(data[selected_columns])

# Print the correlation matrix
cat("Correlation Matrix for Selected Features:\n")
print(correlation_matrix)


# Load the necessary library for plotting
library(ggplot2)


# Create a scatter plot for the relationship between "area_mean" and "smoothness_mean"
ggplot(data, aes(x = area_mean, y = smoothness_mean)) +
  geom_point() +
  labs(title = "Scatter Plot of Tumor Area vs. Smoothness", x = "Tumor Area (area_mean)", y = "Smoothness (smoothness_mean)") +
  theme_minimal()


# Load the necessary library for plotting
library(ggplot2)


# Calculate the mean concavity values for malignant and benign cases
mean_concavity <- aggregate(data$concavity_mean, by = list(data$diagnosis), FUN = mean)
colnames(mean_concavity) <- c("Diagnosis", "Mean_Concavity")

# Create a bar chart
ggplot(mean_concavity, aes(x = Diagnosis, y = Mean_Concavity, fill = Diagnosis)) +
  geom_bar(stat = "identity") +
  labs(title = "Mean Concavity for Malignant and Benign Cases", x = "Diagnosis", y = "Mean Concavity") +
  theme_minimal()



# Subset the data into two groups: Malignant and Benign
malignant_data <- data[data$diagnosis == "M", "symmetry_se"]
benign_data <- data[data$diagnosis == "B", "symmetry_se"]

# Perform a two-sample t-test for "symmetry_se"
t_test_result <- t.test(malignant_data, benign_data)

# Print the test result
cat("Two-Sample t-Test Result for 'symmetry_se':\n")
print(t_test_result)

# Check if there is a significant difference based on the p-value
alpha <- 0.05  # Set your desired significance level (e.g., 0.05)

if (t_test_result$p.value < alpha) {
  cat("There is a significant difference in 'symmetry_se' between malignant and benign cases (p <", alpha, ")\n")
} else {
  cat("There is no significant difference in 'symmetry_se' between malignant and benign cases (p >=", alpha, ")\n")
}


# Load the necessary libraries for plotting
library(ggplot2)
library(reshape2)


# Calculate the correlation matrix for all features
correlation_matrix <- cor(data[, 3:32])  # Excluding 'id' and 'diagnosis' columns

# Melt the correlation matrix for visualization
melted_correlation_matrix <- melt(correlation_matrix)

# Create a heatmap
ggplot(melted_correlation_matrix, aes(Var1, Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red") +
  labs(title = "Correlation Heatmap of Features", x = "Features", y = "Features") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
