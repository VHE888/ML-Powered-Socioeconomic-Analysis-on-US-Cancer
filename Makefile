PY ?= python3
ENV_DIR ?= .venv

# Setup virtual environment and install dependencies
.PHONY: setup
setup:
	$(PY) -m venv $(ENV_DIR)
	$(ENV_DIR)/bin/pip install --upgrade pip
	$(ENV_DIR)/bin/pip install -r requirements.txt
	$(ENV_DIR)/bin/pip install jupyter pytest nbconvert

# Run all Jupyter Notebooks
.PHONY: run
run:
	source $(ENV_DIR)/bin/activate && \
	jupyter nbconvert --to notebook --execute notebooks/week1-2.ipynb --inplace && \
	jupyter nbconvert --to notebook --execute notebooks/week3-4.ipynb --inplace && \
	jupyter nbconvert --to notebook --execute notebooks/week5-6.ipynb --inplace && \
	jupyter nbconvert --to notebook --execute notebooks/week7-8.ipynb --inplace

# Install dependencies only
.PHONY: install
install:
	$(ENV_DIR)/bin/pip install -r requirements.txt

# Run tests
.PHONY: test
test:
	$(ENV_DIR)/bin/pytest tests/

# Clean the environment and temp files
.PHONY: clean
clean:
	rm -rf $(ENV_DIR)
	rm -rf __pycache__ .ipynb_checkpoints