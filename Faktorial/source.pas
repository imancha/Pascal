// Nama  : Mohammad Abdul Iman Syah
// NIM   : 10111143
// Kelas : IF-13

program rekursiffaktorial;
uses crt;

const
     MaksData = 12;

var
   n : integer;
   i : integer;
   faktor : longint;
   lagi : char;

   procedure Header;                                                          {Header/Judul Tabel}
   begin
        gotoxy(14,7);textbackground(BLUE);write('    ');
        gotoxy(19,7);textbackground(BLUE);write('          ');
        gotoxy(30,7);textbackground(BLUE);write('                 ');
        gotoxy(48,7);textbackground(BLUE);write('                   ');
        gotoxy(15,7);textcolor(WHITE);write('NO');
        gotoxy(20,7);textcolor(WHITE);write('BILANGAN');
        gotoxy(31,7);textcolor(WHITE);write('HASIL FAKTORIAL');
        gotoxy(49,7);textcolor(WHITE);write('INPUT NILAI [Y/T]');
   end;

   procedure Baris;                                                           {Baris Tabel}
   var
      bbaris:integer;

   begin
        for bbaris:=8 to MaksData+7 do
        begin
             if bbaris mod 2 = 0 then
             begin
                  gotoxy(14,bbaris);textbackground(YELLOW);write('    ');
                  gotoxy(19,bbaris);textbackground(YELLOW);write('          ');
                  gotoxy(30,bbaris);textbackground(YELLOW);write('                 ');
                  gotoxy(48,bbaris);textbackground(YELLOW);write('                   ');
             end
             else
             begin
                  gotoxy(14,bbaris);textbackground(GREEN);write('    ');
                  gotoxy(19,bbaris);textbackground(GREEN);write('          ');
                  gotoxy(30,bbaris);textbackground(GREEN);write('                 ');
                  gotoxy(48,bbaris);textbackground(GREEN);write('                   ');
             end;
        end;
   end;

   function faktorial (n:integer):longint;                                    {Fungsi Rekursif Faktorial}
   begin
        if (n=0) then
            faktorial:=1
        else
            faktorial:=n*faktorial(n-1);
   end;

begin
     textbackground(lightcyan);clrscr();
     Header;
     Baris;

     i:=1;
     repeat
           gotoxy(15,7+i);textcolor(white); write(i);
           gotoxy(20,7+i);textcolor(white); readln(n);

           faktor:=faktorial(n);

           gotoxy(31,7+i);textcolor(white); write(faktor);

           repeat
                gotoxy(57,7+i);textcolor(white); readln(lagi);
                lagi:=upcase(lagi);
           until((lagi='Y') or (lagi='T'));

           i:=i+1;
     until ((lagi='T') or (i=MaksData+1));

     clrscr();
     gotoxy(19,13); write('Terima Kasih Telah Menggunakan Program Ini.');
     readkey();
end.
