program bintang;
uses crt;

var
   n : integer;
   i : integer;
   j : integer;

begin
     write('Masukkan Jumlah Baris Bintang : '); readln(n);
     clrscr();

     i := 0;
     j := 0;
     for i:=1 to n do
     begin
          for j:=1 to i do
          begin
               write('*');
          end;
          writeln(); textcolor(i);
     end;
     readkey();
end.
