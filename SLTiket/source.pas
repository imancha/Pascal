program sltiket;
uses crt;

type
    DTiket = ^RTiket;
    RTiket = record
             nokursi    : integer;
             nama       : string[18];
             alamat     : string[14];
             nohape     : string[12];
             kodetujuan : string;
             tujuan     : string;
             kodekelas  : integer;
             kelas      : string;
             harga      : integer;
             next       : DTiket;
             end;

var
   data,awal,akhir : DTiket;
   pilihan : integer;

   {Interface}
   procedure Kotak(awalkolom,awalbaris,akhirkolom,akhirbaris:integer; latar,tulisan:byte);      //Kotak Menu
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

   procedure Header;
   begin
        gotoxy(2,1);textbackground(CYAN);write(' NO ');
        gotoxy(7,1);textbackground(CYAN);write('       NAMA       ');
        gotoxy(26,1);textbackground(CYAN);write('    ALAMAT    ');
        gotoxy(41,1);textbackground(CYAN);write('   NO. HP   ');
        gotoxy(54,1);textbackground(CYAN);write(' TUJUAN ');
        gotoxy(63,1);textbackground(CYAN);write('  KELAS  ');
        gotoxy(73,1);textbackground(CYAN);write(' HARGA ');
        writeln();
   end;

   {Prototype}
   procedure InputData(var isi:DTiket);   //Input Data Pembeli
   begin
        clrscr();
        Kotak(18,5,62,21,CYAN,WHITE);
        gotoxy(31,6);writeln('INPUT DATA PEMBELI');
        gotoxy(19,7);writeln('-------------------------------------------');
        gotoxy(25,whereY+1);write('No. Kursi   : '); readln(isi^.nokursi);
        gotoxy(25,whereY+1);write('Nama        : '); readln(isi^.nama);
        gotoxy(25,whereY+1);write('Alamat      : '); readln(isi^.alamat);
        gotoxy(25,whereY+1);write('No. HP      : '); readln(isi^.nohape);

        repeat
              gotoxy(25,whereY+1);write('Kode Tujuan : '); readln(isi^.kodetujuan);
              isi^.kodetujuan:=upcase(isi^.kodetujuan);
        until((isi^.kodetujuan='CRB') or (isi^.kodetujuan='BDG') or (isi^.kodetujuan='JKT'));

        if (isi^.kodetujuan='CRB') then isi^.tujuan:='Cirebon'
        else if (isi^.kodetujuan='BDG') then isi^.tujuan:='Bandung'
        else if (isi^.kodetujuan='JKT') then isi^.tujuan:='Jakarta';

        repeat
              gotoxy(25,whereY+1);write('Kode Kelas  : '); readln(isi^.kodekelas);
        until((isi^.kodekelas>0) and (isi^.kodekelas<4));

        case (isi^.kodekelas) of
             1: isi^.kelas:='Eksekutif';
             2: isi^.kelas:='Bisnis';
             3: isi^.kelas:='Ekonomi';
        end;

        if(isi^.kodetujuan='CRB') then
        begin
             if(isi^.kodekelas=1) then isi^.harga:=100000
             else if(isi^.kodekelas=2) then isi^.harga:=80000
             else if(isi^.kodekelas=3) then isi^.harga:=45000;
        end
        else if(isi^.kodetujuan='BDG') then
        begin
             if(isi^.kodekelas=1) then isi^.harga:=150000
             else if(isi^.kodekelas=2) then isi^.harga:=100000
             else if(isi^.kodekelas=3) then isi^.harga:=80000;
        end
        else if(isi^.kodetujuan='JKT') then
        begin
             if(isi^.kodekelas=1) then isi^.harga:=200000
             else if(isi^.kodekelas=2) then isi^.harga:=150000
             else if(isi^.kodekelas=3) then isi^.harga:=100000;
        end;
        gotoxy(51,20);write('selesai...');
        readkey();
   end;

   procedure LihatData(isi:DTiket);       //Lihat Data Pembeli
   begin
        textbackground(BLACK);
        clrscr();
        Header;
        isi:=awal;
        while (isi <> nil) do
        begin
             textbackground(BLACK);
             gotoxy(3,whereY);write(isi^.nokursi);
             gotoxy(7,whereY);write(isi^.nama);
             gotoxy(26,whereY);write(isi^.alamat);
             gotoxy(41,whereY);write(isi^.nohape);
             gotoxy(54,whereY);write(isi^.tujuan);
             gotoxy(63,whereY);write(isi^.kelas);
             gotoxy(73,whereY);write(isi^.harga);
             writeln();
             isi:=isi^.next;
        end;
        readkey();
   end;

   {Penyisipan}
   procedure SisipDepan(var awal,akhir:DTiket);     //Penyisipan di Depan
   var
      baru:DTiket;

   begin
        new(baru);
        InputData(baru);

        if (awal=nil) then
        begin
             baru^.next:=nil;
             akhir:=baru;
        end
        else
        begin
             baru^.next:=awal;
        end;
        awal:=baru;
   end;

   procedure SisipBelakang(var awal,akhir:DTiket);     //Penyisipan di Belakang
   var
      baru:DTiket;

   begin
        new(baru);
        InputData(baru);
        baru^.next:=nil;

        if (awal=nil) then
        begin
             awal:=baru;
        end
        else
        begin
             akhir^.next:=baru;
        end;
        akhir:=baru;
   end;

   procedure SisipTengah(var awal,akhir:DTiket);    //Penyisipan di Tengah
   var
      baru,bantu:DTiket;
      ketemu:boolean;
      sisip:integer;

   begin
        if(awal=nil) then
        begin
             new(baru);
             InputData(baru);
             baru^.next:=nil;
             awal:=baru;
             akhir:=baru;
        end
        else
        begin
             clrscr();
             LihatData(data);
             Kotak(18,12,60,14,WHITE,BLACK);
             gotoxy(20,13);write('Data Akan Dimasukkan Setelah Nomor : '); readln(sisip);
             bantu:=awal;
             ketemu:=false;
             while((not ketemu) and (bantu<>nil)) do
             begin
                  if(sisip=bantu^.nokursi) then ketemu:=true
                  else bantu:=bantu^.next;
             end;

             if ketemu then
             begin
                  if(bantu=akhir) then SisipBelakang(awal,akhir)
                  else
                  begin
                       new(baru);
                       InputData(baru);
                       baru^.next:=bantu^.next;
                       bantu^.next:=baru;
                  end;
             end
             else
             begin
                  gotoxy(24,16);textbackground(BLACK);textcolor(RED);write('Nomor yang dimasukkan tidak ada');
                  readkey();
             end;
        end;
   end;

   {Penghapusan}
   procedure HapusDepan(var awal,akhir:DTiket);    //Hapus Depan
   var
      phapus:DTiket;

   begin
        clrscr();
        phapus:=awal;

        if (awal=akhir) then
        begin
             awal:=nil;
             akhir:=nil;
        end
        else
        begin
             awal:=awal^.next
        end;
        dispose(phapus);
        gotoxy(33,14);write('Data Telah Dihapus');
        readkey();
   end;

   procedure HapusBelakang(var awal,akhir:DTiket);         //Hapus Belakang
   var
      phapus:DTiket;

   begin
        clrscr();
        phapus:=awal;

        if (awal=akhir) then
        begin
             awal:=nil;
             akhir:=nil;
        end
        else
        begin
             while (phapus^.next <> akhir) do
             begin
                  phapus:=phapus^.next;
             end;

             akhir:=phapus;
             phapus:=phapus^.next;
             akhir^.next:=nil;
        end;
        dispose(phapus);
        gotoxy(33,14);write('Data Telah Dihapus');
        readkey();
   end;

   procedure HapusTengah(var awal,akhir:DTiket);      //Hapus Tengah
   var
      phapus,bantu:DTiket;
      ketemu:boolean;
      hapus:integer;

   begin
        clrscr();
        phapus:=awal;

        if(awal=akhir) then
        begin
             awal:=nil;
             akhir:=nil;
             dispose(phapus);
             gotoxy(33,14);write('Data Telah Dihapus');
             readkey();
        end
        else
        begin
             LihatData(data);
             Kotak(23,12,54,14,WHITE,BLACK);
             gotoxy(25,13);write('Nomor Yang Akan Dihapus : '); readln(hapus);
             ketemu:=false;
             while((not ketemu) and (phapus<>nil)) do
             begin
                  if(hapus=phapus^.nokursi) then ketemu:=true
                  else phapus:=phapus^.next;
             end;

             if ketemu then
             begin
                  if (phapus=awal) then HapusDepan(awal,akhir)
                  else if (phapus=akhir) then HapusBelakang(awal,akhir)
                  else
                      begin
                           bantu:=awal;
                           while (bantu^.next<>phapus) do bantu:=bantu^.next;

                           bantu^.next:=phapus^.next;
                           dispose(phapus);

                           clrscr();
                           gotoxy(33,14);write('Data Telah Dihapus');
                           readkey();
                      end;
             end
             else
             begin
                  gotoxy(30,16);textbackground(BLACK);textcolor(RED);write('Keyword Tidak Sesuai');
                  readkey();
             end;
        end;
   end;

   {Pencarian}
   procedure CariKursi(awal:DTiket);       //Pencarian Berdasarkan Nomor Kursi (Unik)
   var
      bantu : DTiket;
      ketemu : boolean;
      cari : integer;

   begin
        clrscr();
        Kotak(23,12,55,14,BLACK,WHITE);
        gotoxy(25,13);write('Nomor Kursi Yang Di Cari : '); readln(cari);
        bantu:=awal;
        ketemu:=false;
        while((not ketemu) and (bantu<>nil)) do
        begin
             if(cari=bantu^.nokursi) then ketemu:=true
             else bantu:=bantu^.next;
        end;

        if(ketemu) then
        begin
             clrscr();
             Header;
             textbackground(BLACK);
             gotoxy(3,whereY);write(bantu^.nokursi);
             gotoxy(7,whereY);write(bantu^.nama);
             gotoxy(26,whereY);write(bantu^.alamat);
             gotoxy(41,whereY);write(bantu^.nohape);
             gotoxy(54,whereY);write(bantu^.tujuan);
             gotoxy(63,whereY);write(bantu^.kelas);
             gotoxy(73,whereY);write(bantu^.harga);
             readkey();
        end
        else
        begin
             gotoxy(31,16);textbackground(BLACK);textcolor(RED);write('Data Tidak Ditemukan');
             readkey();
        end;
   end;

   procedure CariNama(awal:DTiket);      //Pencarian Berdasarkan Nama (Tidak Unik)
   var
      bantu : DTiket;
      cari : string;

   begin
        clrscr();
        Kotak(21,12,59,14,YELLOW,WHITE);
        gotoxy(23,13);write('Nama Yang Di Cari : '); readln(cari);
        clrscr();
        Header;
        textbackground(BLACK);
        bantu:=awal;
        while(bantu<>nil) do
        begin
             if(cari=bantu^.nama) then
             begin
                  gotoxy(3,whereY);write(bantu^.nokursi);
                  gotoxy(7,whereY);write(bantu^.nama);
                  gotoxy(26,whereY);write(bantu^.alamat);
                  gotoxy(41,whereY);write(bantu^.nohape);
                  gotoxy(54,whereY);write(bantu^.tujuan);
                  gotoxy(63,whereY);write(bantu^.kelas);
                  gotoxy(73,whereY);writeln(bantu^.harga);
                  bantu:=bantu^.next;
             end
             else bantu:=bantu^.next;
        end;
        readkey();
   end;

   {Pengurutan}
   procedure SortingKursi(awal,akhir:DTiket);       //Sorting Nomor Kursi Ascending
   var
      min,i,j:DTiket;
      temo:string;
      temp:integer;

   begin
        clrscr();
        LihatData(data);
        i:=awal;
        while(i<>akhir) do
        begin
             min:=i;
             j:=i^.next;
             while(j<>nil) do
             begin
                  if(j^.nokursi < min^.nokursi) then min:=j;
                  j:=j^.next;
             end;

             temp:=i^.nokursi;
             i^.nokursi:=min^.nokursi;
             min^.nokursi:=temp;

             temo:=i^.nama;
             i^.nama:=min^.nama;
             min^.nama:=temo;

             temo:=i^.alamat;
             i^.alamat:=min^.alamat;
             min^.alamat:=temo;

             temo:=i^.nohape;
             i^.nohape:=min^.nohape;
             min^.nohape:=temo;

             temo:=i^.tujuan;
             i^.tujuan:=min^.tujuan;
             min^.tujuan:=temo;

             temo:=i^.kelas;
             i^.kelas:=min^.kelas;
             min^.kelas:=temo;

             temp:=i^.harga;
             i^.harga:=min^.harga;
             min^.harga:=temp;
             i:=i^.next;
        end;
        LihatData(data);
   end;

   procedure SortingHarga(awal,akhir:DTiket);      //Sorting Harga Ascending
   var
      min,i,j:DTiket;
      temo:string;
      temp:integer;

   begin
        clrscr();
        LihatData(data);
        i:=awal;
        while(i<>akhir) do
        begin
             min:=i;
             j:=i^.next;
             while(j<>nil) do
             begin
                  if(j^.harga < min^.harga) then min:=j;
                  j:=j^.next;
             end;

             temp:=i^.nokursi;
             i^.nokursi:=min^.nokursi;
             min^.nokursi:=temp;

             temo:=i^.nama;
             i^.nama:=min^.nama;
             min^.nama:=temo;

             temo:=i^.alamat;
             i^.alamat:=min^.alamat;
             min^.alamat:=temo;

             temo:=i^.nohape;
             i^.nohape:=min^.nohape;
             min^.nohape:=temo;

             temo:=i^.tujuan;
             i^.tujuan:=min^.tujuan;
             min^.tujuan:=temo;

             temo:=i^.kelas;
             i^.kelas:=min^.kelas;
             min^.kelas:=temo;

             temp:=i^.harga;
             i^.harga:=min^.harga;
             min^.harga:=temp;
             i:=i^.next;
        end;
        LihatData(data);
   end;

   {Penghancuran}
   procedure Penghancuran(var awal:DTiket);
   var
      phapus:DTiket;

   begin
        clrscr();
        phapus:=awal;
        while(awal<>nil) do
        begin
             phapus:=awal;
             dispose(phapus);
             awal:=awal^.next;
        end;
        awal:=nil;
        akhir:=nil;
        LihatData(data);
        gotoxy(27,13);textbackground(BLACK);write('Semua Data Telah Dihapus');
        readkey();
   end;

   {Menu}
   procedure Menu(var pil:integer);     //Menu Utama
   begin
        clrscr();
        Kotak(25,7,56,20,YELLOW,WHITE);
        gotoxy(27,8);     writeln('    MENU PENJUALAN TIKET');
        gotoxy(27,whereY);writeln('   PT KERETA API TORABIKA');
        gotoxy(26,whereY);writeln('==============================');
        gotoxy(27,whereY);writeln('1. Sisip Data Pembeli');
        gotoxy(27,whereY);writeln('2. Hapus Data Pembeli');
        gotoxy(27,whereY);writeln('3. Cari Data Pembeli');
        gotoxy(27,whereY);writeln('4. Urut Data Pembeli');
        gotoxy(27,whereY);writeln('5. Penghancuran Data Pembeli');
        gotoxy(27,whereY);writeln('6. Lihat Data Pembeli');
        gotoxy(27,whereY);writeln('7. Keluar');
        gotoxy(26,whereY);writeln('==============================');
        gotoxy(27,whereY);write  ('        Pilihan : '); readln(pil);
   end;

   procedure MenuSisip;    //Menu Penyisipan
   var
      pil : integer;

   begin
        repeat
              clrscr();
              Kotak(27,8,53,17,BLACK,WHITE);
              gotoxy(29,9);     writeln('  MENU PENYISIPAN DATA');
              gotoxy(28,whereY);writeln('=========================');
              gotoxy(29,whereY);writeln('1. Sisip di Depan');
              gotoxy(29,whereY);writeln('2. Sisip di Tengah');
              gotoxy(29,whereY);writeln('3. Sisip di Belakang');
              gotoxy(29,whereY);writeln('4. Kembali ke Menu Utama');
              gotoxy(28,whereY);writeln('=========================');
              gotoxy(29,whereY);write  ('   Pilihan : '); readln(pil);
              case pil of
                   1: SisipDepan(awal,akhir);
                   2: SisipTengah(awal,akhir);
                   3: SisipBelakang(awal,akhir);
              end;
        until(pil=4);
   end;

   procedure MenuHapus;    //Menu Penghapusan
   var
      pil : integer;

   begin
        repeat
              clrscr();
              Kotak(27,8,53,17,BLACK,WHITE);
              gotoxy(28,9);     writeln('  MENU PENGHAPUSAN DATA');
              gotoxy(28,whereY);writeln('=========================');
              gotoxy(29,whereY);writeln('1. Hapus di Depan');
              gotoxy(29,whereY);writeln('2. Hapus di Tengah');
              gotoxy(29,whereY);writeln('3. Hapus di Belakang');
              gotoxy(29,whereY);writeln('4. Kembali ke Menu Utama');
              gotoxy(28,whereY);writeln('=========================');
              gotoxy(29,whereY);write  ('   Pilihan : '); readln(pil);
              case pil of
                   1: HapusDepan(awal,akhir);
                   2: HapusTengah(awal,akhir);
                   3: HapusBelakang(awal,akhir);
              end;
        until(pil=4);
   end;

   procedure MenuCari;    //Menu Pencarian
   var
      pil:integer;

   begin
        repeat
              clrscr();
              Kotak(24,9,57,17,BLACK,WHITE);
              gotoxy(26,10);     writeln('      MENU PENCARIAN DATA');
              gotoxy(25,whereY);writeln('================================');
              gotoxy(26,whereY);writeln('1. Cari Berdasarkan Nomor Kursi');
              gotoxy(26,whereY);writeln('2. Cari Berdasarkan Nama');
              gotoxy(26,whereY);writeln('3. Kembali ke Menu Utama');
              gotoxy(25,whereY);writeln('================================');
              gotoxy(26,whereY);write  ('         Pilihan : '); readln(pil);
              case pil of
                   1: CariKursi(awal);
                   2: CariNama(awal);
              end;
        until(pil=3);
   end;

   procedure MenuUrut;      //Menu Pengurutan
   var
   pil:integer;

   begin
        repeat
              clrscr();
              Kotak(24,9,57,17,BLACK,WHITE);
              gotoxy(26,10);     writeln('     MENU PENGURUTAN DATA');
              gotoxy(25,whereY);writeln('================================');
              gotoxy(26,whereY);writeln('1. Urut Berdasarkan Nomor Kursi');
              gotoxy(26,whereY);writeln('2. Urut Berdasarkan Harga');
              gotoxy(26,whereY);writeln('3. Kembali ke Menu Utama');
              gotoxy(25,whereY);writeln('================================');
              gotoxy(26,whereY);write  ('         Pilihan : '); readln(pil);
              case pil of
                   1: SortingKursi(awal,akhir);
                   2: SortingHarga(awal,akhir);
              end;
        until(pil=3);
   end;

begin
     {Penciptaan List}
     awal:=nil;
     akhir:=nil;

     {Menu Utama}
     repeat
           Menu(pilihan);
           case pilihan of
                1: MenuSisip;
                2: MenuHapus;
                3: MenuCari;
                4: MenuUrut;
                5: Penghancuran(awal);
                6: LihatData(data);
           end;
     until(pilihan=7);
end.
