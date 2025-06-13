       IDENTIFICATION DIVISION.
      *--------------------------------------------------------
       PROGRAM-ID. PROG3
       AUTHOR Renato
      *--------------------------------------------------------
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION. 
       FILE-CONTROL. 
      *--------------------------------------------------------
       DATA DIVISION. 

       FILE SECTION.
       WORKING-STORAGE SECTION. 
       01 WS-CONSTANTES.
           05 CTE-NOMPGM        PIC X(7) VALUE 'PBC1N03'.
           05 DSP-WILDCARDS PIC X(30) VALUE '************************'.
           
       01 WS-VARIABLES.
           05 AUX-DATE.
              10 AUX-YYYY       PIC 9(4).
              10 AUX-MM         PIC 9(2).
              10 AUX-DD         PIC 9(2).
           05 AUX-HOUR.
              10 AUX-HH         PIC 9(2).
              10 AUX-MM         PIC 9(2).
              10 AUX-SS         PIC 9(2).
              10 AUX-CC         PIC 9(2).
      *--------------------------------------------------------
       PROCEDURE DIVISION.

           PERFORM 1000-START
           PERFORM 2000-PROCESS
           PERFORM 3000-END
           .

       1000-START.
           INITIALIZE WS-VARIABLES

           DISPLAY DSP-WILDCARDS 
           DISPLAY ' INICIO DEL PROGRAMA ' CTE-NOMPGM 
           .
       2000-PROCESS.
           ACCEPT AUX-DATE FROM DATE YYYYMMDD
           ACCEPT AUX-HOUR FROM TIME
           DISPLAY DSP-WILDCARDS 
           DISPLAY ' HOLA! '.
           DISPLAY ' HOY ES: ' AUX-DD OF AUX-DATE
                    ' DE ' AUX-MM OF AUX-DATE ' DEL AÑO ' AUX-YYYY.
           DISPLAY ' A LAS: ' AUX-HH OF AUX-HOUR.

       3000-END.
           DISPLAY DSP-WILDCARDS 
           DISPLAY ' FINAL DEL PROGRAMA' CTE-NOMPGM 

           STOP RUN.
