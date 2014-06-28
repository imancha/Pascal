program curiculum_vitae;
uses crt;

type
	TDate = record
			tempat	: string;
			tanggal : byte;
			bulan	: string;
			tahun	: integer;
			end;

	Data = record
			nama	: string;
            alias   : string;
			jklamin	: string;
			lahir	: TDate;
			status	: string;
			tinggi	: integer;
			agama	: string;
			alamat	: string;
			email	: string;
			end;

   Pendidikan = record
                ntk : string;
                mtk : integer;
                ltk : integer;
                nsd : string;
                msd : integer;
                lsd : integer;
                nmp : string;
                mmp : integer;
                lmp : integer;
                nma : string;
                mma : integer;
                lma : integer;
                npt : string;
                mpt : integer;
                lpt : integer;
                end;

var
   isi : Data;
   sekolah : Pendidikan;

begin
     writeln ('      DATA PRIBADI');
     writeln ('========================');
     writeln();
     write ('Nama Lengkap     : ');readln(isi.nama);
     write ('Alias            : ');readln(isi.alias);
     writeln();
     writeln ('Tempat & Tanggal Lahir ');
     write ('       Tempat    : ');readln(isi.lahir.tempat);
     write ('       Tanggal   : ');readln(isi.lahir.tanggal);
     write ('       Bulan     : ');readln(isi.lahir.bulan);
     write ('       Tahun     : ');readln(isi.lahir.tahun);
     write ('Jenis Kelamin    : ');readln(isi.jklamin);
     write ('Status           : ');readln(isi.status);
     write ('Tinggi (cm)      : ');readln(isi.tinggi);
     write ('Agama            : ');readln(isi.agama);
     write ('Alamat           : ');readln(isi.alamat);
     write ('Email            : ');readln(isi.email);
     writeln();writeln();

     writeln('        PENDIDIKAN');
     writeln('==========================');
     writeln();
     writeln('TK');
     write('    Nama Institusi : ');readln(sekolah.ntk);
     write('    Tahun Masuk    : ');readln(sekolah.mtk);
     write('    Tahun Lulus    : ');readln(sekolah.ltk);
     writeln('SD');
     write('    Nama Institusi : ');readln(sekolah.nsd);
     write('    Tahun Masuk    : ');readln(sekolah.msd);
     write('    Tahun Lulus    : ');readln(sekolah.lsd);
     writeln('SMP');
     write('    Nama Institusi : ');readln(sekolah.nmp);
     write('    Tahun Masuk    : ');readln(sekolah.mmp);
     write('    Tahun Lulus    : ');readln(sekolah.lmp);
     writeln('SMA');
     write('    Nama Institusi : ');readln(sekolah.nma);
     write('    Tahun Masuk    : ');readln(sekolah.mma);
     write('    Tahun Lulus    : ');readln(sekolah.lma);
     writeln('PT');
     write('    Nama Institusi : ');readln(sekolah.npt);
     write('    Tahun Masuk    : ');readln(sekolah.mpt);
     write('    Tahun Lulus    : ');readln(sekolah.lpt);
     clrscr();

     writeln('        DATA PRIBADI');
     writeln('============================');
     writeln();
     writeln('Nama Lengkap         : ',isi.nama);
     writeln('Alias                : ',isi.alias);
     writeln('Tempat Tanggal Lahir : ',isi.lahir.tempat,', ',isi.lahir.tanggal,' ',isi.lahir.bulan,' ',isi.lahir.tahun);
     writeln('Jenis Kelamin        : ',isi.jklamin);
     writeln('Agama                : ',isi.agama);
     writeln('Status               : ',isi.status);
     writeln('Tinggi               : ',isi.tinggi,' cm');
     writeln('Alamat               : ',isi.alamat);
     writeln('Email                : ',isi.email);
     writeln(); writeln();

     writeln('        PENDIDIKAN');
     writeln('==========================');
     writeln();
     writeln('TK');
     writeln('    Nama Institusi : ',sekolah.ntk);
     writeln('    Tahun Masuk    : ',sekolah.mtk);
     writeln('    Tahun Lulus    : ',sekolah.ltk);
     writeln('SD');
     writeln('    Nama Institusi : ',sekolah.nsd);
     writeln('    Tahun Masuk    : ',sekolah.msd);
     writeln('    Tahun Lulus    : ',sekolah.lsd);
     writeln('SMP');
     writeln('    Nama Institusi : ',sekolah.nmp);
     writeln('    Tahun Masuk    : ',sekolah.mmp);
     writeln('    Tahun Lulus    : ',sekolah.lmp);
     writeln('SMA');
     writeln('    Nama Institusi : ',sekolah.nma);
     writeln('    Tahun Masuk    : ',sekolah.mma);
     writeln('    Tahun Lulus    : ',sekolah.lma);
     writeln('PT');
     writeln('    Nama Institusi : ',sekolah.npt);
     writeln('    Tahun Masuk    : ',sekolah.mpt);
     writeln('    Tahun Lulus    : ',sekolah.lpt);
     readkey();
end.
