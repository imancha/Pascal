program matrikidentitas;
uses crt;

var
   x : integer;
   i : integer;
   n : integer;
   j : integer;
   k : integer;

begin
     write('Banyak Inputan : '); readln(x);
     clrscr();

     for i:=1 to x do
     begin
          write('Nilai ke-',i,' = '); readln(n);
          writeln();

          for j:=1 to n do
          begin
               for k:=1 to n do
               begin
                    if (j=k) then
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
          writeln();
     end;
     readkey();
end.
