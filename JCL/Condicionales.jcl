//JIDCAMS2     JOB (),' ',CLASS=A,MSGCLASS=Q,MSGLEVEL=(1,1),
//        REGION=0M,NOTIFY=&SYSUID RESTART STEP5
//***********************************************************
//*cOMPROBAR SI UN FICHERO EXISTE
//**********************************************************
//STEP1   EXEC PGM=IDCAMS
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=* 
//SYSIN    DD *
  LISTCAT ENTRIES (DIRECCION.DE.FICHERO) ALL
  IF LASTCC NE 0 THEN DO
          SET MAXCC=4
          END
//*
//*********************************************************
//*COPIAR FICHERO SI NO ESTA VACIO
//********************************************************* 
//COND1    IF ( STEP01.RC > 0 ) THEN
//*NO EJECUTA BLOQUE COND1 PORQUE EL FICHERO NO EXISTE
//COND1    ELSE    
//STEP005  EXEC PGM=IDCAMS
//SYSOUT   DD SYSOUT=*
//SORTIN   DD DSN=DIRECCION.DE.FICHERO.ENTRADA,DISP=SHR
//SORTOUT  DD DSN=DIRECCION.DE.FICHERO.SALIDA,
//            DISP=(,CATLG),
//            SPACE=(TRK,(10,5),RLSE)
//SYSIN    DD *
  SORT FIELDS=COPY
//*
//COND1    ENDIF
