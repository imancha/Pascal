program bintangganjil;
uses crt;

var
   n : integer;
   i : integer;
   j : integer;

begin
     write('Banyak baris bintang : '); readln(n);
     writeln();

     for i:=1 to n do
     begin
          for j:=1 to (2*n-1) do
          begin
               if ((j>n-i) and (j<n+i)) then
               begin
                    write('*');
               end
               else
               begin
                    write(' ');
               end;
          end;
          writeln();
     end;

     for i:=n-1 downto 1 do
     begin
          for j:=1 to (2*n-1) do
          begin
               if ((j>n-i) and (j<n+i)) then
               begin
                    write('*');
               end
               else
               begin
                    write(' ');
               end;
          end;
          writeln();
     end;
     readkey();
end.
