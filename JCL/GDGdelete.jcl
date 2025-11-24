//JGDGDEL     JOB (99),'BORRAR GDG',CLASS=A,MSGCLASS=Q,MSGLEVEL=(1,1),
//        REGION=0M,NOTIFY=&SYSUID RESTART STEP5
//***********************************************************
//*BORRAR E GDG EXISTENTE Y EL GDG BASE
//**********************************************************
//DLTGDG   EXEC PGM=IDCAMS
//SYSPRINT DD SYSOUT=* 
//SYSIN    DD *
  DELETE (DIRECCION.DE.FICHERO) GDG FORCE
/*


