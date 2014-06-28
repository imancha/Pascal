program sformula;
uses crt;

var
   n,i : integer;
   s,hasil,h : real;
   satu : string;

begin
     readln(n);

     satu := 'S = 1';

     if n=1 then
     begin
          write(satu);
     end
     else
     begin
          for i:=2 to n do
          begin
               if i mod 2=1 then
               begin
                    s:=s+(i/(2*i-1));
               end
               else
               begin
                    s:=s-(i/(2*i-1));
               end;
          hasil:=1+s;
          end;
     write(hasil:0:3);
     end;
     readkey();
end.
