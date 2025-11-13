# Impact of Socioeconomic Factors on Cancer Incidence and Outcomes


## 1. Project Description

Cancer remains one of the leading causes of death worldwide, and multiple studies suggest that socioeconomic factors may play a role in cancer incidence and mortality rates. This project investigates the relationship between socioeconomic status and cancer rates by analyzing key variables such as median income and poverty levels across U.S. counties.

The study aims to determine whether lower income levels correlate with higher cancer incidence and mortality rates and whether certain regions are disproportionately affected due to socioeconomic disparities. By leveraging statistical modeling techniques, this project will assess the strength and significance of these relationships.

---

## 2. Project Goals

The primary objectives of this study are:

- **Analyze the correlation** between socioeconomic factors and cancer rates
- **Determine the statistical significance** of income and poverty levels on cancer incidence and mortality
- **Apply hypothesis testing and regression models** to quantify relationships
- **Visualize findings** using effective data visualizations

---

## 3. Data Collection Plan

The data used in this study consists of county-level cancer rates and socioeconomic variables. The primary sources include:

- **Cancer incidence and mortality data** (e.g., obtained from the CDC, SEER database, or public health datasets)
- **Socioeconomic data** such as median household income and poverty rates (e.g., U.S. Census Bureau, American Community Survey)
- **Additional demographic and regional data** to control for potential confounding factors

If necessary, data will be preprocessed by cleaning missing values, normalizing numerical variables, and encoding categorical features.

---

## 4. Data Modeling Approach

To evaluate the impact of socioeconomic factors on cancer rates, the following methods will be implemented:

- **Linear Regression:** To model the relationship between median income/poverty levels and cancer rates
- **Hypothesis Testing** (e.g., Alexander-Govern Test): To determine if significant differences exist among different income groups
- **Correlation Analysis:** To assess how strongly different socioeconomic variables relate to cancer incidence and mortality
- **Potential Advanced Models:** If necessary, decision trees or machine learning approaches (e.g., XGBoost) may be explored

---

## 5. Data Visualization Plan

To effectively communicate the findings, the following visualizations will be used:

- **Scatter plots** to illustrate the correlation between cancer rates and socioeconomic variables
- **Bar charts** showing differences in cancer rates across income groups
- **Heatmaps** for correlation matrices to identify strong relationships
- **Geospatial visualizations** to highlight regional disparities

---

## 6. Test Plan

To validate the findings and ensure model robustness:

- Data will be split into **training (80%) and testing (20%) sets** for model validation
- **Cross-validation techniques** may be applied to prevent overfitting
- **Statistical significance testing** will be conducted to confirm findings
- If time permits, **sensitivity analysis** will be performed to check how different model assumptions impact the results.


# Final Report


## 1. How to Build and Run the Code

Follow the steps below to set up the environment, install dependencies, and run the analysis pipeline.

### Environment Setup

All dependencies are listed in the `requirements.txt` file.

To set up the environment:

```bash
# 1. Fork and clone the repository
git clone <your-repo-ssh-url>
cd <your-project-folder>

# 2. Create a virtual environment
python3 -m venv .venv

# 3. Activate the virtual environment
# On Linux/Mac
source .venv/bin/activate
# On Windows
.venv\Scripts\activate

# 4. Install all dependencies
pip install -r requirements.txt
```

### Makefile Instructions

This project provides a `Makefile` to simplify environment setup, dependency management, notebook execution, and testing.

Here are the available commands:

1. **Set up environment and install dependencies**

Create a new virtual environment `.venv/`, upgrade pip, and install all required packages from `requirements.txt`:

```bash
make setup
```

2. **Launch Jupyter Notebook to run the code interactively**

Start a Jupyter Notebook server to run and explore the project notebooks manually:

```bash
make run
```

3. **Install dependencies only**

If you already have a virtual environment, you can simply install the project dependencies:

```bash
make install
```

4. **Run tests**

Run all test scripts located under the `tests/` directory using `pytest`.

```bash
make test
```

5. **Clean the environment**

Remove the virtual environment `.venv/` and temporary files.

```bash
make clean
```

## 2. Testing and GitHub Workflow

To ensure the reproducibility and robustness of the project, we implemented tests under the `tests/` directory using `pytest`.

The tests are designed not only to check data existence or basic value correctness, but also to verify that the core pipeline runs correctly given a snippet of the expected data format.

### Test Scripts

- `test_data_loading.py`  
  Verifies that the prediction output file (`linear_regression_predictions.csv`) can be loaded successfully and contains expected data.

- `test_model_output.py`  
  Checks that the model output includes a `Predicted` column and that it contains no missing (NaN) values.

- `test_pipeline_run.py`  
  Simulates a small sample input with the expected structure (e.g., `povertypercent`, `medincome`, `popest2015`, `avgdeathsperyear`) and validates that the preprocessing and modeling pipeline runs without errors.  
  This test helps catch issues such as:
  - Missing or renamed columns
  - Changed data types or unexpected formats
  - Silent logic failures during training or prediction

