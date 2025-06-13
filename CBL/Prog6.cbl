       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PROG6
       AUTHOR. Renato

      * 
      *Este programa calcula la letra de un DNI
       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
       DATA DIVISION. 

       FILE SECTION.
       WORKING-STORAGE SECTION. 
       01 WS-CONSTANTES.
           05 CTE-NOMPGM        PIC X(7) VALUE 'PBC1N06'.
           05 DSP-WILDCARDS PIC X(30) VALUE '************************'.
           
       01 WS-VARIABLES.
           05 WS-NUMDOC.
              10 NUMDOC-INI     PIC X.
              10 NUMDOC-NUM     PIC X(7).
           05 WS-NUMDOC-NUM     PIC 9(8).
           05 WS-NUMDOC-OUT     PIC X(9).
           05 WS-LETTERDOC      PIC X.
           05 AUX-TIPO          PIC X(3).
           05 AUX-NUMEDOC-INI   PIC X.
           05 AUX-QUOCIENT      PIC 9(8).
           05 AUX-REST          PIC 9(2).
           05 TBL-CODES.
              10 FILLER         PIC X(23)
                    VALUE 'TRWAGMYFPDXBNJZSQVHCLKE'.
           05 LETTER REDEFINES TBL-CODES OCCURS 23 PIC X.
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
           
           .
       2000-PROCESS.
           DISPLAY DSP-WILDCARDS 
           ACCEPT WS-NUMDOC

           IF NUMDOC-INI IS NUMERIC 
              MOVE 'NIF' TO AUX-TIPO
              PERFORM 2100-CALCULA-LETRA-FINAL
           ELSE
              MOVE 'NIE' TO AUX-TIPO
              PERFORM 2050-TRANSFORMA-LETRA-INICIAL
              PERFORM 2100-CALCULA-LETRA-FINAL
           END-IF   

           MOVE NUMDOC-INI TO AUX-NUMEDOC-INI  
           PERFORM 2500-DISPLAY-RESULTADO
           DISPLAY DSP-WILDCARDS               
           .
       2050-TRANSFORMA-LETRA-INICIAL.
           EVALUATE NUMDOC-INI
              WHEN 'X'
                 MOVE '0' TO NUMDOC-INI
              WHEN 'Y'
                 MOVE '1' TO NUMDOC-INI
              WHEN 'Z'
                 MOVE '2' TO NUMDOC-INI
              WHEN OTHER
                 DISPLAY 'NIE INCORRECTO'
           END-EVALUATE
           .
       2100-CALCULA-LETRA-FINAL.
           MOVE WS-NUMDOC TO WS-NUMDOC-NUM

           DIVIDE WS-NUMDOC-NUM BY 23 GIVING AUX-QUOCIENT 
                                      REMAINDER AUX-REST 
                 ON SIZE ERROR DISPLAY 'ERROR EN LA DIVISION'
           END-DIVIDE

           ADD 1 TO AUX-REST 
           MOVE LETTER(AUX-REST) TO WS-LETTERDOC
           STRING WS-NUMDOC DELIMITED BY SIZE 
                  WS-LETTERDOC DELIMITED BY SIZE 
                  INTO WS-NUMDOC-OUT 
           END-STRING
           .  

       2500-DISPLAY-RESULTADO.
           DISPLAY 'LA LETRA DEL ' AUX-TIPO ' '
                    AUX-NUMEDOC-INI NUMDOC-NUM 
                    ' ES ' WS-LETTERDOC ' : ' WS-NUMDOC-OUT 

           .    
       3000-END.
           DISPLAY DSP-WILDCARDS 
           DISPLAY ' FINAL DEL PROGRAMA' CTE-NOMPGM 
           DISPLAY DSP-WILDCARDS 
           STOP RUN.