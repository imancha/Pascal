program linkedlist;
uses crt;

type
    RecordIsi = record
                angka : integer;
                huruf : char;
                end;

    RIsi = RecordIsi;

    Pointer = ^Simpul;
    Simpul = record
             prev : Pointer;
             info : RIsi;
             next : Pointer;
             end;

var
   data,awal,akhir : Pointer;
   elemen : RIsi;
   pilihan : integer;

   {}
   function Kosong(list:Pointer):boolean;
   begin
        Kosong:=false;
        if(list=nil)
          then
              Kosong:=true;
   end;

   function Satu(list:Pointer):boolean;
   begin
        Satu:=false;
        if(list=akhir)
          then
              Satu:=true;
   end;

   {Prototype}
   procedure Isi(var elemen:RIsi);
   begin
        clrscr();
        write('Angka : '); readln(elemen.angka);
        write('Huruf : '); readln(elemen.huruf);
   end;

   procedure Output(var data:Pointer);
   var
      stop:boolean;

   begin
        clrscr();
        data:=awal;
        stop:=false;
        while(not stop) do
        begin
             if(Satu(data))
               then
                   begin
                        write(' ',data^.info.angka);
                        write(' ',data^.info.huruf);
                        stop:=true;
                   end
               else
                   begin
                        write(' ',data^.info.angka);
                        write(' ',data^.info.huruf);
                        data:=data^.next;
                   end;
        end;
        readkey();
   end;

   procedure Destroy(var awal,akhir:Pointer);
   var
      phapus : Pointer;

   begin
        phapus:=awal;
        while(not Kosong(awal)) do
        begin
             if(Satu(awal))
               then
                   begin
                        awal:=nil;
                        akhir:=nil;
                   end
               else
                   begin
                        awal:=awal^.next;
                        awal^.prev:=akhir;
                        akhir^.next:=awal;
                   end;
             dispose(phapus);
             phapus:=awal;
        end;
   end;

   {Penyisipan}
   procedure SisipDepanSingle(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=elemen;

        if(Kosong(awal))
          then
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

   procedure SisipDepanDouble(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=elemen;
        baru^.prev:=nil;

        if(Kosong(awal))
          then
              begin
                   baru^.next:=nil;
                   akhir:=baru;
              end
          else
              begin
                   baru^.next:=awal;
                   awal^.prev:=baru;
              end;
        awal:=baru;
   end;

   procedure SisipDepanCircularSingle(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=elemen;

        if(Kosong(awal))
          then
              begin
                   baru^.next:=baru;
                   awal:=baru;
                   akhir:=baru;
              end
          else
              begin
                   baru^.next:=awal;
                   awal:=baru;
                   akhir^.next:=awal;
              end;
   end;

   procedure SisipDepanCircularDouble(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=elemen;

        if(Kosong(awal))
          then
              begin
                   baru^.prev:=baru;
                   baru^.next:=baru;
                   awal:=baru;
                   akhir:=baru;
              end
          else
              begin
                   baru^.prev:=akhir;
                   baru^.next:=awal;
                   awal^.prev:=baru;
                   awal:=baru;
                   akhir^.next:=awal;
              end;
   end;

   procedure SisipBelakangSingle(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=elemen;
        baru^.next:=nil;

        if(Kosong(awal))
          then
              awal:=baru
          else
              akhir^.next:=baru;

        akhir:=baru;
   end;

   procedure SisipBelakangDouble(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=elemen;
        baru^.next:=nil;

        if(Kosong(awal))
          then
              begin
                   baru^.prev:=nil;
                   awal:=baru;
              end
          else
              begin
                   baru^.prev:=akhir;
                   akhir^.next:=baru;
              end;
        akhir:=baru;
   end;

   procedure SisipBelakangCircularSingle(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=elemen;

        if(Kosong(awal))
          then
              begin
                   baru^.next:=baru;
                   awal:=baru;
                   akhir:=baru;
              end
          else
              begin
                   akhir^.next:=baru;
                   akhir:=baru;
                   akhir^.next:=awal;
              end;
   end;

   procedure SisipBelakangCircularDouble(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru : Pointer;

   begin
        new(baru);
        baru^.info:=elemen;

        if(Kosong(awal))
          then
              begin
                   baru^.prev:=baru;
                   baru^.next:=baru;
                   awal:=baru;
                   akhir:=baru;
              end
          else
              begin
                   baru^.prev:=akhir;
                   akhir^.next:=baru;
                   akhir:=baru;
                   akhir^.next:=awal;
              end;
   end;
   
   procedure SisipTengahSingle(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru,bantu : Pointer;
      ketemu : boolean;
      datahuruf : char;

   begin
        new(baru);
        baru^.info:=elemen;

        if(Kosong(awal))
          then
              begin
                   baru^.next:=nil;
                   awal:=baru;
                   akhir:=baru;
              end
          else
              begin
                   Output(data);
                   writeln();writeln();
                   write('Data Akan Dimasukkan Setelah Huruf : '); readln(datahuruf);

                   ketemu:=false;
                   bantu:=awal;
                   while(not ketemu) and (bantu<>nil) do
                   begin
                        if(bantu^.info.huruf = datahuruf)
                          then
                              ketemu:=true
                          else
                              bantu:=bantu^.next;
                   end;

                   if(ketemu)
                     then
                         begin
                              if(bantu = akhir)
                                then
                                    begin
                                         SisipBelakangSingle(elemen,awal,akhir);
                                    end
                                else
                                    begin
                                         baru^.next:=bantu^.next;
                                         bantu^.next:=baru;
                                    end;
                         end
                     else
                         begin
                              write('Huruf ',datahuruf,' Tidak Ditemukan');
                              readkey();
                         end;
              end;
   end;

   Procedure SisipTengahDouble(elemen:RIsi; var awal,akhir:Pointer);
   var
      baru,bantu : Pointer;
      ketemu : boolean;
      dataangka : integer;

   begin
        new(baru);
        baru^.info:=elemen;

        if(Kosong(awal))
          then
              begin
                   baru^.prev:=baru;
                   baru^.next:=baru;
                   awal:=baru;
                   akhir:=baru;
              end
          else
              begin
                   Output(data);
                   writeln();writeln();
                   write('Data Akan Dimasukkan Sebelum Angka : '); readln(dataangka);

                   ketemu:=false;
                   bantu:=awal;
                   while(not ketemu) and (bantu<>nil) do
                   begin
                        if(bantu^.info.angka = dataangka)
                          then
                              ketemu:=true
                          else
                              bantu:=bantu^.next;
                   end;

                   if(ketemu)
                     then
                         begin
                              if(bantu = awal)
                                then
                                    begin
                                         SisipDepanDouble(elemen,awal,akhir);
                                    end
                                else
                                    begin
                                         baru^.next:=bantu;
                                         baru^.prev:=bantu^.prev;
                                         bantu^.prev^.next:=baru;
                                         bantu^.prev:=baru;
                                    end;
                         end
                     else
                         begin
                              write('Angka ',dataangka,' Tidak Ditemukan');
                              readkey();
                         end;
              end;
   end;

   {Penghapusan}

   {Menu}
   procedure MenuUtama(var pil:integer);
   begin
        clrscr();
        writeln('MENU UTAMA LINKED LIST');
        writeln('-----------------------');
        writeln('1. Single Linked List');
        writeln('2. Double Linked List');
        writeln('3. Circular Single Linked List');
        writeln('4. Circular Double Linked List');
        writeln('5. Keluar');
        writeln('-----------------------');
        write  ('   Pilihan : '); readln(pil);
   end;

   procedure MenuSisipSingle;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU SISIP SINGLE');
              writeln('--------------------');
              writeln('1. Sisip Depan');
              writeln('2. Sisip Tengah');
              writeln('3. Sisip Belakang');
              writeln('4. Menu Sisip Single');
              writeln('--------------------');
              write  ('   Pilihan : '); readln(pil);

              case pil of
                   1: begin
                           Isi(elemen);
                           SisipDepanSingle(elemen,awal,akhir);
                           Output(data);
                      end;
                   2: begin
                           Isi(elemen);
                           SisipTengahSingle(elemen,awal,akhir);
                           Output(data);
                      end;
                   3: begin
                           Isi(elemen);
                           SisipBelakangSingle(elemen,awal,akhir);
                           Output(data);
                      end;
              end;
        until(pil=4);
   end;

   procedure MenuHapusSingle;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU HAPUS SINGLE');
              writeln('--------------------');
              writeln('1. Hapus Depan');
              writeln('2. Hapus Tengah');
              writeln('3. Hapus Belakang');
              writeln('4. Menu Sisip Single');
              writeln('--------------------');
              write  ('   Pilihan : '); readln(pil);
        until(pil=4);
   end;

   procedure MenuSingle;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU SINGLE LINKED LIST');
              writeln('-----------------------');
              writeln('1. Sisip Data');
              writeln('2. Hapus Data');
              writeln('3. Lihat Data');
              writeln('4. Menu Utama');
              writeln('-----------------------');
              write  ('   Pilihan : '); readln(pil);

              case pil of
                   1: MenuSisipSingle;
                   2: MenuHapusSingle;
                   3:
              end;
        until(pil=4);
   end;

   procedure MenuSisipDouble;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU SISIP DOUBLE');
              writeln('--------------------');
              writeln('1. Sisip Depan');
              writeln('2. Sisip Tengah');
              writeln('3. Sisip Belakang');
              writeln('4. Menu Sisip Double');
              writeln('--------------------');
              write  ('   Pilihan : '); readln(pil);

              case pil of
                   1: begin
                           Isi(elemen);
                           SisipDepanDouble(elemen,awal,akhir);
                           Output(data);
                      end;
                   2: begin
                           Isi(elemen);
                           SisipTengahDouble(elemen,awal,akhir);
                           Output(data);
                      end;
                   3: begin
                           Isi(elemen);
                           SisipBelakangDouble(elemen,awal,akhir);
                           Output(data);
                      end;
              end;
        until(pil=4);
   end;

   procedure MenuHapusDouble;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU HAPUS DOUBLE');
              writeln('--------------------');
              writeln('1. Hapus Depan');
              writeln('2. Hapus Tengah');
              writeln('3. Hapus Belakang');
              writeln('4. Menu Sisip Double');
              writeln('--------------------');
              write  ('   Pilihan : '); readln(pil);
        until(pil=4);
   end;

   procedure MenuDouble;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU DOUBLE LINKED LIST');
              writeln('-----------------------');
              writeln('1. Sisip Data');
              writeln('2. Hapus Data');
              writeln('3. Lihat Data');
              writeln('4. Menu Utama');
              writeln('-----------------------');
              write  ('   Pilihan : '); readln(pil);

              case pil of
                   1: MenuSisipDouble;
                   2: MenuHapusDOuble;
                   3:
              end;
        until(pil=4);
   end;

   procedure MenuSisipCircularSingle;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU SISIP CIRCULAR SINGLE');
              writeln('--------------------------');
              writeln('1. Sisip Depan');
              writeln('2. Sisip Tengah');
              writeln('3. Sisip Belakang');
              writeln('4. Menu Sisip Circular');
              writeln('--------------------------');
              write  ('   Pilihan : '); readln(pil);

              case pil of
                   1: begin
                           Isi(elemen);
                           SisipDepanCircularSingle(elemen,awal,akhir);
                           Output(data);
                      end;
                   3: begin
                           Isi(elemen);
                           SisipBelakangCircularSingle(elemen,awal,akhir);
                           Output(data);
                      end;
              end;
        until(pil=4);
   end;

   procedure MenuHapusCircularSingle;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU HAPUS CIRCULAR SINGLE');
              writeln('--------------------------');
              writeln('1. Hapus Depan');
              writeln('2. Hapus Tengah');
              writeln('3. Hapus Belakang');
              writeln('4. Menu Sisip Circular');
              writeln('--------------------------');
              write  ('   Pilihan : '); readln(pil);
        until(pil=4);
   end;

   procedure MenuCircularSingle;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU CIRCULAR SINGLE LINKED LIST');
              writeln('--------------------------------');
              writeln('1. Sisip Data');
              writeln('2. Hapus Data');
              writeln('3. Lihat Data');
              writeln('4. Menu Utama');
              writeln('--------------------------------');
              write  ('   Pilihan : '); readln(pil);

              case pil of
                   1: MenuSisipCircularSingle;
                   2: MenuHapusCircularSingle;
                   3:
              end;
        until(pil=4);
   end;

   procedure MenuSisipCircularDouble;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU SISIP CIRCULAR DOUBLE');
              writeln('-----------------------------');
              writeln('1. Sisip Depan');
              writeln('2. Sisip Tengah');
              writeln('3. Sisip Belakang');
              writeln('4. Menu Sisip Circular Double');
              writeln('-----------------------------');
              write  ('   Pilihan : '); readln(pil);

              case pil of
                   1: begin
                           Isi(elemen);
                           SisipDepanCircularDouble(elemen,awal,akhir);
                           Output(data);
                      end;
                   3: begin
                           Isi(elemen);
                           SisipBelakangCircularDouble(elemen,awal,akhir);
                           Output(data);
                      end;
              end;
        until(pil=4);
   end;

   procedure MenuHapusCircularDouble;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU HAPUS CIRCULAR DOUBLE');
              writeln('-----------------------------');
              writeln('1. Hapus Depan');
              writeln('2. Hapus Tengah');
              writeln('3. Hapus Belakang');
              writeln('4. Menu Sisip Circular Double');
              writeln('-----------------------------');
              write  ('   Pilihan : '); readln(pil);
        until(pil=4);
   end;

   procedure MenuCircularDouble;
   var
      pil : integer;

   begin
        repeat
              clrscr();
              writeln('MENU CIRCULAR DOUBLE LINKED LIST');
              writeln('--------------------------------');
              writeln('1. Sisip Data');
              writeln('2. Hapus Data');
              writeln('3. Lihat Data');
              writeln('4. Menu Utama');
              writeln('--------------------------------');
              write  ('   Pilihan : '); readln(pil);

              case pil of
                   1: MenuSisipCircularDouble;
                   2: MenuHapusCircularDouble;
                   3:
              end;
        until(pil=4);
   end;

begin
     {Create List}
     awal:=nil;
     akhir:=nil;

     repeat
           MenuUtama(pilihan);

           case pilihan of
                1: MenuSingle;
                2: MenuDouble;
                3: MenuCircularSingle;
                4: MenuCircularDouble;
                5: Destroy(awal,akhir);
           end;
     until(pilihan=5);
end.
