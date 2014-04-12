%{
#include "parser.h"
%}

dec				[0-9]+
hex				[0-9][0-9a-fA-F]*[H|h]
whitespace		[\n\t ]
id				[a-zA-Z][a-zA-Z0-9_]*
comment			\/\*[^(\/\*)]*\*\/

%%

{hex}			return num_;
{dec}			return num_;

":"				return ':';
"("				return '(';
")"				return ')';
";"				return ';';
"="				return '=';
"."				return '.';
"-"				return '-';
"+"				return '+';
"*"				return '*';
">"				return '>';
"<>"			return uneq_;
","				return ',';

struct	 		return struct_;
end 			return end_;
func 			return func_;
return 			return return_;
with 			return with_;
do 				return do_;
let 			return let_;
in 				return in_;
cond 			return cond_;
then 			return then_;
not 			return not_;
or 				return or_;
id 				return id_;
num 			return num_;

{id}			return id_ ;
{whitespace}	;
{comment}		;
.				printf("Lexical error.\n");exit(1);