### GitHub Actions Workflow

A GitHub Actions workflow (`.github/workflows/ci.yml`) is configured to automatically:

1. Set up a Python environment with dependencies listed in `requirements.txt`
2. Run the full test suite using `pytest`

This continuous integration workflow ensures that any new commits are automatically checked for functionality and data consistency, helping maintain the project's reliability over time.

## 3. Data Visualizations

This section presents key visualizations used to explore the relationships between socioeconomic factors and cancer incidence and mortality in the U.S.

### 3.1 Correlation Matrix

<p align="center">
  <img src="plots/correlation_heatmap.png" width="750"/>
</p>

**Observation:**  
The correlation matrix shows relationships between socioeconomic indicators and cancer-related outcomes. Notable patterns include:
- Strong positive correlation between average cancer cases and deaths
- Strong negative correlation between income and poverty
- Moderate negative correlation between higher education rates and cancer mortality

### 3.2 Poverty Rate vs. Cancer Deaths

<p align="center">
  <img src="plots/poverty_vs_deaths.png" width="750"/>
</p>

**Observation:**  
Counties with higher poverty percentages tend to report more cancer-related deaths on average. Although the overall trend is positive, considerable variance exists, suggesting other contributing factors.

### 3.3 Education vs. Cancer Deaths

<p align="center">
  <img src="plots/education_vs_deaths.png" width="750"/>
</p>

**Observation:**  
A generally negative trend appears: counties with higher composite education scores report fewer cancer deaths. However, variance across the data points indicates a multifactorial relationship.

### 3.4 Cancer Deaths Across U.S. Regions

<p align="center">
  <img src="plots/Cancer_deaths_regions.png" width="750"/>
</p>

**Observation:**  
Boxplots grouped by U.S. Census regions show the South consistently has a higher median and a wider range of cancer death counts. The West region includes several outliers with unusually high values.

### 3.5 Cancer Mortality Rate by State

<p align="center">
  <img src="plots/cancer_mortality_by_state.png" width="800"/>
</p>

**Observation:**  
- States in the South and Midwest, such as **Mississippi**, **Kentucky**, and **West Virginia**, exhibit notably high mortality rates.
- Western and Northeastern states tend to have comparatively lower death rates.
- These patterns align with known socioeconomic and healthcare access disparities in the U.S.

**Interactive Features (via Plotly):**
- The map is implemented using Plotly's interactive `choropleth` function.
- When run inside the Jupyter Notebook (`notebooks/interactive_viz.ipynb`), users can:
  - **Hover** over each state to view the exact death rate.
  - **Zoom** or **pan** for closer examination.
  - **Access tooltips** that dynamically display state-level metrics.

### 3.6 Interactive Visualizations

To enable dynamic exploration of trends in cancer mortality and socioeconomic indicators, we implemented interactive plots using Plotly.

- **Interactive Choropleth Map:**  
  Users can zoom, pan, and hover over each U.S. state to view its cancer mortality rate per 100,000 residents.

- **Interactive Scatter Plot:**  
  Displays the relationship between poverty rate and average cancer deaths. Hovering reveals state details, and a trendline highlights the overall pattern.

> For interactive versions of the plots, see: `notebooks/interactive_viz.ipynb` - (Preparation of the environment is needed before running the code)

## 4. Data Processing and Modeling Description

This section summarizes the full data processing and modeling workflow from Week 1–8.

### 4.1 Week 1–2: Data Collection and Preprocessing

- **Data Loading**
  - Loaded `cancer_reg.csv` containing cancer statistics.
  - Loaded `avg-household-size.csv` containing average household size by geography.

- **Data Cleaning**
  - Stripped whitespace from column names and converted them to lowercase.
  - Merged datasets using `geography` as the key.
  - Extracted `state` and `county` information from `geography`.
  - Dropped irrelevant columns (e.g., `binnedinc`, `studypercap`, `percentmarried`).
  - Checked and handled missing values:
    - Removed columns with excessive missingness.
    - Imputed remaining missing values using the median strategy.

- **Feature Engineering**
  - Created new columns:
    - `region`: Assigned based on the state to one of four U.S. regions.
  - Applied winsorization to reduce the effect of outliers.
  - Applied log transformation (`np.log1p`) on highly skewed variables such as `medianincome` and `avgdeathsperyear`.

- **Initial Visualization**
  - Plotted histograms and boxplots to explore distributions.
  - Generated a correlation heatmap (`plots/correlation_heatmap.png`) to examine variable relationships.

### 4.2 Week 3–4: Exploratory Data Analysis and Baseline Modeling

- **Exploratory Data Analysis (EDA)**
  - Examined pairwise correlations between socioeconomic variables and cancer mortality.
  - Scatter plots were generated:
    - Poverty rate vs. average cancer deaths.
    - Household size vs. cancer deaths.

- **Baseline Modeling**
  - Implemented **Linear Regression** to predict `avgdeathsperyear` using key features like `povertypercent`, `medianincome`, and `education`.
  - Evaluated baseline model:
    - Achieved moderate R² scores.
    - Residual plots revealed potential non-linearity and heteroscedasticity.

