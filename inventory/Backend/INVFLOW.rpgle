**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pr INVAUD extpgm('INVAUD'); end-pr;

// Pretend workflow logic
INVAUD();

dsply 'Invoice Workflow Completed';

*inlr = *on;
return;
