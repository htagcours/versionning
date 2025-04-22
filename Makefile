.PHONY: release clean clean-venv venv install clean-test-db

clean:
	rm -rf build .coverage .python-version *egg-info .pytest_cache

clean-venv:
	rm -rf venv

venv: clean-venv
	@echo "Creating virtual environment..."
	virtualenv --python=python312 venv
	@echo "Virtual environment created."

install: venv clean
	venv/bin/pip install --upgrade pip setuptools
	venv/bin/pip install -r requirements.txt