**free
ctl-opt dftactgrp(*no) option(*srcstmt);

exec sql declare c1 cursor for select CUSTNO from MYLIB.CUSTMAS where STATUS='A';
exec sql open c1;
loop1:
 exec sql fetch c1 into :custno;
 if sqlcode <> 0; leave loop1; endif;
 // call external
 resp = GET('https://api.example.com/customers/' + %trim(custno));
 exec sql update MYLIB.CUSTMAS set STATUS='S' where CUSTNO = :custno;
endloop;
exec sql close c1;
*inlr=*on; return;
