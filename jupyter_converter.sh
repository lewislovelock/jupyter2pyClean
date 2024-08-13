#!/bin/bash

# Check if the notebook file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <notebook.ipynb>"
    exit 1
fi

# Convert the Jupyter notebook to a Python script
jupyter nbconvert --to script "$1"

# Extract the base name of the file (without extension)
base_name=$(basename "$1" .ipynb)

# Define the generated .py file name
py_file="${base_name}.py"

# Clean the Python script by removing cell notations
grep -v '^# In\[' "$py_file" > "${base_name}_cleaned.py"

# Optionally, remove the original Python script
rm "$py_file"

echo "Cleaned Python script generated: ${base_name}_cleaned.py"
