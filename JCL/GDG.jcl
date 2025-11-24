//JGDGNEW     JOB (99),'CREAR GDG',CLASS=A,MSGCLASS=Q,MSGLEVEL=(1,1),
//        REGION=0M,NOTIFY=&SYSUID RESTART STEP5
//***********************************************************
//*CREAR ARCHIVO BASE DE GDG
//**********************************************************
//CREAGDG   EXEC PGM=IDCAMS
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=* 
//SYSIN    DD *
  DEFINE  GDG(                      - 
          NAME(DIRECCION.DE.FICHERO)-
          LIMIT(10)                 -
          NOEMPTY                   -
          SCRATCH)
//*
//*********************************************************
//*CREAR LA PRIMERA VERSION DEL GDG
//********************************************************* 
//GDGV001  EXEC PGM=IEFBR14
//GDGVERS  DD DSN=DIRECCION.DE.FICHERO(+1),
//             DISP=(NEW,CATLG,DELETE),SPACE=(TRK,(5,5)),UNIT=SYSDA,
//             DCB=(LRECL=80,RECFM=FB,BLKSIZE=27920)

