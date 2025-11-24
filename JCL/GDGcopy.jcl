//JGDGcopy     JOB (99),'COPIAR GDG',CLASS=A,MSGCLASS=Q,MSGLEVEL=(1,1),
//        REGION=0M,NOTIFY=&SYSUID RESTART STEP5
//***********************************************************
//*COPIAR UN PS EN UNA NUEVAGENERACION DE GDG
//**********************************************************
//COPYGDG   EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=* 
//SYSOUT1  DD DSN=DIRECCION.FICHERO,DISP=SHR
//SYSOUT2  DD DSN=DIRECCION.FICHER(+1),
//             DISP=(NEW,CATLG,DELETE),UNIT=SYSDA,
//             SPACE=(TRK,(10,5),RLSE),
//             DCB=*.SYSOUT1
//SYSIN    DD DUMMY