- **Visualization**
  - Scatter plot showing poverty rate vs. cancer deaths (`plots/poverty_vs_deaths.png`).
  - Regional cancer deaths summarized in bar charts (`plots/Cancer_deaths_regions.png`).

### 4.3 Week 5–6: Feature Engineering and Model Enhancement

- **Feature Engineering**
  - Introduced an interaction term: `povertypercent * education` to capture combined effects.
  - Created dummy variables for regions using one-hot encoding.
  - Updated preprocessing pipeline to handle numerical and categorical columns separately:
    - Imputation → Scaling → Encoding.

- **Advanced Modeling: XGBoost**
  - Implemented `XGBRegressor` with parameters:
    - `n_estimators=1000`
    - `learning_rate=0.1`
    - `early_stopping_rounds=5`
  - Used `Pipeline` to combine preprocessing and model training.
  - Early stopping was based on validation set performance to prevent overfitting.

- **Model Evaluation**
  - Cross-validation with 5 folds:
    - Scored using mean absolute error (MAE).
  - Held-out validation set evaluation:
    - Computed Test MAE and Test R².
  - Feature importance plot generated (`plots/feature_importance.png`).

### 4.4 Week 7–8: Final Model Tuning and Visualization

- **Hyperparameter Tuning**
  - Performed initial random search to adjust `max_depth`, `min_child_weight`, and `subsample`.
  - Fine-tuned final model using selected hyperparameters.

- **Residual Analysis**
  - Plotted residuals vs. predicted values to check for patterns (`plots/residuals_plot.png`).
  - Found reasonable random scatter, indicating no severe biases.

- **Key Observations**
  - Poverty rate showed the strongest positive association with cancer deaths.
  - Higher educational attainment correlated with lower cancer deaths.
  - Regional disparities were evident, with the South having higher mortality rates.

### Key Visual Outputs

- **Feature Importance Bar Plot** (`plots/feature_importance.png`)
  - Highlights most influential predictors such as poverty rate and median income.

- **Residual vs. Predicted Scatter Plot** (`plots/residuals_plot.png`)
  - Checks homoscedasticity and linearity assumptions visually.

### Summary

Throughout Weeks 1–8, we progressively enhanced the pipeline:
- Started from simple EDA and linear regression.
- Gradually moved towards sophisticated feature engineering and XGBoost modeling.
- Achieved robust predictive performance while maintaining interpretability through feature importance analysis and clear residual diagnostics.

All results directly support the project goals of analyzing the impact of socioeconomic factors on cancer outcomes.

## Results

This section focuses on model performance and outputs from both linear regression and XGBoost models. The evaluation emphasizes model accuracy, error behavior, and key predictive features.

### Actual vs Predicted (Linear Regression)

<p align="center">
  <img src="plots/actual_vs_predicted.png" width="750"/>
</p>

**Observation:**  
The linear regression model demonstrates a general positive alignment between actual and predicted cancer death rates. However, considerable spread around the diagonal line reveals systematic under- and over-predictions, especially for extreme values.

**Interpretation:**  
While linear regression captures broad trends, its limited flexibility makes it less effective for counties with unusually high or low death rates.

### Actual vs Predicted (XGBoost)

<p align="center">
  <img src="plots/xgboost_predictions.png" width="750"/>
</p>

**Observation:**  
Compared to the linear model, the XGBoost regression predictions align more tightly with the actual values, with reduced dispersion and fewer extreme errors.

**Interpretation:**  
XGBoost’s ability to model non-linear relationships and interactions allows it to achieve better prediction accuracy, especially in mid- and high-death regions.

### Residuals vs Predicted Values

<p align="center">
  <img src="plots/residual_plot.png" width="750"/>
</p>

**Observation:**  
Residuals are mostly centered around zero, indicating minimal bias. However, heteroscedasticity appears at higher predicted values, with a few large deviations suggesting outlier behavior.

**Interpretation:**  
While the model performs well overall, extreme cancer mortality cases may be influenced by latent factors not included in the model (e.g., pollution, comorbidities).

### Feature Importance (XGBoost)

<p align="center">
  <img src="plots/feature_importance.png" width="750"/>
</p>

**Note:**  
Feature IDs correspond to preprocessed variables. The mapping is:

| Rank | Feature ID | Feature Name |
|------|------------|--------------|
| 1    | F1         | `popest2015` |
| 2    | F0         | `medincome` |
| 3    | F6         | `pctnohs18_24` |
| 4    | F7         | `pcths18_24` |
| 5    | F9         | `pcths25_over` |
| 6    | F3         | `medianage` |
| 7    | F20        | `birthrate` |
| 8    | F8         | `pctbachdeg18_24` |
| 9    | F17        | `pctwhite` |
| 10   | F11        | `pctemployed16_over` |

**Interpretation:**  
Population size, income, and educational attainment dominate the model's decision logic. This reinforces the hypothesis that socioeconomic factors are strong drivers of cancer mortality variations across counties.

