program meanmaxmhs;
uses crt;

var
   i     : integer;
   lagi  : char;
   nilai : real;
   maks  : real;
   total : real;
   rata  : real;

begin
     i := 0;
     maks := 0;
     total := 0;
     lagi := 'Y';

     while lagi = 'Y' do
     begin
          i := i+1;
          write('Nilai Mahasiswa ke-',i,' : '); readln(nilai);

          if maks < nilai then
             maks := nilai;

          write('Tekan Y untuk Input Nilai lagi : '); readln(lagi);
          lagi := upcase(lagi);

          total := total+nilai;
     end;

     rata := total/i;

     writeln();
     writeln('Banyaknya Mahasiswa adalah = ',i);
     writeln('Nilai Terbesar Mahasiswa adalah = ',maks:0:2);
     writeln('Total Semua Nilai Mahasiswa adalah = ',total:0:2);
     writeln('Rata-Rata Nilai Semua Mahasiswa adalah = ',rata:0:2);

     readkey();
end.
