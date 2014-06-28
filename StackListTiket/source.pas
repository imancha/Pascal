program stacklisttiket;
uses crt;

type
    RecordIsi = record
                nokursi    : integer;
                nama       : string[16];
                alamat     : string[14];
                nohape     : string[12];
                kodetujuan : string;
                tujuan     : string;
                kodekelas  : integer;
                kelas      : string;
                harga      : integer;
                end;

    RIsi = RecordIsi;

    Pointer = ^Stack;
    Stack = record
            info : RIsi;
            next : Pointer;
            end;

var
   Top      : Pointer;
   databaru : RIsi;
   elemen   : RIsi;
   pil      : integer;

   procedure Kotak(awalkolom,awalbaris,akhirkolom,akhirbaris:integer; latar:byte);      //Kotak Menu
   var
      i : integer;

   begin
        textbackground(latar);
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
        gotoxy(2,1);textbackground(MAGENTA);write(' NO ');
        gotoxy(7,1);textbackground(MAGENTA);write('       NAMA       ');
        gotoxy(26,1);textbackground(MAGENTA);write('    ALAMAT    ');
        gotoxy(41,1);textbackground(MAGENTA);write('   NO. HP   ');
        gotoxy(54,1);textbackground(MAGENTA);write(' TUJUAN ');
        gotoxy(63,1);textbackground(MAGENTA);write('  KELAS  ');
        gotoxy(73,1);textbackground(MAGENTA);writeln(' HARGA ');
   end;

   function Kosong(list:Pointer):boolean;
   begin
        Kosong:=false;
        if(list = nil)
          then
              Kosong:=true;
   end;

   Procedure Inisialisasi(var Top:Pointer);
   begin
        Top:=nil;
   end;

   Procedure Isi(var databaru:RIsi);
   begin
        textbackground(0);clrscr();
        window(1,1,21,25);textbackground(WHITE);clrscr();textcolor(0);
        gotoxy(3,7);writeln('   KODE TUJUAN');
        gotoxy(3,whereY);writeln('-----------------');
        gotoxy(3,whereY);writeln(' CRB --> CIREBON');
        gotoxy(3,whereY);writeln(' BDG --> BANDUNG');
        gotoxy(3,whereY);writeln(' JKT --> JAKARTA');
        gotoxy(3,whereY+4);writeln('   KODE KELAS');
        gotoxy(3,whereY);writeln('-----------------');
        gotoxy(3,whereY);writeln(' 1 --> EKSEKUTIF');
        gotoxy(3,whereY);writeln(' 2 --> BISNIS');
        gotoxy(3,whereY);writeln(' 3 --> EKONOMI');
        window(58,1,80,25);textbackground(WHITE);clrscr();textcolor(0);
        gotoxy(2,4);writeln('       CIREBON');
        gotoxy(2,whereY);writeln('---------------------');
        gotoxy(2,whereY);writeln('EKSEKUTIF --> 100.000');
        gotoxy(2,whereY);writeln('BISNIS    -->  80.000');
        gotoxy(2,whereY);writeln('EKONOMI   -->  50.000');
        gotoxy(2,whereY+2);writeln('       BANDUNG');
        gotoxy(2,whereY);writeln('---------------------');
        gotoxy(2,whereY);writeln('EKSEKUTIF --> 150.000');
        gotoxy(2,whereY);writeln('BISNIS    --> 100.000');
        gotoxy(2,whereY);writeln('EKONOMI   -->  80.000');
        gotoxy(2,whereY+2);writeln('       JAKARTA');
        gotoxy(2,whereY);writeln('---------------------');
        gotoxy(2,whereY);writeln('EKSEKUTIF --> 200.000');
        gotoxy(2,whereY);writeln('BISNIS    --> 150.000');
        gotoxy(2,whereY);writeln('EKONOMI   --> 100.000');
        window(24,5,55,21);textbackground(2);clrscr();textcolor(WHITE);
        gotoxy(8,2);writeln('INPUT DATA PEMBELI');
        gotoxy(2,whereY+1);writeln('------------------------------');
        gotoxy(2,whereY+1);write('Nomor Kursi : '); readln(databaru.nokursi);
        gotoxy(2,whereY+1);write('Nama        : '); readln(databaru.nama);
        gotoxy(2,whereY+1);write('Alamat      : '); readln(databaru.alamat);
        gotoxy(2,whereY+1);write('No. HP      : '); readln(databaru.nohape);

        repeat
              gotoxy(2,whereY+1);write('Kode Tujuan : '); readln(databaru.kodetujuan);
              databaru.kodetujuan:=upcase(databaru.kodetujuan);
        until(databaru.kodetujuan = 'CRB') or (databaru.kodetujuan = 'BDG') or (databaru.kodetujuan = 'JKT');

        if(databaru.kodetujuan = 'CRB')
          then
              databaru.tujuan:='Cirebon'
          else
              if(databaru.kodetujuan = 'BDG')
                then
                    databaru.tujuan:='Bandung'
                else
                    databaru.tujuan:='Jakarta';

        repeat
              gotoxy(2,whereY+1);write('Kode Kelas  : '); readln(databaru.kodekelas);
        until(databaru.kodekelas > 0) and (databaru.kodekelas < 4);

        case (databaru.kodekelas) of
             1: databaru.kelas:='Eksekutif';
             2: databaru.kelas:='Bisnis';
             3: databaru.kelas:='Ekonomi';
        end;

        if(databaru.kodetujuan = 'CRB')
          then
              begin
                   case (databaru.kodekelas) of
                        1: databaru.harga:=100000;
                        2: databaru.harga:=80000;
                        3: databaru.harga:=50000;
                   end;
              end
          else
              if(databaru.kodetujuan = 'BDG')
                then
                    begin
                         case (databaru.kodekelas) of
                              1: databaru.harga:=150000;
                              2: databaru.harga:=100000;
                              3: databaru.harga:=80000;
                         end;
                    end
                else
                    if(databaru.kodetujuan = 'JKT')
                      then
                          begin
                               case (databaru.kodekelas) of
                                    1: databaru.harga:=200000;
                                    2: databaru.harga:=150000;
                                    3: databaru.harga:=100000;
                               end;
                          end;
   end;

   Procedure Output(data:RIsi);
   begin
        textbackground(0);
        gotoxy(3,whereY);write(data.nokursi);
        gotoxy(7,whereY);write(data.nama);
        gotoxy(26,whereY);write(data.alamat);
        gotoxy(41,whereY);write(data.nohape);
        gotoxy(54,whereY);write(data.tujuan);
        gotoxy(63,whereY);write(data.kelas);
        gotoxy(73,whereY);writeln(data.harga);
   end;

   Procedure Push(var Top:Pointer; databaru:RIsi);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=databaru;

        if(Kosong(Top))
          then
              baru^.next:=nil
          else
              baru^.next:=Top;

        Top:=baru;
   end;

   Procedure Pop(var Top:Pointer; var elemen:RIsi);
   var
      phapus : Pointer;

   begin
        phapus:=Top;
        elemen:=phapus^.info;

        if(Kosong(Top^.next))
          then
              Top:=nil
          else
              Top:=Top^.next;

        dispose(phapus);
   end;

   Procedure Tampil(var Top:Pointer);
   begin
        textbackground(0);clrscr();
        if(not Kosong(Top))
          then
              begin
                   Header;
                   repeat
                         Pop(Top,elemen);
                         Output(elemen);
                   until(Kosong(Top));
              end
          else
              begin
                   window(27,11,52,15);textbackground(4);clrscr();
                   gotoxy(8,3);write('Stack Kosong');
              end;
        readkey();
   end;

begin
     Inisialisasi(Top);
     repeat
           window(1,1,80,25);textbackground(0);clrscr();
           Kotak(28,9,53,18,1);
           gotoxy(29,10);writeln('  MENU PENJUALAN TIKET');
           gotoxy(29,whereY);writeln(' KERETA API PT TORABIKA');
           gotoxy(29,whereY);writeln('------------------------');
           gotoxy(29,whereY);writeln(' 1. Isi Data Pembeli');
           gotoxy(29,whereY);writeln(' 2. Lihat Data Pembeli');
           gotoxy(29,whereY);writeln(' 3. Keluar');
           gotoxy(29,whereY);writeln('------------------------');
           gotoxy(29,whereY);write  ('    Pilihan = '); readln(pil);

           case pil of
                1: begin
                        Isi(databaru);
                        Push(Top,databaru);
                   end;
                2: begin
                        Tampil(Top);
                   end;
           end;
     until(pil=3);
end.
