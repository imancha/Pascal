program deretbilanganganjil;
uses crt;

var
   x      : integer;
   akhir  : integer;
   jumlah : integer;

begin
     write('Masukkan batas akhir angka : '); readln(akhir);
     writeln();

     jumlah := 0;
     for x:=1 to akhir do
     begin
          if x mod 2 = 1 then
             jumlah := jumlah + x;
     end;

     write('Jumlah Deret Bilangan Ganjil dari 1 sampai ',akhir,' = ',jumlah);
     readkey();
end.
