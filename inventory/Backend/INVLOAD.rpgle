**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pi *n;
   invno char(10);
   custno char(10);
   amount packed(15:2);
   status char(1);
end-pi;

dcl-f INVHDR keyed;

chain invno INVHDR;
if %found(INVHDR);
   custno = CUSTNO;
   amount = AMOUNT;
   status = STATUS;
else;
   custno = *blanks;
   amount = 0;
   status = 'N';
endif;

*inlr = *on;
return;
