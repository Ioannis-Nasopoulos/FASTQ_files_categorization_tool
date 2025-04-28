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

This project constitutes an assignement for the course Population Genomics (Population Genomics - ΕΒΠ09) at Democritus University of Thrace, offered during the spring semester of the Master's Program in Applied Bioinformatics and data Analysis (https://bioinfo.mbg.duth.gr/).

# Features

The executable script "classify_fastq.sh":
- Automatically creates subdirectories for Phred33 and Phred64 encoded files for the categorisation of the FASTQ files of interest.
- Classifies FASTQ files based on the quality score of sequence reads.
- Prompts the user for the directory containing the FASTQ files.
- Prompts for user input to specify the FASTQ files to process or defaults to process all `.fastq` files in the current directory.
- Handles error cases gracefully, providing feedback on any files that could not be processed.
- The script can be executed even if it is in a different directory than the working directory. Also the input can come from a different directory than the working directory.
- The script is in an executable form and in accordance to the philosophy of the the Unix system, as it emphasises in minimal coding along with simplicity and modularity of different tools leading to more effecient workflows.


# Usage 

The current bash script was created for the purpose of the classification of FASTQ files that exist inside a directory. The files are moved in two subdirectories (phred33 or phred64) according to the Phred encoding type (Phred33 or Phred64) that they are encoded with. In addition, this script creates the subdirectories that are used for the classification with the intent of the reduction of errors in the classification process. After the execution of the ''classify_fastq.sh'', the programme  prompts for a user input to specify the directory contain the FASTQ files. Leaving the input blank/typing 'ENTER' the proceed to prompt the user for the specification of the FASTQ files to process or defaults to process all `.fastq` files in the current directory, if the user types 'ENTER'. 
It was taken into account that there is a chance that the directory containing the FASTQ files is not the working directory and that not all the FASTQ files are needed to be classified in a directory, so a larger flexibility is offered to the user. 
For every file in the FASTQ format the algorithm reads those line containing the quality scores, it then transforms every character of these lines in ASCII values and according to the ranges of these values the files are classified as either Phred+33(33-73) or Phred+64(64-104) format and are moved in the subsequent subdirectories. For each file a report is prompted with an message in the screen, about it's classification (Phred+33 or Phred+64), it's encoding method, some characters of the quality line, the RAW ASCII values and whether it was moved to the proper subdirectory, along with any possible errors. 

# Guidelines
1. Create a copy of a repository from GitHub onto your local machine and the change the current directory to the newly cloned repository folder named FASTQ_files_classification_tool.
   git clone https://github.com/Ioannis-Nasopoulos/FASTQ_files_classification_tool
   cd FASTQ_files_classification_tool

2. Ensure that the file is executable and make it if it is not.
Checking if the file is executable is performed with the command ls -l and according to the output (-rwxrwxr-x) or not (-rw-rw-r--), you should change it with the chmod +x classify_fastq.sh command and make it executable at first.

3. Execute of script:

./classify_fastq.sh

4. It is a situational, but, if the subdirectories allready exist, the following message is printed:
   mkdir: cannot create directory ‘phred33’: File exists
   mkdir: cannot create directory ‘phred64’: File exists

5. A message is prompted asking for the directory containing the FASTQ files "Please enter the directory containing the FASTQ files (leave blank/Press Enter for the current directory):" and immediately another message that asks for the FASTQ files of interest "Please enter the FASTQ files you want to process (space-separated). Press Enter to process all FASTQ files in the directory", otherwise it takes int account all the FASTQ files of the directory. In these commands a relative path is legitimate, but an absolute path for both the tool's and the files' directories is preferred.
 
6. In the folllowing steps, nothing is requested from the user. The programme is executed and it informs the user for the progress and the results of the execution along with possible errors.

Examples of using the programme from terminal:
-Assuming that the creation of the copy of the repository containing the tools was successful:
1) Run the script 
   ./FASTQ_files_classification_tool/classify_fastq.sh
   
2) Message of script for the input of the directory containing the FASTQ files:
Please enter the directory containing the FASTQ files (leave blank/Press Enter for the current directory):

3) The user gives the name of the directory containing the FASTQ files:
/your/file/containing/the/FASTQ files

4) Message of script for the input of the directory containing the FASTQ files:
Please enter the FASTQ files you want to process (space-separated). Press Enter to process all FASTQ files in the directory:

5) The user enters those FASTQ files thta wishes to be classified (in this example we typed 'ENTER' so that every file will be classified)
 
6) Results 

No input provided. Processing all FASTQ files in the directory: /mnt/c/Users/yiann/mock_reads_1.fastq /mnt/c/Users/yiann/mock_reads_10.fastq /mnt/c/Users/yiann/mock_reads_2.fastq /mnt/c/Users/yiann/mock_reads_3.fastq /mnt/c/Users/yiann/mock_reads_4.fastq /mnt/c/Users/yiann/mock_reads_5.fastq /mnt/c/Users/yiann/mock_reads_6.fastq /mnt/c/Users/yiann/mock_reads_7.fastq /mnt/c/Users/yiann/mock_reads_8.fastq /mnt/c/Users/yiann/mock_reads_9.fastq

