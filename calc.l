%{
#include "calc.tab.h"  // NO uses y.tab.h
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[\t ]+      ;   // ignora espacios
\n          { return '\n'; }
.           { return yytext[0]; }

