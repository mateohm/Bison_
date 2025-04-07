%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
int yyerror(const char *s);

%}

%token NUMBER

%%

input:
    | input line
    ;

line:
      '\n'
    | exp '\n' { printf("= %d\n", $1); }
    ;

exp:
      NUMBER
    | exp '+' exp { $$ = $1 + $3; }
    | exp '-' exp { $$ = $1 - $3; }
    | exp '*' exp { $$ = $1 * $3; }
    | exp '/' exp { $$ = $1 / $3; }
    | '(' exp ')' { $$ = $2; }
    ;

%%

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}


int main(void) {
    return yyparse();
}

