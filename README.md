# Jupyter Converter Script 🚀

This is a simple shell script designed to convert Jupyter Notebook files (`.ipynb`) into Python scripts (`.py`) while removing the cell notations (`# In[ ]:`) for a cleaner output. It automates the process of generating Python scripts from notebooks, making it easier to integrate your Jupyter work into your development pipeline.

## Prerequisites 📋

Before using the script, make sure you have Jupyter and nbconvert installed in your environment. If not, you can easily install them using the following commands:

```bash
pip install jupyter
pip install nbconvert
```

## How to Use the Script 🛠️

1. **Clone or Download the Script**:
   - Save the `jupyter_converter.sh` script to your local machine.

2. **Make the Script Executable**:
   - Open your terminal and navigate to the directory where the script is saved.
   - Run the following command to make the script executable:
  
     ```bash
     chmod +x jupyter_converter.sh
     ```

3. **Run the Script**:
   - You can convert a Jupyter Notebook to a cleaned Python script by running:

     ```bash
     ./jupyter_converter.sh <notebook.ipynb>
     ```

   - Replace `<notebook.ipynb>` with the actual name of your notebook file. For example:

     ```bash
     ./jupyter_converter.sh example_notebook.ipynb
     ```

4. **Output**:
   - The script will generate a Python file with the same name as your notebook but with the `.py` extension.
   - Example: If your notebook is `example_notebook.ipynb`, the script will produce `example_notebook.py` without the cell notations.

## Example 🧑‍💻

Suppose you have a notebook named `data_analysis.ipynb`. To convert it into a clean Python script, simply run:

```bash
./jupyter_converter.sh data_analysis.ipynb
```

After running the command, you’ll find a file named `data_analysis.py` in the same directory, ready for use.

## Troubleshooting 🛠️

- **Command Not Found**: If you encounter an error like `command not found: jupyter`, ensure that Jupyter is installed and properly configured in your environment.
- **No Such File or Directory**: Make sure the notebook file exists in the specified path when running the script.

## Feedback and Contributions ❤️

If you have any feedback, suggestions, or want to contribute to improving this script, feel free to open an issue or submit a pull request. Your contributions are welcome!

---

Enjoy converting your Jupyter Notebooks to Python scripts effortlessly! 🚀😊
