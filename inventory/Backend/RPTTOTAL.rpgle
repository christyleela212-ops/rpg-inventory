**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pr LOADSUMMARY extpgm('LOADSUMMARY'); end-pr;
dcl-pr GENTOTALRPT extpgm('GENTOTALRPT'); end-pr;

LOADSUMMARY();     // Load aggregated totals
GENTOTALRPT();     // Generate summary/totals report

*inlr = *on;
return;
