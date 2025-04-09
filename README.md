# FASTQ_files_categorization_tool

# Table of contents
- [Description](#description)
- [Features](#features)
-	[Usage](#usage)
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
- Prompts for user input to specify the FASTQ files to process or defaults to process all `.fastq` files in the current directory.
- Handles error cases gracefully, providing feedback on any files that could not be processed.
- The script can be executed even if it is in a different directory than the working directory. Also the input can come from a different directory than the working directory.
- The script of bash in an executable form is in accordance to the philosophy of the the Unix system, as it emphasises in minimal coding along with simplicity and mofularity of different tools leading to more effecient workflows.


# Usage 
The current bash script was created for the purpose of classification of FASTQ files that exist inside a directory. The files are moved in two subdirectories (phred33 or phred64) according to the Phred encoding type (Phred33 or Phred64). This script was developed for the creation of the subdreoctories that are used for the classification with the intent of the reduction of errors in the process. After the execution of the ''classify_fastq.sh'' the programm  Το script εχεί σχεδιαστεί έτσι ώστε να δημιουργεί τους φακέλους που θα χρειαστεί με σκοπό την μείωση των λαθών χειρισμού και την εύκολη χρήση του για όλους. Για κάθε αρχείο του φακέλου που βρίσκεται σε FastQ format θα διαβάσει τις γραμμές που περιέχουν τα quality scores, θα μετατρέψει κάθε χαρακτήρα της γραμμής σε Ascii τιμές και θα κρατήσει μόνο τις έγκυρες τιμές Phred. Από τις έγκυρες αυτές τιμές ανάλογα με το έυρος που κυμαίνονται κατηγοριοποιεί τα αρχεία σε Phred+33(33-64) ή Phred+64(64-104) format και τα μετακινεί στους αντίστοιχους υποφακέλους. Σε κάθε βήμα ή τυχών προβλήματα ενημερώνει τον χρήστη.
The current bash script was created for the purpose of the classification of FASTQ files that exist inside a directory. The files are moved in two subdirectories (phred33 or phred64) according to the Phred encoding type (Phred33 or Phred64) that they are encoded with. In addition, this script creates the subdreoctories that are used for the classification with the intent of the reduction of errors in the classification process. After the execution of the ''classify_fastq.sh'', the programme  prompts for a user input to specify the FASTQ files to process or defaults to process all `.fastq` files in the current directory, if the user types 'ENTER'. 
It was taken into account that there is a chance that not all the FASTQ files are needed to be classified in a directory, so that a larger flexibility is offered to the user. For every file in the FASTQ format the algorithm reads those line containing the quality scires, it then transforms every character of these lines in ASCII values and according to the ranges of these values the files are classified as either Phred+33(33-73) or Phred+64(64-104) format and are moved in the subsequent subdirectories. For each file a report is prompted with an message in the screen, about it's classification (Phred+33 or Phred+64) and whether it was moved to the proper subdirectory, along with any possible errors. 


