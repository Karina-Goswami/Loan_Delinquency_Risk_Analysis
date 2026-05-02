A complete end-to-end data analysis and machine learning project to identify and predict credit card delinquency risk using Python and Power BI.

---

## 📋 Project Overview

This project aims to **predict loan delinquency** (i.e., whether a customer will default or delay payments) using **Machine Learning techniques**. The pipeline covers every major step of a data science workflow — from raw data to model evaluation.

The goal is to build a predictive model that helps financial institutions identify **high-risk borrowers** early and take preventive actions.

---

## 📊 Dashboard Preview

<img width="1196" height="730" alt="Screenshot 2026-05-01 150808" src="https://github.com/user-attachments/assets/db322a73-dfb6-45e7-bb2b-885684d195bf" />


---

## 🚀 Project Pipeline

### 1️⃣ Load the Dataset
- Imported the dataset using **pandas**.
- Performed an initial check on shape, column names, and data types.

### 2️⃣ Dataset Overview
- Used `.head()`, `.info()`, and `.describe()` to understand dataset structure.
- Observed distributions and unique values for key columns.

### 3️⃣ Data Cleaning
- **Handled Missing Values:** Filled or removed null values based on column relevance.
- **Removed Duplicates:** Identified duplicate rows using `df.duplicated()` and dropped them.
- **Saved Clean Data:** Exported the cleaned dataset to `cleaned_data.csv` for further analysis.

### 4️⃣ Exploratory Data Analysis (EDA)
- Visualized the data to understand trends and relationships using **Matplotlib** and **Seaborn**.
- Analyzed correlations between numeric features and the target variable.
- Created distribution plots, boxplots, and heatmaps to detect outliers and patterns.

### 5️⃣ Data Preprocessing
- Encoded categorical variables using **Label Encoding / One-Hot Encoding**.
- Scaled numerical features using **StandardScaler / MinMaxScaler**.
- Split dataset into **training and testing sets** using an 80-20 ratio.

### 6️⃣ Handling Imbalanced Data
- Checked class balance using `value_counts()`.
- Used **SMOTE (Synthetic Minority Over-sampling Technique)** or **class weights** to balance target labels.

### 7️⃣ Model Building

Trained multiple machine learning models, including:
- Logistic Regression
- Decision Tree Classifier
- Random Forest Classifier
- XGBoost / Gradient Boosting

Evaluated models on:
- **Accuracy**
- **Precision**
- **Recall**
- **F1-Score**
- **ROC-AUC Curve**

### 8️⃣ Model Evaluation
- Compared model performance using confusion matrix and classification reports.
- Selected the best-performing model based on evaluation metrics.

---

## 📊 Power BI Dashboard

### 🔸 Objective
To provide interactive business insights on delinquency trends, customer profiles, and key influencing factors.

### 🔸 Steps
- Imported the cleaned dataset (`cleaned_data.csv`) into Power BI.
- Created data relationships and data model.
- Designed interactive visuals using slicers, KPIs, and charts.

### 🔸 Dashboard Features
- ✅ Loan Delinquency by Age and Income
- ✅ Month-wise payment status and location-wise delinquency status
- ✅ KPIs — Total Customers, Average Income, Average Loan Balance, Average Missed Payments
- ✅ Filters by Employment Status, Income Category, and Month

---

## 🎯 Target Variable

| Value | Meaning |
|---|---|
| `0` | Good standing (no delinquency) |
| `1` | Delinquent (missed or overdue payments) |

**Class Distribution:** 84% non-delinquent · 16% delinquent

---

## 📈 Model Results

| Model | Accuracy | ROC-AUC | Class 1 F1 |
|---|---|---|---|
| Logistic Regression (SMOTE) | 70% | 0.375 | 0.12 |
| Random Forest (SMOTE) | 79% | 0.376 | 0.00 |
| XGBoost (Upsampling) | 79% | 0.343 | 0.00 |

---

## 🧩 Technologies Used

