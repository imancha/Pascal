program deretfibonacci;
uses crt;

var
   x : integer;
   i : integer;
   n : integer;
   j : integer;
   a : integer;
   b : integer;
   hasil : integer;

begin
     write('Banyak Inputan : '); readln(x);
     clrscr();

     for i:=1 to x do
     begin
          write('Nilai ke-',i,' = '); readln(n);
          writeln();

          a:=0;
          b:=1;
          hasil:=0;
          for j:=0 to n do
          begin
               write(a:5);

               hasil:=hasil+a;

               a:=a+b;
               b:=a-b;
          end;
          writeln(' = ',hasil);
          writeln();
     end;
     readkey();
end.
