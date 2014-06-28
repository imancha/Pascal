program segitigapascal;
uses crt;

var
   n : integer;
   i : integer;
   j : integer;
   a : real;

begin
     write('Nilai : '); readln(n);
     writeln();

     for i:=0 to n-1 do
     begin
          for j:=0 to i do
          begin
               if ((j=0) or (i=j)) then
               begin
                    a:=1;
               end
               else
               begin
                    a:=a*((i+1-j)/j);
               end;
               write(' ',a:0:0);
          end;
          writeln();
     end;
     readkey();
end.
