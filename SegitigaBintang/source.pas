program segitigabintang;
uses crt;

var
   n : integer;
   i : integer;
   j : integer;

begin
     write('Masukkan Jumlah Baris Segitiga Bintang : '); readln(n);
     clrscr();

     i := 0;
     j := 0;
     for i:=1 to n do
     begin
          for j:=1 to i do
          begin
               write('*');
          end;
          writeln(''); textcolor(i);
     end;

     for i:=n-1 downto 1 do
     begin
          for j:=1 to i do
          begin
               write('*');
          end;
          writeln(''); textcolor(j);
     end;
     readkey();
end.
