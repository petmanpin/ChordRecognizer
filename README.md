# ChordRecognizer
EE 113DB DSP Capstone Design project 
12 Major chords recognizer based on audio. 
The recognizer works using Support Vector Machine (SVM). 
The project workflow are as follows. 
1. Convert the training sets from .wav to .txt file using MATLAB
2. Import the training sets to google colab
3. Trained the SVM on google colab and export the parameters to a flashdisk.
4. Read the parameters through a flashdisk on the STM32 Microcontroller.
5. Received audio using a microphone on the STM32 microcontroller and predict it using the parameters from the flashdisk. 

https://pmp1208.wixsite.com/my-site-2
