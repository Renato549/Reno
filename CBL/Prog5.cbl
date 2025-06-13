       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PROG5
       AUTHOR. Renato

      * 
      *Este programa es una copia del anterior
      *Ademas muestra si existe en ese listado otro valor que tambien se
      *le pasa en el JCL
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
       DATA DIVISION. 

       FILE SECTION.
       WORKING-STORAGE SECTION. 
       01 WS-CONSTANTES.
           05 CTE-NOMPGM        PIC X(7) VALUE 'PBC1N05'.
           05 DSP-WILDCARDS PIC X(30) VALUE '************************'.
           
       01 WS-VARIABLES.
           05 AUX-SEARCH        PIC X(10).
           05 TBL-DIAS-SEMANA OCCURS 7 PIC X(10) VALUES SPACES.
           05 AUX-I             PIC 9.
           05 AUX-J             PIC 9.
           05 AUX-DATE.
              10 AUX-YYYY       PIC 9(4).
              10 AUX-MM         PIC 9(2).
              10 AUX-DD         PIC 9(2).
       01 SWITCHES.
           05 SW-FOUNDED        PIC 9 VALUE 0.
              88 NOT-FOUND      VALUES 0.
              88 FOUNDED        VALUES 1.
      *    05 SW-FOUNDED        PIC 1.
      *       88 NOT-FOUND      VALUES B"0".
      *       88 FOUNDED        VALUES B"1".
      *--------------------------------------------------------
       PROCEDURE DIVISION.
           PERFORM 1000-START
           PERFORM 2000-PROCESS
           PERFORM 3000-END
           .

       1000-START.
           INITIALIZE WS-VARIABLES
           MOVE 1 TO AUX-I
      *    SET NOT-FOUND TO TRUE
           DISPLAY DSP-WILDCARDS 
           DISPLAY ' INICIO DEL PROGRAMA ' CTE-NOMPGM 
           DISPLAY DSP-WILDCARDS 
           .
       2000-PROCESS.
           DISPLAY DSP-WILDCARDS 
           PERFORM 2100-LEER-LISTADO-SYSIN 7 TIMES
           PERFORM 2300-BUSCAR-VALOR
           PERFORM 2500-DISPLAY-RESULTS
           DISPLAY DSP-WILDCARDS 
           .
       2100-LEER-LISTADO-SYSIN.
           ACCEPT AUX-DATE FROM DATE YYYYMMDD
           ACCEPT TBL-DIAS-SEMANA(AUX-I) 
           ADD 1 TO AUX-I
           .
       2300-BUSCAR-VALOR.
           ACCEPT AUX-SEARCH 
           PERFORM VARYING AUX-I FROM 1 BY 1 UNTIL AUX-I > 7
              IF AUX-SEARCH = TBL-DIAS-SEMANA(AUX-I)
      *          DISPLAY 'Dia ' AUX-SEARCH ' encontrado en posicion '
      *                   AUX-I
                 MOVE AUX-I TO AUX-J
                 SET FOUNDED TO TRUE
              END-IF 
           END-PERFORM

      *    IF NOT-FOUND THEN
      *       DISPLAY 'El dia ' AUX-SEARCH ' no existe en la lista'
      *    END-IF
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

           IF FOUNDED 
              DISPLAY 'Dia ' AUX-SEARCH ' encontrado en posicion'
              AUX-J
           ELSE
              DISPLAY 'El dia ' AUX-SEARCH ' no existe en la lista'
           END-IF
      
           DISPLAY DSP-WILDCARDS 
           .
       3000-END.
           DISPLAY DSP-WILDCARDS 
           DISPLAY ' FINAL DEL PROGRAMA' CTE-NOMPGM 
           DISPLAY DSP-WILDCARDS 
           STOP RUN.