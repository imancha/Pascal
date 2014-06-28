program alstack;
uses crt;

const
     MaxStack = 5;

type
    Stack = array[1..MaxStack] of integer;

    Pointer = ^LStack;
    LStack = record
            info : integer;
            next : Pointer;
            end;

var
   AStack : Stack;
   ATop : integer;
   LTop : Pointer;
   databaru : integer;
   elemen : integer;
   pil : integer;

   Procedure InisialisasiArray(var ATop:integer);
   begin
        ATop := 0;
   end;

   Procedure IsiArray(var databaru:integer);
   begin
        clrscr();
        write('Push Angka : '); readln(databaru);
        writeln();
   end;

   Procedure OutputArray(ATop:integer; AStack:Stack);
   var
      i : integer;

   begin
        for i:=ATop downto 1 do
        begin
             writeln('|   ',AStack[i],'   |');
             writeln('|-------|');
        end;
        readkey();
   end;

   Procedure PushArray(databaru:integer; var ATop:integer; var AStack:Stack);
   begin
        if(ATop < MaxStack)
          then
              begin
                   ATop:=ATop+1;
                   AStack[ATop]:=databaru;
              end
          else
              begin
                   writeln('Stack Sudah Penuh, Push Gagal');
                   writeln();
              end;
   end;

   Procedure PopArray(elemen:integer; var ATop:integer; var AStack:Stack);
   begin
        if(ATop <> 0)
          then
              begin
                   elemen:=AStack[ATop];

                   writeln('Pop Angka : ',elemen);
                   writeln();

                   AStack[ATop]:=0;
                   ATop:=Atop-1;
              end
          else
              begin
                   write('Stack Kosong');
              end;
   end;

   Procedure MenuArray;
   var
      pilihan : integer;

   begin
        repeat
              clrscr();
              writeln('|------------|');
              writeln('| MENU ARRAY |');
              writeln('|------------|');
              writeln('| 1. Push    |');
              writeln('| 2. Pop     |');
              writeln('| 3. Kembali |');
              writeln('|------------|');
              write  ('  Pilihan : '); readln(pilihan);

              case pilihan of
                   1: begin
                           IsiArray(databaru);
                           PushArray(databaru,ATop,AStack);
                           OutputArray(ATop,AStack);
                      end;
                   2: begin
                           clrscr();
                           PopArray(elemen,ATop,AStack);
                           OutputArray(ATop,AStack);
                      end;
              end;
         until(pilihan=3);
    end;

    Procedure InisialisasiList(var LTop:Pointer);
    begin
         LTop := nil;
    end;

    Procedure IsiList(var databaru:integer);
    begin
         clrscr();
         write('Push Angka : '); readln(databaru);
         writeln();
    end;

    Procedure OutputList(LTop:Pointer);
    begin
         while(LTop<>nil) do
         begin
              writeln('|   ',LTop^.info,'   |');
              writeln('|-------|');
              LTop:=LTop^.next;
         end;
         readkey();
    end;

    Procedure PushList(databaru:integer; var LTop:Pointer);
    var
       baru : Pointer;

    begin
         new(baru);
         baru^.info:=databaru;

         if(LTop = nil)
           then
               begin
                    baru^.next:=nil;
               end
           else
               begin
                    baru^.next:=LTop;
               end;
         LTop:=baru;
    end;

    Procedure PopList(elemen:integer; var LTop:Pointer);
    var
       phapus : Pointer;

    begin
         phapus:=LTop;
         elemen:=phapus^.info;

         if(LTop<>nil)
           then
               begin
                    LTop:=LTop^.next;

                    writeln('Pop Angka : ',elemen);
                    writeln();
               end
           else
               begin
                    write('Stack Kosong');
               end;
         dispose(phapus);
    end;

    Procedure MenuList;
   var
      pilihan : integer;

   begin
        repeat
              clrscr();
              writeln('|------------|');
              writeln('| MENU LIST  |');
              writeln('|------------|');
              writeln('| 1. Push    |');
              writeln('| 2. Pop     |');
              writeln('| 3. Kembali |');
              writeln('|------------|');
              write  ('  Pilihan : '); readln(pilihan);

              case pilihan of
                   1: begin
                           IsiList(databaru);
                           PushList(databaru,LTop);
                           OutputList(LTop);
                      end;
                   2: begin
                           clrscr();
                           PopList(elemen,LTop);
                           OutputList(LTop);
                      end;
              end;
         until(pilihan=3);
    end;

begin
     InisialisasiArray(ATop);
     InisialisasiList(LTop);
     repeat
           clrscr();
           writeln('|------------|');
           writeln('| MENU STACK |');
           writeln('|------------|');
           writeln('| 1. Array   |');
           writeln('| 2. List    |');
           writeln('| 3. Keluar  |');
           writeln('|------------|');
           write  ('  Pilihan : '); readln(pil);

           case pil of
                1: MenuArray;
                2: MenuList;
           end;
     until(pil=3);
end.
