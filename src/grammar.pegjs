//checked on pegjs.org and all is correct

arithmetic_expression
  = _ left:mult_term _ option:addop _ right:arithmetic_expression _
  {return left + parseInt(option + right);}
  / mult_term
mult_term
  = _ left:primary _ option:mulop _ right:mult_term _
  {return parseInt(left*right);}
  / primary 
primary
  = _ left:"(" _ options:arithmetic_expression right:")" _
  {return options;}
  / integer
integer
  = signs:("+"/"-") right:digits
	{return (signs=="-"?-digits:digits);}
    /digits
digits
  = left:("0" / "1" / "2" / "3" / "4" / "5" / "6" / "7" / "8" / "9")*
  {return parseInt(left.join(""), 10);}
addop
  = left:("+" / "-")
  {return left;}
mulop
  = left:("*" / "/")
  {return left;}
  
  _ "whitespace"
  = [ \t\n\r]*