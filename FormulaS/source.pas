program formulas;
uses crt;

var
   i : integer;
   n : integer;
   s : real;

begin
     write('Masukkan Banyak Deret Pecahan : '); readln(n);
     writeln();

     s := 0;

     for i:=1 to n do
     begin
          if i mod 2 = 1 then
          begin
             s:=s+(i/(2*i-1));
          end
          else
          begin
             s:=s-(i/(2*i-1));
          end;
     end;

     writeln();
     write('S = ',s:0:2);

     readkey();
end.
