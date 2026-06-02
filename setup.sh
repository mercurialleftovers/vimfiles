#!/bin/bash
#
if test -d ~/.venv; then
    python3 -m venv ~/.venv
fi

source ~/.venv/bin/activate
pip install mypy ruff ipython fastapi["standard"] matplotlib numpy pandas 
