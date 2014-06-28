program bintangkanan;
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
                    if (k>n-j) then
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
          writeln();
     end;
     readkey();
end.
