**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f RPTMENU workstn;

dcl-pr RPTINV extpgm('RPTINV'); end-pr;
dcl-pr RPTTOTAL extpgm('RPTTOTAL'); end-pr;

dcl-s option char(1);

dow not *in03;
   exfmt RPTSCR;
   select;
      when option = '1'; RPTINV();
      when option = '2'; RPTTOTAL();
      other;
   endsl;
enddo;

*inlr = *on;
return;
