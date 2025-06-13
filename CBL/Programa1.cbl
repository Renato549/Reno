       IDENTIFICATION DIVISION.
       PROGRAM-ID PAYROL00.
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
      ******** Variables for the report
       77 WHO       PIC X(15).
       77 WHERE     PIC X(20).
       77 WHY       PIC X(30).
       77 RATE      PIC 9(3).  
       77 HOURS     PIC 9(3).
       77 GROSS-PAY PIC 9(5).

       PROCEDURE DIVISION .
      ******** COBOL MOVE  statements -Literal Text to Variable
           MOVE "John Smith" TO WHO.
           MOVE "123 Main St" TO WHERE.
           MOVE "Because I need the money" TO WHY.
           MOVE 10.00 TO RATE.
           MOVE 40.00 TO HOURS.
      ******** Calculation using COMPUTE reserved word verb 
           COMPUTE GROSS-PAY = RATE * HOURS.
      ******** DISPLAY statements
           DISPLAY "Name; " WHO.
           DISPLAY "Address; " WHERE.
           DISPLAY "Reason for Pay; " WHY.
           DISPLAY "Hours worked;" HOURS.
           DISPLAY "Hourly rate;" RATE.
           DISPLAY "Gross Pay; " GROSS-PAY.
           DISPLAY WHY " from " WHO.
           GOBACK. 