//PROG5J JOB(ACCT),'IBMUSER', NOTIFY=&SYSUID,
//           CLASS=A,MSGCLASS=J,MSGLEVEL=(1,1)
//*---------------------------------------------------------
//*SYSIN  libreria de programas fuentes
//*SYSLMOD libreria de objetos ejecutables
//*---------------------------------------------------------
  
//COBRUN  EXEC IGYWCL
//COBOL.SYSIN  DD DSN=&SYSUID..CBL(PROG5),DISP=SHR
//LKED.SYSLMOD DD DSN=&SYSUID..LOAD(PROG5),DISP=SHR
//GO    EXEC PGM=PROG5,
//            REGION=0M
//STEPLIB      DD DSNAME=&SYSUID..LOAD,DISP=SHR
//SYSPRINT     DD SYSOUT=*
//CEEDUMP      DD SYSOUT=*
//SYSUDUMP     DD SYSOUT=*
//SYSOUT       DD DSN=&SYSUID..OUT,
//              DISP=(NEW,CATLG,DELETE),
//              SPACE=(TRK,(1,1),RLSE),
//              DCB=(DSORG=PS,RECFM=FB,LRECL=50,BLKSIZE=0)
//SYSIN DD *
LUNES
MARTE
MIERCOLES
JUEVES
VIERNES
SABADO
DOMINGO 
JUEBES
/*



