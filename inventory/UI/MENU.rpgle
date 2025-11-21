**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f MENU workstn;

dcl-pr INVMAIN extpgm('INVMAIN'); end-pr;
dcl-pr RPTMENU extpgm('RPTMENU'); end-pr;

dcl-s option char(1);

dow not *in03;
   exfmt MENUSCR;
   select;
      when option = '1'; INVMAIN();
      when option = '2'; RPTMENU();
      other; // ignore unknown
   endsl;
enddo;

*inlr = *on;
return;
