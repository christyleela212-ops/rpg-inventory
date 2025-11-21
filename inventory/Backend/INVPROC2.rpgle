**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pr INVCHK extpgm('INVCHK'); end-pr;
dcl-pr INVFLOW extpgm('INVFLOW'); end-pr;

INVCHK();
INVFLOW();

*inlr = *on;
return;