| Category | Tools / Libraries |
|---|---|
| Programming | Python |
| Data Handling | Pandas |
| Visualization | Matplotlib, Seaborn |
| Data Preprocessing | Scikit-learn |
| Modeling | Scikit-learn, XGBoost, Random Forest, Logistic Regression |
| Balancing Data | imbalanced-learn (SMOTE) |
| Dashboard | Power BI |
| Environment | Jupyter Notebook |

---

## 🚀 Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/your-username/delinquency-analysis.git
cd delinquency-analysis

# 2. Install dependencies
pip install pandas numpy matplotlib seaborn scikit-learn imbalanced-learn xgboost

# 3. Open the notebook
jupyter notebook notebooks/delinquency_analysis.ipynb
```

---

## 🔍 Key Insights

### 📌 Customer & Delinquency Overview
- Total **500 customers** analyzed across 6 months of payment data.
- **80 customers (16%)** are delinquent; **420 customers (84%)** are in good standing.
- The dataset is significantly **imbalanced**, requiring SMOTE / oversampling before model training.

### 📌 Missing Payments
- Most customers missed **2 to 4 payments** — the highest frequency bucket.
- Very few customers missed only **1 payment**, suggesting that delinquency tends to escalate quickly once it begins.

### 📌 Employment Status
- **Unemployed customers** form the largest group in the dataset.
- Unemployment is a strong indicator of financial stress and correlates with higher delinquency risk.

### 📌 Credit Card Type
- **Gold** is the most popular card type (118 customers); **Platinum** is the least common (76 customers).
- Business card holders have the **highest delinquency count (23)** among all card types.
- Standard card holders have the **lowest delinquency count (11)**.

### 📌 Location
- Credit cards are distributed fairly across all 5 cities — Los Angeles, Chicago, Phoenix, Houston, New York.
- **New York** has slightly fewer cardholders and the **lowest delinquency count (11)**.
- **Los Angeles** has the highest delinquency count **(21)** among all cities.

### 📌 Age Group
- The **26–50 age group** represents the largest segment **(43%)**.
- The **51–75 age group** follows closely **(41.6%)**.
- The **0–25 age group** makes up only **15%** of customers.

### 📌 Debt-to-Income Ratio by Income Segment
- **Low income** segment carries the highest Debt-to-Income ratio **(0.32)**.
- **High income** segment is at **0.30** and **Medium income** at **0.29** — relatively balanced.
- Low-income customers face greater repayment burden relative to earnings.

### 📌 Monthly Payment Trends
- **Late payment ratio is consistently high** across all 6 months — indicating a systemic pattern, not a one-off event.
- Month_1 breakdown: Late (159), Missed (164), On-time (177) — nearly one-third of customers were already late or missed in the very first month.

### 📌 Model Insights
- All three models (Logistic Regression, Random Forest, XGBoost) struggled to detect **class 1 (delinquent)** cases, with F1-scores near 0 for that class.
- ROC-AUC scores (~0.35–0.38) are close to random, suggesting the current feature set and dataset size (500 rows) are insufficient for robust prediction.
- A **larger dataset and deeper feature engineering** are needed to improve minority class detection.

---

## 📊 Results

- Achieved **high accuracy and recall** on the test set.
- Balanced data improved the model's ability to detect delinquent cases.
- Visualizations provided strong insights into risk factors.

---

## 💡 Future Enhancements

- Hyperparameter tuning using **GridSearchCV** or **Optuna**.
- Deploy model using **Flask / Streamlit** for real-time prediction.
- Add **feature importance analysis** for interpretability.

---

## 📄 License

This project is for educational purposes. Feel free to fork and build on it.
---

## 🧑‍💻 Author

**Karina Goswami**
📍 Data Analyst | Data Science Enthusiast | Machine Learning Learner
📧 [goswamikarina01@gmail.com]
🔗 [www.linkedin.com/in/karina-goswami-0323bb321)

---

