{NIM 	: 10111143}
{Nama 	: Mohammad Abdul Iman Syah}
{Kelas	: IF-13B}

program curiculumvitae;
uses crt;

type
    Lahir = record
            tempat  : string;
            tanggal : byte;
            bulan   : string;
            tahun   : integer;
            end;

    Data = record
           nama   : string[30];
           klamin : string[10];
           ttl    : Lahir;
           status : string;
           tinggi : integer;
           berat  : integer;
           agama  : string;
           alamat : string;
           akhir  : string;
           email  : string;
           end;

var
   isi : Data;

begin
     writeln('==========================================');
     writeln('|              DATA PRIBADI              |');
     writeln('==========================================');
     writeln('|');
     write('| Nama             : '); readln(isi.nama);
     write('| Tempat &         : '); readln(isi.ttl.tempat);
     write('| Tanggal          : '); readln(isi.ttl.tanggal);
     write('| Bulan            : '); readln(isi.ttl.bulan);
     write('| Tahun            : '); readln(isi.ttl.tahun);
     write('| Jenis Kelamin    : '); readln(isi.klamin);
     write('| Status           : '); readln(isi.status);
     write('| Tinggi (cm)      : '); readln(isi.tinggi);
     write('| Berat (cm)       : '); readln(isi.berat);
     write('| Agama            : '); readln(isi.agama);
     write('| Alamat           : '); readln(isi.alamat);
     write('| Pendidikan Akhir : '); readln(isi.akhir);
     write('| Email            : '); readln(isi.email);
     write('==========================================');

     clrscr();

     writeln('======================================================');
     writeln('|                    DATA PRIBADI                    |');
     writeln('======================================================');
     writeln('|');
     writeln('| Nama                   : ',isi.nama);
     writeln('| Tempat & Tanggal Lahir : ',isi.ttl.tempat,', ',isi.ttl.tanggal,'-',isi.ttl.bulan,'-',isi.ttl.tahun);
     writeln('| Jenis Kelamin          : ',isi.klamin);
     writeln('| Status                 : ',isi.status);
     writeln('| Tinggi                 : ',isi.tinggi,' cm');
     writeln('| Berat                  : ',isi.berat,' cm');
     writeln('| Agama                  : ',isi.agama);
     writeln('| Alamat                 : ',isi.alamat);
     writeln('| Pendidikan Akhir       : ',isi.akhir);
     writeln('| Email                  : ',isi.email);
     writeln('|');
     writeln('======================================================');

     readkey();
end.
