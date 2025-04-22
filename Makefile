.PHONY: release clean clean-venv venv install clean-test-db

clean:
	rm -rf build .coverage .python-version *egg-info .pytest_cache

clean-venv:
	rm -rf venv

venv: clean-venv
	@echo "Creating virtual environment..."
	virtualenv --python=python310 venv
	@echo "Virtual environment created."

install: venv clean
	venv/bin/pip install --upgrade pip setuptools
	venv/bin/pip install -r requirements.txt

bump-patch:
	@echo "Bumping patch version..."
	venv/bin/bumpversion patch --allow-dirty  --verbose
	@echo "Patch version bumped."

bump-minor:
	@echo "Bumping patch version..."
	venv/bin/bumpversion minor --allow-dirty  --verbose
	@echo "Patch version bumped."

bump-major:
	@echo "Bumping patch version..."
	venv/bin/bumpversion major --allow-dirty  --verbose
	@echo "Patch version bumped."