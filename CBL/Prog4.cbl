       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PROG4
       AUTHOR. Renato

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
       DATA DIVISION. 

       FILE SECTION.
       WORKING-STORAGE SECTION. 
       01 WS-CONSTANTES.
           05 CTE-NOMPGM        PIC X(7) VALUE 'PBC1N04'.
           05 DSP-WILDCARDS PIC X(30) VALUE '************************'.
           
       01 WS-VARIABLES.
           05 AUX-SEARCH        PIC X(10).
           05 TBL-DIAS-SEMANA OCCURS 7 PIC X(10) VALUES SPACES.
           05 AUX-I             PIC 9.
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
           MOVE 1 TO AUX-I
           DISPLAY DSP-WILDCARDS 
           DISPLAY ' INICIO DEL PROGRAMA ' CTE-NOMPGM 
           DISPLAY DSP-WILDCARDS 
           .
       2000-PROCESS.
           DISPLAY DSP-WILDCARDS 
           PERFORM 2100-LEER-LISTADO-SYSIN 7 TIMES
           PERFORM 2500-DISPLAY-RESULTS
           DISPLAY DSP-WILDCARDS 
           .
       2100-LEER-LISTADO-SYSIN.
           ACCEPT AUX-DATE FROM DATE YYYYMMDD
           ACCEPT TBL-DIAS-SEMANA(AUX-I) 
           ADD 1 TO AUX-I
           .

       2500-DISPLAY-RESULTS.
           DISPLAY DSP-WILDCARDS 
           DISPLAY ' * ' AUX-DD OF AUX-DATE 
                   '/' AUX-MM OF AUX-DATE 
                   AUX-YYYY OF AUX-DATE ' * '
           MOVE 1 TO AUX-I
           PERFORM UNTIL AUX-I >  7
              DISPLAY TBL-DIAS-SEMANA (AUX-I)
              ADD 1 TO AUX-I
           END-PERFORM
           DISPLAY DSP-WILDCARDS 
           .
       3000-END.
           DISPLAY DSP-WILDCARDS 
           DISPLAY ' FINAL DEL PROGRAMA' CTE-NOMPGM 
           DISPLAY DSP-WILDCARDS 
           STOP RUN.