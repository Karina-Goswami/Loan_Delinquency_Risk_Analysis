# Delinquency Prediction using Machine Learning

## 📋 Project Overview

This project aims to **predict loan delinquency** (i.e., whether a customer will default or delay payments) using **Machine Learning techniques**. The pipeline covers every major step of a data science workflow — from raw data to model evaluation.

The goal is to build a predictive model that helps financial institutions identify **high-risk borrowers** early and take preventive actions.

---

## 🚀 Project Pipeline

### 1️⃣ Load the Dataset

* Imported the dataset using **pandas**.
* Performed an initial check on shape, column names, and data types.

### 2️⃣ Dataset Overview

* Used `.head()`, `.info()`, and `.describe()` to understand dataset structure.
* Observed distributions and unique values for key columns.

### 3️⃣ Data Cleaning

* **Handled Missing Values:**

  * Filled or removed null values based on column relevance.
* **Removed Duplicates:**

  * Identified duplicate rows using `df.duplicated()` and dropped them.
* **Saved Clean Data:**

  * Exported the cleaned dataset to `cleaned_data.csv` for further analysis.

### 4️⃣ Exploratory Data Analysis (EDA)

* Visualized the data to understand trends and relationships using:

  * **Matplotlib**, **Seaborn**
* Analyzed correlations between numeric features and the target variable.
* Created distribution plots, boxplots, and heatmaps to detect outliers and patterns.

### 5️⃣ Data Preprocessing

* Encoded categorical variables using **Label Encoding / One-Hot Encoding**.
* Scaled numerical features using **StandardScaler / MinMaxScaler**.
* Split dataset into **training and testing sets** using an 80-20 ratio.

### 6️⃣ Handling Imbalanced Data

* Checked class balance using `value_counts()`.
* Used **SMOTE (Synthetic Minority Over-sampling Technique)** or **class weights** to balance target labels.

### 7️⃣ Model Building

Trained multiple machine learning models, including:

* Logistic Regression
* Decision Tree Classifier
* Random Forest Classifier
* XGBoost / Gradient Boosting

Evaluated models on:

* **Accuracy**
* **Precision**
* **Recall**
* **F1-Score**
* **ROC-AUC Curve**

### 8️⃣ Model Evaluation

* Compared model performance using confusion matrix and classification reports.
* Selected the best-performing model based on evaluation metrics.

---

## 🧩 Technologies Used

| Category           | Tools / Libraries               |
| ------------------ | ------------------------------- |
| Programming        | Python                          |
| Data Handling      | Pandas                  |
| Visualization      | Matplotlib, Seaborn    |
| Data Preprocessing | Scikit-learn                    |
| Modeling           | Scikit-learn, XGBoost,Random Forest,Logistic Regression|           |
| Balancing Data     | imbalanced-learn (SMOTE)        |
| Environment        | Jupyter Notebook|


---

## 📊 Results

* Achieved **high accuracy and recall** on the test set.
* Balanced data improved the model’s ability to detect delinquent cases.
* Visualizations provided strong insights into risk factors.

---

## 💡 Future Enhancements

* Hyperparameter tuning using **GridSearchCV** or **Optuna**.
* Deploy model using **Flask / Streamlit** for real-time prediction.
* Add **feature importance analysis** for interpretability.

---

## 🧑‍💻 Author

**Karina Goswami**
📍 Data Science Enthusiast | Machine Learning Learner
📧 [goswamikarina01@gmail.com]
🔗 [www.linkedin.com/in/karina-goswami-0323bb321)

---

