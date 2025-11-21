**free
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-pi *n;
   invno char(10);
end-pi;

dcl-f INVHDR keyed;
dcl-f INVPRT printer;

chain invno INVHDR;
if %found;
   // Map fields to print file record - field names in DDS must match or use descriptors
   write PRINTREC;
endif;

*inlr = *on;
return;
