%{
#include "y.tab.h"
%}

%%
\(     { return LEFTPAREN; }
\)     { return RIGHTPAREN; }
.|\n    { return 0; }
%%
