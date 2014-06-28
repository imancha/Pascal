program bx;
uses crt;

var
   n : integer;
   i : integer;
   j : integer;

begin
     write('Nilai : '); readln(n);
     writeln();

     for i:=1 to n do
     begin
          for j:=1 to n do
          begin
               if ((j=i) or (j=n-i+1)) then
               begin
                    write('1');
               end
               else
               begin
                    write('0');
               end;
          end;
          writeln();
     end;
     readkey();
end.
