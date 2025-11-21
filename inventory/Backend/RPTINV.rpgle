**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pr LOADALL extpgm('LOADALL'); end-pr;
dcl-pr GENINVRPT extpgm('GENINVRPT'); end-pr;

LOADALL();        // Load all invoices
GENINVRPT();      // Generate invoice detail report

*inlr = *on;
return;
