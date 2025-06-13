       IDENTIFICATION DIVISION. 
       PROGRAM-ID. PROG7
       AUTHOR. Renato

      * 
      *PROGRAMA DE VERIFICACION DE IBAN BANCARIO

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
       DATA DIVISION. 

       FILE SECTION.
       WORKING-STORAGE SECTION. 
       01 WS-CONSTANTES.
           05 CTE-NOMPGM        PIC X(7) VALUE 'PBC1N07'.
           05 DSP-WILDCARDS     PIC X(30) VALUE '*********************
      -    '***'.
           05 LIT-SPACE1        PIC X(7) VALUE '0'.
       01 WS-VARIABLES.
           05 COM-IBAN.
              10 COM-PAIS       PIC X(2).
              10 COM-DCTL       PIC X(2).
              10 COM-CCC        PIC X(30).
           05 AUX-IBAN          PIC X(34).
           05 AUX-IBAN-SUST     PIC X(36).
           05 AUX-QUOCIENT-CHAR       PIC X(9).
           05 AUX-QUOCIENT-JUST       PIC X(9) JUST RIGHT.
           05 AUX-QUOCIENT      REDEFINES AUX-QUOCIENT-JUST PIC 9(9).
           05 AUX-REST          PIC 9(2).
           05 AUX-REST-1        PIC 9(1).
       01 C0UNTERS.
           05 AUX-I             PIC 9(2).
           05 AUX-J             PIC 9(2).
       01 TBL-AUXILIAR.
           05 TBL-CONVERSION    PIC X(78) VALUE 'A10B11C12D13E14F15G16
      -     'H17I18J19K20L21M22N23O24P25Q26R27S28T29O30V31W32X33Y34Z35'.
           05 TBL-R-CONVERSION REDEFINES TBL-CONVERSION OCCURS 26
                                INDEXED BY AUX-INDEX.
              10 TBL-LETTER     PIC X(1).
              10 TBL-NUMERO     PIC X(2).
            
       01 SWITCHES.
           05 SW-END-BANM       PIC 9  VALUE 0.
              88 NOT-ENDED            VALUES 0.
              88 ENDED                VALUES 1.
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
                     AUX-J

           ACCEPT COM-IBAN
           .
       2000-PROCESS.
           PERFORM 2100-REORDENAR-IBAN
           PERFORM 2200-CONVERTIR-LETRAS
           PERFORM 2300-CALCULAR-RESTO

           PERFORM 2400-DISPLAY-RESULTADO             
           .
       2100-REORDENAR-IBAN.
           STRING COM-CCC DELIMITED BY SPACES 
                  COM-PAIS DELIMITED BY SIZE 
                  COM-DCTL  DELIMITED BY SIZE 
               INTO AUX-IBAN 
           END-STRING
           .
       2200-CONVERTIR-LETRAS.
           PERFORM VARYING AUX-I FROM 1 BY 1 UNTIL AUX-I > 34
              SET AUX-INDEX TO 1
              SEARCH TBL-R-CONVERSION
                 AT END
                    MOVE AUX-IBAN(AUX-I:1) TO AUX-IBAN-SUST(AUX-J:1)
                    ADD 1 TO AUX-J
                 WHEN AUX-IBAN(AUX-I:1) = TBL-LETTER(AUX-INDEX)
                    MOVE TBL-NUMERO(AUX-INDEX) TO AUX-IBAN-SUST(AUX-J:2)
                    ADD 2 TO AUX-J
           END-PERFORM
           .
       2300-CALCULAR-RESTO.
           MOVE 1 TO AUX-J

           PERFORM 2310-PRIMER-RESTO
           PERFORM 2320-SEGUNDO-RESTO UNTIL ENDED 

           .

       2310-PRIMER-RESTO.
           MOVE AUX-IBAN-SUST(AUX-J:9) TO AUX-QUOCIENT 
           ADD 9 TO AUX-J 

           COMPUTE AUX-REST = FUNCTION MOD(AUX-QUOCIENT 97)
           . 
       2320-SEGUNDO-RESTO.
           MOVE SPACES TO AUX-QUOCIENT-CHAR 

           IF AUX-REST < 10
              MOVE AUX-REST TO AUX-REST-1
              STRING AUX-REST-1             DELIMITED BY SIZE
                     AUX-IBAN-SUST(AUX-J:8) DELIMITED BY SPACES 
              INTO AUX-QUOCIENT-CHAR 
              END-STRING
              ADD 8 TO AUX-J
           ELSE
              
              STRING AUX-REST-1             DELIMITED BY SIZE
                     AUX-IBAN-SUST(AUX-J:8) DELIMITED BY SPACES 
              INTO AUX-QUOCIENT-CHAR 
              END-STRING
              ADD 7 TO AUX-J          
           END-IF   
              
           UNSTRING AUX-QUOCIENT-CHAR DELIMITED BY SPACES 
              INTO AUX-QUOCIENT-JUST 
           END-UNSTRING 

           INSPECT AUX-QUOCIENT-JUST REPLACING ALL SPACES BY ZEROES

           COMPUTE AUX-REST = FUNCTION MOD(AUX-QUOCIENT 97)

           IF AUX-IBAN-SUST(AUX-J:1) = LIT-SPACE1 OR AUX-J = 36
              SET ENDED TO TRUE 
           END-IF
           .   

       2400-DISPLAY-RESULTADO.
           SUBTRACT 7 FROM AUX-J 
           
           IF AUX-REST = 1
              DISPLAY 'EL IBAN ' COM-IBAN(1:AUX-J) ' ES VALIDO'
           ELSE 
              DISPLAY 'EL IBAN ' COM-IBAN(1:AUX-J) ' NO ES VALIDO 
      -       'RESTO =' AUX-REST
              

           .    
       3000-END.
           GOBACK.