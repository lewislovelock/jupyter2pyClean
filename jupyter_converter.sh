#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if jupyter is installed
if ! command_exists jupyter; then
    echo "Error: jupyter is not installed. Please install it to use this script."
    exit 1
fi

# Optionally check if black is installed
if ! command_exists black; then
    echo "Warning: black is not installed. The script will run without formatting."
    use_black=false
else
    use_black=true
fi

# Check if at least one notebook file is provided
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <notebook1.ipynb> [notebook2.ipynb ...]"
    exit 1
fi

# Process each notebook file provided as an argument
for notebook in "$@"; do
    if [[ ! -f "$notebook" ]]; then
        echo "Error: File '$notebook' not found."
        continue
    fi

    # Convert the Jupyter notebook to a Python script
    jupyter nbconvert --to script "$notebook"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to convert '$notebook'."
        continue
    fi

    # Extract the base name of the file (without extension)
    base_name=$(basename "$notebook" .ipynb)

    # Define the generated .py file name
    py_file="${base_name}.py"

    # Check if the .py file was created
    if [[ ! -f "$py_file" ]]; then
        echo "Error: Conversion succeeded, but Python file '$py_file' not found."
        continue
    fi

    # Clean the Python script by removing cell notations and overwrite the original file
    grep -v '^# In\[' "$py_file" > "${py_file}.tmp"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to clean '$py_file'."
        rm -f "${py_file}.tmp"
        continue
    fi

    # Replace the original file with the cleaned file
    mv "${py_file}.tmp" "$py_file"

    # Optionally format the cleaned Python script with black
    if [ "$use_black" = true ]; then
        black "$py_file"
    fi

    echo "Cleaned and formatted Python script generated: ${py_file}"
done
