program bmirror;
uses crt;

var
   n : integer;
   i : integer;
   j : integer;

begin
     write('Nilai : '); readln(n);

     for i:=1 to n do
     begin
          for j:=0 to n+1 do
          begin
               if (j=i) then
               begin
                    write(' ');
               end
               else
               begin
                    write('*');
               end;
          end;
          writeln();
     end;
     readkey();
end.
