       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG2
       AUTHOR. Renato
       DATE-WRITTEN 05/06/2025.
      *-------------------------------------------
      *Este mensaje muestra hola mundo en pantalla
      *-------------------------------------------
       ENVIRONMENT DIVISION. 
       CONFIGURATION SECTION. 
       INPUT-OUTPUT SECTION.
       
       DATA DIVISION.
      *-------------------------------------------
       FILE SECTION. 
       WORKING-STORAGE SECTION. 
       01 CONSTANTES.
           05 CTE-NOMPGM     PIC X(7)   VALUE 'PGM2'.
       01 VARIABLES.
           05 WS-MESSAGE     PIC X(36).
      *-------------------------------------------
       PROCEDURE DIVISION.
      *-------------------------------------------
           PERFORM 1000-INICIO
           PERFORM 2000-PROCESS
           PERFORM 3000-END.

       1000-INICIO.
           DISPLAY 'Inicio del ' CTE-NOMPGM.
       
       2000-PROCESS.
           MOVE 'Hola Mundo' TO WS-MESSAGE. 
       
       3000-END.
           DISPLAY 'Fin del programa'.
           STOP RUN.
