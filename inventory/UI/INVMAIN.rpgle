**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pr INVLOAD extpgm('INVLOAD');
   invno char(10);
   custno char(10);
   amount packed(15:2);
   status char(1);
end-pr;

dcl-pr INVPROC extpgm('INVPROC'); end-pr;

dcl-f INVMAIN workstn;

dcl-s invno char(10);
dcl-s custno char(10);
dcl-s amount packed(15:2);
dcl-s status char(1);

dow not *in03;
   exfmt MAINSCR;
   // If user entered an invoice number, load and process
   if invno <> *blanks;
      INVLOAD(invno : custno : amount : status);
      INVPROC(invno);
   endif;
enddo;

*inlr = *on;
return;