My quality line is: (+2D1*E"%2$';B'.G+/($)@@I#(D!@@HC+H-4EE!)/&I(A%$?$%;7@="G+C<-DIHF888*E&I5@+
Raw ASCII values:  40 43 50 68 49 42 69 34 37 50 36 39 59 66 39 46
 71 43 47 40 36 41 64 64 73 35 40 68 33 64 64 72
 67 43 72 45 52 69 69 33 41 47 38 73 40 65 37 36
 63 36 37 59 55 64 61 34 71 43 67 60 45 68 73 72
 70 56 56 56 42 69 38 73 53 64 43
The /mnt/c/Users/yiann/mock_reads_1.fastq was coded with Phred+33
Fastq files were moved to their respective directories

My quality line is: &93%:<%+5#I251F/H5..G$/3/2008C@5.;*$)'.JG?9"G@890%;<;9-;
Raw ASCII values:  38 57 51 37 58 60 37 43 53 35 73 50 53 49 70 47
 72 53 46 46 71 36 47 51 47 50 48 48 56 67 64 53
 46 59 42 36 41 39 46 74 71 63 57 34 71 64 56 57
 48 37 59 60 59 57 45 59
The /mnt/c/Users/yiann/mock_reads_10.fastq was coded with Phred+33
Fastq files were moved to their respective directories

My quality line is: e\Jh`GULTX^HGGVK`TPWL@gAEd^DEGVf_X[bT`K\CYcH]dU]IdcPQY\DfOM`XPbXW`Z
Raw ASCII values:  101 92 74 104 96 71 85 76 84 88 94 72 71 71 86 75
 96 84 80 87 76 64 103 65 69 100 94 68 69 71 86 102
 95 88 91 98 84 96 75 92 67 89 99 72 93 100 85 93
 73 100 99 80 81 89 92 68 102 79 77 96 88 80 98 88
 87 96 90
The /mnt/c/Users/yiann/mock_reads_2.fastq was coded with Phred+64
Fastq files were moved to their respective directories

My quality line is: bARhNC\^VXGfefbJa_XcT_GCFb_gW[RLKXTYYWUNCgU[IYLA@CXYTIHIaThDTV^OHEYCZQHLTeeCPIbFFYaaRL_
Raw ASCII values:  98 65 82 104 78 67 92 94 86 88 71 102 101 102 98 74
 97 95 88 99 84 95 71 67 70 98 95 103 87 91 82 76
 75 88 84 89 89 87 85 78 67 103 85 91 73 89 76 65
 64 67 88 89 84 73 72 73 97 84 104 68 84 86 94 79
 72 69 89 67 90 81 72 76 84 101 101 67 80 73 98 70
 70 89 97 97 82 76 95
The /mnt/c/Users/yiann/mock_reads_3.fastq was coded with Phred+64
Fastq files were moved to their respective directories

My quality line is: BJIF/4/=DH26J5A5"5.)<<45"@8/>3'=E#"AI&D;$,%!I2'EG&'6)50<33ID,@0A1J5D-5)>+2A=G6<?!)3-'<01@5.AI,A='->6B"?.&DB-:I<F!%'9F*IC38$(,G=
Raw ASCII values:  66 74 73 70 47 52 47 61 68 72 50 54 74 53 65 53
 34 53 46 41 60 60 52 53 34 64 56 47 62 51 39 61
 69 35 34 65 73 38 68 59 36 44 37 33 73 50 39 69
 71 38 39 54 41 53 48 60 51 51 73 68 44 64 48 65
 49 74 53 68 45 53 41 62 43 50 65 61 71 54 60 63
 33 41 51 45 39 60 48 49 64 53 46 65 73 44 65 61
 39 45 62 54 66 34 63 46 38 68 66 45 58 73 60 70
 33 37 39 57 70 42 73 67 51 56 36 40 44 71 61
The /mnt/c/Users/yiann/mock_reads_4.fastq was between 64 and 74 so the quality scoring system used for the coding of quality is uncertain
The /mnt/c/Users/yiann/mock_reads_4.fastq was between 64 and 74 so the quality scoring system used for the coding of quality is uncertain
The /mnt/c/Users/yiann/mock_reads_4.fastq was between 64 and 74 so the quality scoring system used for the coding of quality is uncertain
The /mnt/c/Users/yiann/mock_reads_4.fastq was between 64 and 74 so the quality scoring system used for the coding of quality is uncertain
The /mnt/c/Users/yiann/mock_reads_4.fastq was coded with Phred+33
Fastq files were moved to their respective directories

My quality line is: DB2-(-J:"C-+1(?GE:*5=/"=0D)'C%758C-BG-1JJ*($A!E>@3/7!>?"%*AB16'<",0,)J<1F1H;??1C%D:0@98'D;!BB6;'!::8*0F>2B"1-+1%H,=
Raw ASCII values:  68 66 50 45 40 45 74 58 34 67 45 43 49 40 63 71
 69 58 42 53 61 47 34 61 48 68 41 39 67 37 55 53
 56 67 45 66 71 45 49 74 74 42 40 36 65 33 69 62
 64 51 47 55 33 62 63 34 37 42 65 66 49 54 39 60
 34 44 48 44 41 74 60 49 70 49 72 59 63 63 49 67
 37 68 58 48 64 57 56 39 68 59 33 66 66 54 59 39
 33 58 58 56 42 48 70 62 50 66 34 49 45 43 49 37
 72 44 61
The /mnt/c/Users/yiann/mock_reads_5.fastq was between 64 and 74 so the quality scoring system used for the coding of quality is uncertain
The /mnt/c/Users/yiann/mock_reads_5.fastq was between 64 and 74 so the quality scoring system used for the coding of quality is uncertain
The /mnt/c/Users/yiann/mock_reads_5.fastq was coded with Phred+33
Fastq files were moved to their respective directories

My quality line is: 2%5D$7=7B:<$FA75.:-E9"I>6I!6,/.2.5)1:+0?":'-(<%5!/9+GJ/I'(AE'6G1?:$
Raw ASCII values:  50 37 53 68 36 55 61 55 66 58 60 36 70 65 55 53
 46 58 45 69 57 34 73 62 54 73 33 54 44 47 46 50
 46 53 41 49 58 43 48 63 34 58 39 45 40 60 37 53
 33 47 57 43 71 74 47 73 39 40 65 69 39 54 71 49
 63 58 36
The /mnt/c/Users/yiann/mock_reads_6.fastq was coded with Phred+33
Fastq files were moved to their respective directories

My quality line is: -:3E@29C=C9F,B0/)9=G37<<=<6)4C#E/+H(B">268J;&1B*A&@04#85,$!:D;.?0H:7+:HAA>C+'4D/F%@%,6>%;0*@9"'/-<IA:5I629A',/EG#8?%+
Raw ASCII values:  45 58 51 69 64 50 57 67 61 67 57 70 44 66 48 47
 41 57 61 71 51 55 60 60 61 60 54 41 52 67 35 69
 47 43 72 40 66 34 62 50 54 56 74 59 38 49 66 42
 65 38 64 48 52 35 56 53 44 36 33 58 68 59 46 63
 48 72 58 55 43 58 72 65 65 62 67 43 39 52 68 47
 70 37 64 37 44 54 62 37 59 48 42 64 57 34 39 47
 45 60 73 65 58 53 73 54 50 57 65 39 44 47 69 71
 35 56 63 37 43
The /mnt/c/Users/yiann/mock_reads_7.fastq was coded with Phred+33
Fastq files were moved to their respective directories

My quality line is: U_AOXGgSDN]`FhMTaDeaIRL]LbCC`bYB]XJJ\WdX@QQB\GRC@CBNC
Raw ASCII values:  85 95 65 79 88 71 103 83 68 78 93 96 70 104 77 84
 97 68 101 97 73 82 76 93 76 98 67 67 96 98 89 66
 93 88 74 74 92 87 100 88 64 81 81 66 92 71 82 67
 64 67 66 78 67
The /mnt/c/Users/yiann/mock_reads_8.fastq was coded with Phred+64
Fastq files were moved to their respective directories

My quality line is: OOTaKBRPe]HbZCP`hNcfg@eIXX[gd@T\KGGcKXCKehNEYadMUScEgRNeNUF_aD``FMKDHg^P[\LKMNZNbF]YNGaB@BMOfQVTBHLMFZ[[ZJLfNVU
Raw ASCII values:  79 79 84 97 75 66 82 80 101 93 72 98 90 67 80 96
 104 78 99 102 103 64 101 73 88 88 91 103 100 64 84 92
 75 71 71 99 75 88 67 75 101 104 78 69 89 97 100 77
 85 83 99 69 103 82 78 101 78 85 70 95 97 68 96 96
 70 77 75 68 72 103 94 80 91 92 76 75 77 78 90 78
 98 70 93 89 78 71 97 66 64 66 77 79 102 81 86 84
 66 72 76 77 70 90 91 91 90 74 76 102 78 86 85
The /mnt/c/Users/yiann/mock_reads_9.fastq was coded with Phred+64
Fastq files were moved to their respective directories
   
6) Input of an invalid directory
   ./FASTQ_files_classification_tool/classify_fastq.sh
   Please enter the directory containing the FASTQ files (leave blank/Press Enter for the current directory):
   ./invalid/directory
  Please enter the FASTQ files you want to process (space-separated). Press Enter to process all FASTQ files in the directory:

 mkdir: cannot create directory ‘phred33’: File exists
mkdir: cannot create directory ‘phred64’: File exists
Please enter the directory containing the FASTQ files (leave blank/Press Enter for the current directory):

Please enter the FASTQ files you want to process (space-separated). Press Enter to process all FASTQ files in the directory:

No input provided. Processing all FASTQ files in the directory: ./*.fastq
Error: File ./*.fastq does not exist. Skipping.

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
