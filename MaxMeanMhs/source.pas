program maxmeanmhs;
uses crt;

var
   i : integer;
   maks : integer;
   mean : real;
   jumlah : integer;
   nilai : integer;
   total : integer;

begin
     write('Masukkan Jumlah Mahasiswa : '); readln(jumlah);
     clrscr();

     maks:=0;
     total:=0;
     i:=0;
     while i<jumlah do
     begin
          i:=i+1;
          write('Nilai Mahasiswa ke-',i,' = '); readln(nilai);

          if maks < nilai then
             maks := nilai;

          total:=total+nilai;
     end;

     mean := total/jumlah;

     writeln();
     writeln('Nilai Terbesar adalah = ',maks);
     writeln('Nilai Rata-rata dari ',jumlah,' Mahasiswa adalah = ',mean:0:2);
     readkey();
end.
