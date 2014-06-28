program ticket;
uses crt;

const
     MaksTiket = 72;

type
    RecordTiket = record
                  kodetujuan : string;
                  tujuan     : string;
                  kodekelas  : integer;
                  kelas      : string;
                  harga      : integer;
                  end;

    DataTiket = array [1..MaksTiket] of RecordTiket;

    RecordIdentitas = record
                      nama   : string;
                      alamat : string;
                      nohape : string;
                      tiket  : DataTiket;
                      end;

    DataIdentitas = array [1..MaksTiket] of RecordIdentitas;

var
   data     : DataIdentitas;
   pilihan  : integer;
   jumlah   : integer;
   tambah   : integer;
   CEks,CBis,CEko : integer;
   BEks,BBis,BEko : integer;
   JEks,JBis,JEko : integer;

   procedure Header;                                                                           {Header/Judul Tabel}
   begin
        gotoxy(2,1);textbackground(MAGENTA);write('    ');
        gotoxy(7,1);textbackground(MAGENTA);write('              ');
        gotoxy(22,1);textbackground(MAGENTA);write('            ');
        gotoxy(35,1);textbackground(MAGENTA);write('            ');
        gotoxy(48,1);textbackground(MAGENTA);write('          ');
        gotoxy(59,1);textbackground(MAGENTA);write('           ');
        gotoxy(71,1);textbackground(MAGENTA);write('         ');
        gotoxy(3,1);textcolor(WHITE);write('NO');
        gotoxy(12,1);textcolor(WHITE);write('NAMA');
        gotoxy(25,1);textcolor(WHITE);write('ALAMAT');
        gotoxy(38,1);textcolor(WHITE);write('NO. HP');
        gotoxy(50,1);textcolor(WHITE);write('TUJUAN');
        gotoxy(62,1);textcolor(WHITE);write('KELAS');
        gotoxy(73,1);textcolor(WHITE);write('HARGA');
   end;

   procedure Baris(banyak:integer);                                                           {Baris Tabel}
   var
      bbaris:integer;

   begin
        for bbaris:=2 to banyak+1 do
        begin
             if bbaris mod 2 = 0 then
             begin
                  gotoxy(2,bbaris);textbackground(CYAN);write('    ');
                  gotoxy(7,bbaris);textbackground(CYAN);write('              ');
                  gotoxy(22,bbaris);textbackground(CYAN);write('            ');
                  gotoxy(35,bbaris);textbackground(CYAN);write('            ');
                  gotoxy(48,bbaris);textbackground(CYAN);write('          ');
                  gotoxy(59,bbaris);textbackground(CYAN);write('           ');
                  gotoxy(71,bbaris);textbackground(CYAN);write('         ');
             end
             else
             begin
                  gotoxy(2,bbaris);textbackground(GREEN);write('    ');
                  gotoxy(7,bbaris);textbackground(GREEN);write('              ');
                  gotoxy(22,bbaris);textbackground(GREEN);write('            ');
                  gotoxy(35,bbaris);textbackground(GREEN);write('            ');
                  gotoxy(48,bbaris);textbackground(GREEN);write('          ');
                  gotoxy(59,bbaris);textbackground(GREEN);write('           ');
                  gotoxy(71,bbaris);textbackground(GREEN);write('         ');
             end;
        end;
   end;

   procedure Kotak(awalkolom,awalbaris,akhirkolom,akhirbaris:integer; latar,tulisan:byte);      {Kotak Menu}
   var
      i : integer;

   begin
        textcolor(tulisan);textbackground(latar);
        window(awalkolom,awalbaris,akhirkolom,akhirbaris);clrscr;window(1,1,80,25);
        gotoxy(awalkolom,awalbaris);write(#218);
        gotoxy(akhirkolom,awalbaris);write(#191);
        gotoxy(akhirkolom,akhirbaris);write(#217);
        gotoxy(awalkolom,akhirbaris);write(#192);

        for i:=awalkolom+1 to akhirkolom-1 do
        begin
             gotoxy(i,awalbaris);write(#196);
             gotoxy(i,akhirbaris);write(#196);
        end;

        for i:=awalbaris+1 to akhirbaris-1 do
        begin
             gotoxy(akhirkolom,i);write(#179);
             gotoxy(awalkolom,i);write(#179);
        end;
   end;

   procedure Menu(var pilihan:integer);
   var
      i:integer;

   begin
        clrscr();
        Kotak(22,6,58,20,YELLOW,WHITE);
        gotoxy(28,7); writeln('MENU PENJUALAN TIKET BIS');
        gotoxy(23,8); for i:=1 to 35 do write(#196);
        gotoxy(30,9); writeln('1. Lihat Harga Tiket');
        gotoxy(30,10); writeln('2. Beli Tiket');
        gotoxy(30,11); writeln('3. Lihat Data Tiket');
        gotoxy(30,12); writeln('4. Ubah Data Tiket');
        gotoxy(30,13); writeln('5. Cari Data Tiket');
        gotoxy(30,14); writeln('6. Urut Data Tiket');
        gotoxy(30,15); writeln('7. Hapus Data Tiket');
        gotoxy(30,16); writeln('8. Lihat Semua Data');
        gotoxy(30,17); writeln('9. Keluar');
        gotoxy(23,18); for i:=1 to 35 do write(#196);
        gotoxy(34,19); write('Pilihan : '); readln(pilihan);
   end;

   procedure LihatHargaTiket;
   begin
        clrscr();
        write('--------------------------------------------------------------------------------');
        write('                               PENJUALAN TIKET BUS                              ');
        write('--------------------------------------------------------------------------------');
        write(' KODE TUJUAN |  TUJUAN  | KODE KELAS |   KELAS   | KUOTA | TERSEDIA | HARGA(Rp) ');
        write('--------------------------------------------------------------------------------');
        write('             |          |     1      | EKSEKUTIF |   8   |     ',CEks,'    |  100.000  ');
        write('     CRB     | CIREBON  |     2      | BISNIS    |   8   |     ',CBis,'    |   80.000  ');
        write('             |          |     3      | EKONOMI   |   8   |     ',CEko,'    |   45.000  ');
        write('--------------------------------------------------------------------------------');
        write('             |          |     1      | EKSEKUTIF |   8   |     ',BEks,'    |  150.000  ');
        write('     BDG     | BANDUNG  |     2      | BISNIS    |   8   |     ',BBis,'    |  100.000  ');
        write('             |          |     3      | EKONOMI   |   8   |     ',BEko,'    |   80.000  ');
        write('--------------------------------------------------------------------------------');
        write('             |          |     1      | EKSEKUTIF |   8   |     ',JEks,'    |  200.000  ');
        write('     JKT     | JAKARTA  |     2      | BISNIS    |   8   |     ',JBis,'    |  150.000  ');
        write('             |          |     3      | EKONOMI   |   8   |     ',JEko,'    |  100.000  ');
        write('--------------------------------------------------------------------------------');
        readkey();
   end;

   procedure BeliTiket(var Detail:DataIdentitas);
   var
      i,x:integer;

   begin
        clrscr();
        Kotak(16,12,64,14,CYAN,WHITE);
        gotoxy(19,13); write('Masukkan Jumlah Tiket Yang Akan Dibeli : '); readln(tambah);

        jumlah:=jumlah+tambah;
        tambah:=(jumlah-tambah)+1;

        for i:=tambah to jumlah do
        begin
             clrscr();
             Kotak(2,2,39,24,CYAN,WHITE);
             gotoxy(9,3); writeln('Input Data Pembeli Ke-',i);
             gotoxy(6,4); for x:=1 to 30 do write(#196); writeln(); writeln();
             gotoxy(5,whereY); write('Nama        : '); readln(Detail[i].nama);
             gotoxy(5,whereY); write('Alamat      : '); readln(Detail[i].alamat);
             gotoxy(5,whereY); write('No. HP      : '); readln(Detail[i].nohape);
             repeat
                   gotoxy(5,whereY); write('Kode Tujuan : '); readln(Detail[i].tiket[i].kodetujuan);
                   Detail[i].tiket[i].kodetujuan:=upcase(Detail[i].tiket[i].kodetujuan);
             until((Detail[i].tiket[i].kodetujuan='CRB') or (Detail[i].tiket[i].kodetujuan='BDG') or (Detail[i].tiket[i].kodetujuan='JKT'));

             if(Detail[i].tiket[i].kodetujuan = 'CRB') then Detail[i].tiket[i].tujuan := 'Cirebon'
             else if(Detail[i].tiket[i].kodetujuan = 'BDG') then Detail[i].tiket[i].tujuan:= 'Bandung'
             else if(Detail[i].tiket[i].kodetujuan = 'JKT') then Detail[i].tiket[i].tujuan := 'Jakarta';

             repeat
                   gotoxy(5,whereY); write('Kode Kelas  : '); readln(Detail[i].tiket[i].kodekelas);
             until((Detail[i].tiket[i].kodekelas>0) and (Detail[i].tiket[i].kodekelas<4));

             case Detail[i].tiket[i].kodekelas of
                  1 : Detail[i].tiket[i].kelas := 'Eksekutif';
                  2 : Detail[i].tiket[i].kelas := 'Bisnis';
                  3 : Detail[i].tiket[i].kelas := 'Ekonomi';
             end;

             if(Detail[i].tiket[i].kodetujuan = 'CRB') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then Detail[i].tiket[i].harga:=100000
                  else if(Detail[i].tiket[i].kodekelas=2) then Detail[i].tiket[i].harga:=80000
                  else if(Detail[i].tiket[i].kodekelas=3) then Detail[i].tiket[i].harga:=45000;
             end
             else if(Detail[i].tiket[i].kodetujuan = 'BDG') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then Detail[i].tiket[i].harga:=150000
                  else if(Detail[i].tiket[i].kodekelas=2) then Detail[i].tiket[i].harga:=100000
                  else if(Detail[i].tiket[i].kodekelas=3) then Detail[i].tiket[i].harga:=80000;
             end
             else if(Detail[i].tiket[i].kodetujuan = 'JKT') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then Detail[i].tiket[i].harga:=200000
                  else if(Detail[i].tiket[i].kodekelas=2) then Detail[i].tiket[i].harga:=150000
                  else if(Detail[i].tiket[i].kodekelas=3) then Detail[i].tiket[i].harga:=100000;
             end;

             if(Detail[i].tiket[i].kodetujuan = 'CRB') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then CEks:=CEks-1
                  else if(Detail[i].tiket[i].kodekelas=2) then CBis:=CBis-1
                  else if(Detail[i].tiket[i].kodekelas=3) then CEko:=CEko-1;
             end
             else if(Detail[i].tiket[i].kodetujuan = 'BDG') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then BEks:=BEks-1
                  else if(Detail[i].tiket[i].kodekelas=2) then BBis:=BBis-1
                  else if(Detail[i].tiket[i].kodekelas=3) then BEko:=BEko-1;
             end
             else if(Detail[i].tiket[i].kodetujuan = 'JKT') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then JEks:=JEks-1
                  else if(Detail[i].tiket[i].kodekelas=2) then JBis:=JBis-1
                  else if(Detail[i].tiket[i].kodekelas=3) then JEko:=JEko-1;
             end;

             Kotak(41,2,79,24,YELLOW,WHITE);
             gotoxy(48,3); writeln('Output Data Pembeli Ke-',i);
             gotoxy(45,4); for x:=1 to 30 do write(#196); writeln(); writeln();
             gotoxy(44,6); writeln('Nama   : ',Detail[i].nama);
             gotoxy(44,8); writeln('Alamat : ',Detail[i].alamat);
             gotoxy(44,10); writeln('No. HP : ',Detail[i].nohape);
             gotoxy(44,12); writeln('Tujuan : ',Detail[i].tiket[i].tujuan);
             gotoxy(44,14); writeln('Kelas  : ',Detail[i].tiket[i].kelas);
             gotoxy(44,16); writeln('Harga  : ',Detail[i].tiket[i].harga);
             readkey();
        end;
   end;

   procedure LihatDataTiket(var Detail:DataIdentitas);
   var
      i:integer;

   begin
        clrscr();
        Header;
        Baris(jumlah);
        for i:=tambah to jumlah do
        begin
             gotoxy(3,i+1); write(i);
             gotoxy(8,i+1); write(Detail[i].nama);
             gotoxy(23,i+1); write(Detail[i].alamat);
             gotoxy(36,i+1); write(Detail[i].nohape);
             gotoxy(49,i+1); write(Detail[i].tiket[i].tujuan);
             gotoxy(60,i+1); write(Detail[i].tiket[i].kelas);
             gotoxy(72,i+1); writeln(Detail[i].tiket[i].harga);
        end;
        readkey();
   end;

   procedure LihatSemuaDataTiket(var Detail:DataIdentitas);
   var
      i:integer;

   begin
        clrscr();
        Header;
        Baris(jumlah);
        for i:=1 to jumlah do
        begin
             if(Detail[i].tiket[i].kodetujuan = 'CRB') then Detail[i].tiket[i].tujuan := 'Cirebon'
             else if(Detail[i].tiket[i].kodetujuan = 'BDG') then Detail[i].tiket[i].tujuan:= 'Bandung'
             else if(Detail[i].tiket[i].kodetujuan = 'JKT') then Detail[i].tiket[i].tujuan := 'Jakarta';

             case Detail[i].tiket[i].kodekelas of
                  1 : Detail[i].tiket[i].kelas := 'Eksekutif';
                  2 : Detail[i].tiket[i].kelas := 'Bisnis';
                  3 : Detail[i].tiket[i].kelas := 'Ekonomi';
             end;

             if(Detail[i].tiket[i].kodetujuan = 'CRB') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then Detail[i].tiket[i].harga:=100000
                  else if(Detail[i].tiket[i].kodekelas=2) then Detail[i].tiket[i].harga:=80000
                  else if(Detail[i].tiket[i].kodekelas=3) then Detail[i].tiket[i].harga:=45000;
             end
             else if(Detail[i].tiket[i].kodetujuan = 'BDG') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then Detail[i].tiket[i].harga:=150000
                  else if(Detail[i].tiket[i].kodekelas=2) then Detail[i].tiket[i].harga:=100000
                  else if(Detail[i].tiket[i].kodekelas=3) then Detail[i].tiket[i].harga:=80000;
             end
             else if(Detail[i].tiket[i].kodetujuan = 'JKT') then
             begin
                  if(Detail[i].tiket[i].kodekelas=1) then Detail[i].tiket[i].harga:=200000
                  else if(Detail[i].tiket[i].kodekelas=2) then Detail[i].tiket[i].harga:=150000
                  else if(Detail[i].tiket[i].kodekelas=3) then Detail[i].tiket[i].harga:=100000;
             end;

             gotoxy(3,i+1); write(i);
             gotoxy(8,i+1); write(Detail[i].nama);
             gotoxy(23,i+1); write(Detail[i].alamat);
             gotoxy(36,i+1); write(Detail[i].nohape);
             gotoxy(49,i+1); write(Detail[i].tiket[i].tujuan);
             gotoxy(60,i+1); write(Detail[i].tiket[i].kelas);
             gotoxy(72,i+1); write(Detail[i].tiket[i].harga);
        end;
        readkey();
   end;

   procedure UbahDataTiket(var Detail:DataIdentitas);
   var
      i,x:integer;

   begin
        LihatSemuaDataTiket(data);
        repeat
              clrscr();
              Kotak(16,12,64,14,CYAN,WHITE);
              gotoxy(19,13); write('Indeks Data Yang Ingin Dirubah : '); readln(i);
        until(i<=jumlah);

        clrscr();
        Kotak(41,2,79,24,YELLOW,WHITE);
        gotoxy(48,3); writeln('Output Data Pembeli Ke-',i);
        gotoxy(45,4); for x:=1 to 30 do write(#196); writeln(); writeln();
        gotoxy(44,6); writeln('Nama   : ',Detail[i].nama);
        gotoxy(44,8); writeln('Alamat : ',Detail[i].alamat);
        gotoxy(44,10); writeln('No. HP : ',Detail[i].nohape);
        gotoxy(44,12); writeln('Tujuan : ',Detail[i].tiket[i].tujuan);
        gotoxy(44,14); writeln('Kelas  : ',Detail[i].tiket[i].kelas);
        gotoxy(44,16); writeln('Harga  : ',Detail[i].tiket[i].harga);
        readkey();

        clrscr();
        Kotak(2,2,39,24,CYAN,WHITE);
        gotoxy(9,3); writeln('Input Data Pembeli Ke-',i);
        gotoxy(6,4); for x:=1 to 30 do write(#196); writeln(); writeln();
        gotoxy(5,whereY); write('Nama        : '); readln(Detail[i].nama);
        gotoxy(5,whereY); write('Alamat      : '); readln(Detail[i].alamat);
        gotoxy(5,whereY); write('No. HP      : '); readln(Detail[i].nohape);

        Kotak(41,2,79,24,YELLOW,WHITE);
        gotoxy(48,3); writeln('Output Data Pembeli Ke-',i);
        gotoxy(45,4); for x:=1 to 30 do write(#196); writeln(); writeln();
        gotoxy(44,6); writeln('Nama   : ',Detail[i].nama);
        gotoxy(44,8); writeln('Alamat : ',Detail[i].alamat);
        gotoxy(44,10); writeln('No. HP : ',Detail[i].nohape);
        gotoxy(44,12); writeln('Tujuan : ',Detail[i].tiket[i].tujuan);
        gotoxy(44,14); writeln('Kelas  : ',Detail[i].tiket[i].kelas);
        gotoxy(44,16); writeln('Harga  : ',Detail[i].tiket[i].harga);
        readkey();
   end;

   procedure CariDataIndeks(var Detail:DataIdentitas);
   var
      cari,i,x:integer;

   begin
        clrscr();
        Kotak(16,12,64,14,CYAN,WHITE);
        gotoxy(19,13); write('Masukkan Indeks Data Yang Dicari : '); readln(cari);

        i:=0;
        while((i<>cari) and (i<jumlah)) do i:=i+1;

        clrscr();
        Kotak(8,5,73,21,YELLOW,WHITE);
        gotoxy(30,6); writeln('Data Tiket Pembeli Ke-',cari);
        gotoxy(26,7); for x:=1 to 31 do write(#196);

        if(i=cari) then
        begin
             gotoxy(26,9); writeln('Nama   : ',Detail[i].nama);
             gotoxy(26,11); writeln('Alamat : ',Detail[i].alamat);
             gotoxy(26,13); writeln('No. HP : ',Detail[i].nohape);
             gotoxy(26,15); writeln('Tujuan : ',Detail[i].tiket[i].tujuan);
             gotoxy(26,17); writeln('Kelas  : ',Detail[i].tiket[i].kelas);
             gotoxy(26,19); writeln('Harga  : ',Detail[i].tiket[i].harga);
        end
        else
        begin
             gotoxy(31,14); writeln('Data Tidak Ditemukan');
        end;
        readkey();
   end;

   procedure CariDataNama(var Detail:DataIdentitas);
   var
      nama:string;
      i,x:integer;

   begin
        clrscr();
        Kotak(16,12,64,14,CYAN,WHITE);
        gotoxy(19,13); write('Masukkan Nama Yang Ingin Dicari : '); readln(nama);

        for i:=1 to jumlah do
        begin
             if(Detail[i].nama=nama) then
             begin
                  clrscr();
                  Kotak(8,5,73,21,YELLOW,WHITE);
                  gotoxy(30,6); writeln('Data Tiket Pembeli Ke-',i);
                  gotoxy(26,7); for x:=1 to 31 do write(#196);
                  gotoxy(26,9); writeln('Nama   : ',Detail[i].nama);
                  gotoxy(26,11); writeln('Alamat : ',Detail[i].alamat);
                  gotoxy(26,13); writeln('No. HP : ',Detail[i].nohape);
                  gotoxy(26,15); writeln('Tujuan : ',Detail[i].tiket[i].tujuan);
                  gotoxy(26,17); writeln('Kelas  : ',Detail[i].tiket[i].kelas);
                  gotoxy(26,19); writeln('Harga  : ',Detail[i].tiket[i].harga);
                  readkey();
             end;
        end;
        clrscr();
        readkey();
   end;

   procedure CariDataTiket;
   var
      x:integer;

   begin
        repeat
              clrscr();
              Kotak(20,9,60,17,YELLOW,WHITE);
              gotoxy(29,10); writeln('MENU PENCARIAN TIKET BIS');
              gotoxy(21,11); for x:=1 to 39 do write(#196);
              gotoxy(25,12); writeln('1. Cari Data Berdasarkan Indeks');
              gotoxy(25,13); writeln('2. Cari Data Berdasarkan Nama');
              gotoxy(25,14); writeln('3. Kembali Ke Menu Utama');
              gotoxy(21,15); for x:=1 to 39 do write(#196);
              gotoxy(34,16); write('Pilihan : '); readln(pilihan);
              case pilihan of
                   1: CariDataIndeks(data);
                   2: CariDataNama(data);
              end;
        until(pilihan=3);
   end;

   procedure Sorting(i,j:integer; var Detail:DataIdentitas);
   var
      temp:string;
      temo:integer;

   begin
        temp:=Detail[j].nama;
        Detail[j].nama:=Detail[i].nama;
        Detail[i].nama:=temp;

        temp:=Detail[j].alamat;
        Detail[j].alamat:=Detail[i].alamat;
        Detail[i].alamat:=temp;

        temp:=Detail[j].nohape;
        Detail[j].nohape:=Detail[i].nohape;
        Detail[i].nohape:=temp;

        temp:=Detail[j].tiket[j].kodetujuan;
        Detail[j].tiket[j].kodetujuan:=Detail[i].tiket[i].kodetujuan;
        Detail[i].tiket[i].kodetujuan:=temp;

        temo:=Detail[j].tiket[j].kodekelas;
        Detail[j].tiket[j].kodekelas:=Detail[i].tiket[i].kodekelas;
        Detail[i].tiket[i].kodekelas:=temo;

        temo:=Detail[j].tiket[j].harga;
        Detail[j].tiket[j].harga:=Detail[i].tiket[i].harga;
        Detail[i].tiket[i].harga:=temo;
   end;

   procedure UrutDataTujuan(Detail:DataIdentitas);
   var
      i,j:integer;

   begin
        LihatSemuaDataTiket(data);

        for i:=1 to jumlah do
        begin
             for j:=i to jumlah do
             begin
                  if((Detail[j].tiket[j].kodetujuan) < (Detail[i].tiket[i].kodetujuan)) then Sorting(i,j,data);
             end;
        end;

        LihatSemuaDataTiket(data);
   end;

   procedure UrutDataKelas(Detail:DataIdentitas);
   var
      i,j:integer;

   begin
        LihatSemuaDataTiket(data);

        for i:=1 to jumlah do
        begin
             for j:=i to jumlah do
             begin
                  if((Detail[j].tiket[j].kodekelas) < (Detail[i].tiket[i].kodekelas)) then Sorting(i,j,data);
             end;
        end;

        LihatSemuaDataTiket(data);
   end;

   procedure UrutDataHarga(Detail:DataIdentitas);
   var
      i,j:integer;

   begin
        LihatSemuaDataTiket(data);

        for i:=1 to jumlah do
        begin
             for j:=i to jumlah do
             begin
                  if((Detail[j].tiket[j].harga) > (Detail[i].tiket[i].harga)) then Sorting(i,j,data);
             end;
        end;

        LihatSemuaDataTiket(data);
   end;

   procedure UrutDataTiket;
   var
      x:integer;
   begin
        repeat
              clrscr();
              Kotak(20,8,60,17,YELLOW,WHITE);
              gotoxy(29,9); writeln('MENU PENGURUTAN TIKET BIS');
              gotoxy(21,10); for x:=1 to 39 do write(#196);
              gotoxy(25,11); writeln('1. Urut Data Berdasarkan Tujuan');
              gotoxy(25,12); writeln('2. Urut Data Berdasarkan Kelas');
              gotoxy(25,13); writeln('3. Urut Data Berdasarkan Harga');
              gotoxy(25,14); writeln('4. Kembali Ke Menu Utama');
              gotoxy(21,15); for x:=1 to 39 do write(#196);
              gotoxy(34,16); write('Pilihan : '); readln(pilihan);
              case pilihan of
                   1: UrutDataTujuan(data);
                   2: UrutDataKelas(data);
                   3: UrutDataHarga(data);
              end;
        until(pilihan=4);
   end;

   procedure HapusDataTiket(var Detail:DataIdentitas);
   var
      i:integer;
      hapus:integer;

   begin
        clrscr();
        LihatSemuaDataTiket(data);
        repeat
              clrscr();
              Kotak(16,12,64,14,CYAN,WHITE);
              gotoxy(19,13); write('Masukkan Indeks Data Yang Ingin Dihapus : '); readln(hapus);
        until(hapus<=jumlah);

        for i:=1 to jumlah do
        begin
             if(i>=hapus) then
             begin
                  Detail[i].nama  := Detail[i+1].nama;
                  Detail[i].alamat := Detail[i+1].alamat;
                  Detail[i].nohape := Detail[i+1].nohape;
                  Detail[i].tiket[i].kodetujuan := Detail[i+1].tiket[i+1].kodetujuan;
                  Detail[i].tiket[i].kodekelas  := Detail[i+1].tiket[i+1].kodekelas;
             end;
        end;
        jumlah:=jumlah-1;
        LihatSemuaDataTiket(data);
   end;

begin
     CEks := 8;
     CBis := 8;
     CEko := 8;
     BEks := 8;
     BBis := 8;
     BEko := 8;
     JEks := 8;
     JBis := 8;
     JEko := 8;
     repeat
           Menu(pilihan);
           case pilihan of
                1: LihatHargaTiket;
                2: BeliTiket(data);
                3: LihatDataTiket(data);
                4: UbahDataTiket(data);
                5: CariDataTiket;
                6: UrutDataTiket;
                7: HapusDataTiket(data);
                8: LihatSemuaDataTiket(data);
           end;
     until(pilihan=9);
end.
