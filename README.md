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
- The cuurent script of bash in an executable form is in accordance to the philosophy of the the Unix system, as it emphasises in minimal coding along with simplicity and mofularity of different tools leading to more effecient workflows.


# Usage 
Αυτό το Bash Script δημιουργήθηκε για να κατηγοριοποιεί αρχεία FastQ,που βρίσκονται μέσα σε έναν φάκελο, σε δύο υποφακέλους (Phred33 ή Phred64) ανάλογα την κωδικοποίηση Phred που φέρουν.Το script εχεί σχεδιαστεί έτσι ώστε να δημιουργεί τους φακέλους που θα χρειαστεί με σκοπό την μείωση των λαθών χειρισμού και την εύκολη χρήση του για όλους.Για κάθε αρχείο του φακέλου που βρίσκεται σε FastQ format θα διαβάσει τις γραμμές που περιέχουν τα quality scores, θα μετατρέψει κάθε χαρακτήρα της γραμμής σε Ascii τιμές και θα κρατήσει μόνο τις έγκυρες τιμές Phred. Από τις έγκυρες αυτές τιμές ανάλογα με το έυρος που κυμαίνονται κατηγοριοποιεί τα αρχεία σε Phred+33(33-64) ή Phred+64(64-104) format και τα μετακινεί στους αντίστοιχους υποφακέλους. Σε κάθε βήμα ή τυχών προβλήματα ενημερώνει τον χρήστη.


