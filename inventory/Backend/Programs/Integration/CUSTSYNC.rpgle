**free
ctl-opt dftactgrp(*no) option(*srcstmt);

/* Variables */
dcl-s custno   char(10);
dcl-s resp     varchar(1024);

/* Declare cursor */
exec sql
  declare c1 cursor for
    select CUSTNO
      from MYLIB.CUSTMAS
     where STATUS = 'A';

/* Open cursor */
exec sql open c1;

/* Loop through active customers */
dou sqlcode <> 0;

  exec sql fetch c1 into :custno;

  /* Exit loop when no more records */
  if sqlcode <> 0;
     leave;
  endif;

  /* External REST API call */
  resp = GET('https://api.example.com/customers/' + %trim(custno));

  /* Update sync status */
  exec sql
    update MYLIB.CUSTMAS
       set STATUS = 'S'
     where CUSTNO = :custno;

enddo;

/* Close cursor */
exec sql close c1;

*inlr = *on;
return;
