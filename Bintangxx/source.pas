program bintangxx;
uses crt;

var
   n,i,j,k : integer;

begin
     write('Nilai : '); readln(n);
     clrscr();

     gotoxy(6,2); write('PANJANG');
     gotoxy(15,2); write('LEBAR');
     gotoxy(23,2); write('LUAS');
     writeln();

     for i:=1 to n do
     begin
          for j:=1 to n do
          begin
               write(i:9);
               write(j:8);
               write(i*j:8);
               writeln();
          end;
     end;
     readkey();
end.
