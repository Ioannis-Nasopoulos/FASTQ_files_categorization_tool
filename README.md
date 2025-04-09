# FASTQ_files_classification_tool

# Table of contents
- [Description](#description)
- [Features](#features)
- [Usage](#usage)
-	[Guidelines](#Guidelines)
-	[Requirements](#requirements)
-	[Known Bugs / Errors](#known-bugs--errors)
-	[Licence](#licence)
-	[Authors](#authors)

# Description

This project constitutes an assignement for the course Population Genomics (Population Genomics - ΕΒΠ09) at Democritus University of Thrace, offered during the spring semester of the Master's Program in Appleid Bioinformatics and data Analysis (https://bioinfo.mbg.duth.gr/).

# Features

The executable script "classify_fastq.sh":
- Automatically creates subdirectories for phred33 and phred64 files for the categorisation of the FASTQ files of interest.
- Classifies FASTQ files based on the quality score of sequence reads.
- rompts the user for the directory containing the FASTQ files.
- Prompts for user input to specify the FASTQ files to process or defaults to process all `.fastq` files in the current directory.
- Handles error cases gracefully, providing feedback on any files that could not be processed.
- The script can be executed even if it is in a different directory than the working directory. Also the input can come from a different directory than the working directory.
- The script is in an executable form and in accordance to the philosophy of the the Unix system, as it emphasises in minimal coding along with simplicity and mofularity of different tools leading to more effecient workflows.


# Usage 

The current bash script was created for the purpose of the classification of FASTQ files that exist inside a directory. The files are moved in two subdirectories (phred33 or phred64) according to the Phred encoding type (Phred33 or Phred64) that they are encoded with. In addition, this script creates the subdreoctories that are used for the classification with the intent of the reduction of errors in the classification process. After the execution of the ''classify_fastq.sh'', the programme  prompts for a user input to specify the directory contain the FASTQ files. Leaving the input blank/typing 'ENTER' the proceed to prompt the user for the specification of the FASTQ files to process or defaults to process all `.fastq` files in the current directory, if the user types 'ENTER'. 
It was taken into account that there is a chance that the directory contiaining the FASTQ files is not the working directory and that not all the FASTQ files are needed to be classified in a directory, so that a larger flexibility is offered to the user. 
For every file in the FASTQ format the algorithm reads those line containing the quality scores, it then transforms every character of these lines in ASCII values and according to the ranges of these values the files are classified as either Phred+33(33-73) or Phred+64(64-104) format and are moved in the subsequent subdirectories. For each file a report is prompted with an message in the screen, about it's classification (Phred+33 or Phred+64), it's encoding method, some characters of the quality line, the RAW ASCII values and whether it was moved to the proper subdirectory, along with any possible errors. 

# Guidelines
1. Create a copy of a repository from GitHub onto your local machine and the change the current directory to the newly cloned repository folder named FASTQ_files_classification_tool.
   git clone https://github.com/Ioannis-Nasopoulos/FASTQ_files_classification_tool
   cd FASTQ_files_classification_tool

2. Ensure that the file is executable and make it if it is not.
Checking if the file is executable is performed with the command ls -l and according to the output (-rwxrwxr-x) or not (-rw-rw-r--), you should change it with the chmod +x classify_fastq.sh command and make it executable at first.

3.Execute of script
./classify_fastq.sh

4.A message is prompted asking for the directory containing the FASTQ files "Please enter the directory containing the FASTQ files (leave blank/Press Enter for the current directory):" and immediately another message that asks for the FASTQ fikes of interest "Please enter the FASTQ files you want to process (space-separated). Press Enter to process all FASTQ files in the directory", otherwise it takes all the fastqfiles of the directory.

5. In the folllowing steps, nothing is requested from the user. The programme is executed and it informs the user for the progress and the results of the execution along with possible errors.

# Requirements

- A Linux system with a bash environment.
- FASTQ files in the current directory or another specified directory.
- Every FASTQ file must contain files encoded with only one type of Phred encoding in full FASTQ format (not fragmeneted or partial, especially concerning about the line of quality scores).

# Known Bugs / Errors
Although the code functions correctly and does not encounter major errors or bugs, it contains some minor issues and warnings that should be addressed to ensure best practices and maintain good conduct in programming.

•	If the directories ‘’phred33’’ and ‘’phred64’’ already exist in your working directory, a warning message is printed in the prompt that the directories already exist in your directory. Nevertheless, the classification of the FASTQ files is executed as commanded.

• If the file contains sequences encoded with both Phred+33 and Phred+64, the programme classifies the file according to the encoding format of the first sequence.


# Licence
This project is licensed under the MIT License - see the [Licence](https://github.com/Ioannis-Nasopoulos/FASTQ_files_categorization_tool/blob/main/LICENCE) file for more details.

# Author  
• Ioannis-Marios Nasopoulos [Ioannis-Nasopoulos](https://github.com/Ioannis-Nasopoulos)

#
Copyright © 2025 Ioannis-Nasopoulos
