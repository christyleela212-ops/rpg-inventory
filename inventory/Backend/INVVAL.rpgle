**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pi *n;
   invno char(10);
end-pi;

if invno = *blanks;
   dsply 'Invoice number missing';
endif;

*inlr = *on;
return;
