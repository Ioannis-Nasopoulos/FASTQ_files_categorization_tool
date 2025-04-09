#!/bin/bash
# Creation of directories for the classification of FASTQ files.
 mkdir phred33
 mkdir phred64


# Prompt the user to input the directory containing FASTQ files
echo "Please enter the directory containing the FASTQ files (leave blank for the current directory):"
read input_dir

# Use the current directory if no input is provided
if [[ -z "$input_dir" ]]; then
    input_dir="."
fi

# Prompt the user to input the FASTQ files to process
echo "Please enter the FASTQ files you want to process (space-separated). Press Enter to process all FASTQ files in the directory:"
read -a fastq_files # Read user input as an array of filenames

# If no input is provided, set fastq_files to all *.fastq files in the directory
if [[ ${#fastq_files[@]} -eq 0 ]]; then
    fastq_files=("$input_dir"/*.fastq)
    echo "No input provided. Processing all FASTQ files in the directory: ${fastq_files[@]}"
fi

# Loop through the provided FASTQ files
for fastq_file in "${fastq_files[@]}"; do
    # Check if the file exists
    if [[ ! -f "$fastq_file" ]]; then
        echo "Error: File $fastq_file does not exist. Skipping."
        continue
    fi

    # Extracting the quality score line (4th line in FASTQ files)
    quality_line=$(sed -n '4p' "$fastq_file")
    if [[ -z "$quality_line" ]]; then # Ensuring the extraction of the quality line score 
        echo "Error: No quality line found in $fastq_file" # Printing of any possible errors
        continue
    fi
    echo "My quality line is: $quality_line" # Printing of quality line

    # Converting quality scores to ASCII values
    ASCII_values=$(echo -n "$quality_line" | od -An -t u1 | tr -s ' ')
    echo "Raw ASCII values: $ASCII_values" # Printing of the extracted ASCII scores 

    # Processing ASCII values
    for score in $ASCII_values; do
        score_value=$((10#$score)) # Transformation of ASCII scores to integers for better numeric checks.

        # Check for encoding type
        if [[ "$score_value" -lt 33 ]]; then # Checking if the variable 'score_value' is less than 33.
            echo "Error: Invalid ASCII value $score_value in $fastq_file" # Printing of an error message for invalid ASCII values if the former check is TRUE.
            break
        elif [[ "$score_value" -ge 33 && "$score_value" -lt 64 ]]; then # Checking if the variable 'score_value' is greater or even than 33 and less than 64.
            mv "$fastq_file" phred33 # Moving the FASTQ file in the directory that stores the Phred33 coded files, if the former check is TRUE.
            echo "The "$fastq_file" was coded with Phred+33"
            break
        elif [[ "$score_value" -ge 64 && "$score_value" -le 74 ]]; then # Checking if the variable 'score_value' is greater or even than 64 and less or even than 74.
            echo "The "$fastq_file" was between 64 and 74 so the quality scoring system used for the coding of quality is uncertain"
            continue
        elif [[ "$score_value" -gt 74 ]]; then # Checking if the variable 'score_value' is greater than 74.
            mv "$fastq_file" phred64 # Moving the FASTQ file in the directory that stores the Phred64 ccoded files, if the former check is TRUE.
            echo "The "$fastq_file" was coded with Phred+64"
            break
        fi
    done
    echo "Fastq files were moved to their respective directories" # Printing message of completion of the process
done
