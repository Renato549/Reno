  //PROG3JOB JOB(ACCT),'IBMUSER', NOTIFY=&SYSUID,
  //           CLASS=A,MSGCLASS=J,MSGLEVEL=(1,1), REGION=0M
  //STEP01 EXEC PGM=PROG3,PARM='LIB,APOST,XREF,MAP,OFFSET'
  //STEPLIB DD DSN=ADCD.Z110.VTAMLIB,DISP=SHR
  //*---------------------------------------------------------
  //*SYSIN  libreria de programas fuentes
  //*SYSLMOD libreria de objetos ejecutables
  //*---------------------------------------------------------
  //SYSOUT DD SYSOUT=*
  //SYSPRINT DD SYSOUT=*

