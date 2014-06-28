program modelperceptron;
uses crt;

type
    Rnet = record
           X1     : integer;
           X2     : integer;
           target : integer;
           W1     : integer;
           W2     : integer;
           Wa     : integer;
           Wb     : integer;
           B      : integer;
           Ba     : integer;
           Y      : integer;
           Hnet   : integer;
           HX1    : integer;
           HX2    : integer;
           end;

    net = array[1..4] of Rnet;

var
   data : net;
   a,i,j,bias : integer;
   bobot,epoch : integer;

   procedure Header;
   begin
        gotoxy(2,1);textbackground(MAGENTA);write('  X1  ');
        gotoxy(9,1);textbackground(MAGENTA);write('  X2  ');
        gotoxy(16,1);textbackground(MAGENTA);write('  T   ');
        gotoxy(23,1);textbackground(MAGENTA);write(' NET ');
        gotoxy(29,1);textbackground(MAGENTA);write(' Y ');
        gotoxy(33,1);textbackground(MAGENTA);write(' WA ');
        gotoxy(38,1);textbackground(MAGENTA);write(' WB ');
        gotoxy(43,1);textbackground(MAGENTA);write(' BA ');
        gotoxy(48,1);textbackground(MAGENTA);write(' W1 ');
        gotoxy(53,1);textbackground(MAGENTA);write(' W2 ');
        gotoxy(58,1);textbackground(MAGENTA);write(' B ');
   end;


begin
     Header;
     writeln();
     textbackground(BLACK);
     repeat
           for i:=1 to 4 do
           begin
                gotoxy(4,whereY);readln(data[i].X1);
                gotoxy(11,whereY-1);readln(data[i].X2);
                gotoxy(18,whereY-1);readln(data[i].target);

                data[i].Hnet:=((data[i].X1*data[i-1].W1)+(data[i].X2*data[i-1].W2))+data[i-1].B;

                gotoxy(25,whereY-1);write(data[i].Hnet);

                a:=1;
                bias:=1;
                if(data[i].Hnet > 0) then data[i].Y:=1
                else if(data[i].Hnet = 0) then data[i].Y:=0
                else data[i].Y:=-1;

                if(data[i].Y<>data[i].target) then
                begin
                     bobot:=bobot+1;

                     data[i].Wa:=data[i].W1+(a*data[i].target*data[i].X1);
                     data[i].Wb:=data[i].W2+(a*data[i].target*data[i].X2);
                     data[i].Ba:=data[i].B+(a*data[i].target*bias);

                     data[i].W1:=data[i-1].W1+data[i].Wa;
                     data[i].W2:=data[i-1].W2+data[i].Wb;
                     data[i].B:=data[i-1].B+data[i].Ba;
                end
                else
                begin
                     bobot:=0;
                     data[i].W1:=data[i-1].W1;
                     data[i].W2:=data[i-1].W2;
                     data[i].B:=data[i-1].B;
                end;

                gotoxy(30,whereY);write(data[i].Y);
                gotoxy(34,whereY);write(data[i].Wa);
                gotoxy(39,whereY);write(data[i].Wb);
                gotoxy(44,whereY);write(data[i].Ba);
                gotoxy(49,whereY);write(data[i].W1);
                gotoxy(54,whereY);write(data[i].W2);
                gotoxy(59,whereY);write(data[i].B);

                writeln();
           end;
           epoch:=epoch+1;
           gotoxy(64,whereY-1);writeln('----> Epoch ke-',epoch);
     until(bobot=0);

     if(bobot=0) then
     begin
          writeln();
          for j:=1 to 4 do
          begin
                gotoxy(4,whereY);readln(data[i].X1);
                gotoxy(11,whereY-1);readln(data[i].X2);
                gotoxy(18,whereY-1);readln(data[i].target);

                data[i].Hnet:=((data[i].X1*data[i-1].W1)+(data[i].X2*data[i-1].W2))+data[i-1].B;

                gotoxy(25,whereY-1);write(data[i].Hnet);

                a:=1;
                bias:=1;
                if(data[i].Hnet > 0) then data[i].Y:=1
                else if(data[i].Hnet = 0) then data[i].Y:=0
                else data[i].Y:=-1;

                if(data[i].Y<>data[i].target) then
                begin
                     data[i].Wa:=data[i].W1+(a*data[i].target*data[i].X1);
                     data[i].Wb:=data[i].W2+(a*data[i].target*data[i].X2);
                     data[i].Ba:=data[i].B+(a*data[i].target*bias);

                     data[i].W1:=data[i-1].W1+data[i].Wa;
                     data[i].W2:=data[i-1].W2+data[i].Wb;
                     data[i].B:=data[i-1].B+data[i].Ba;
                end
                else
                begin
                     data[i].W1:=data[i-1].W1;
                     data[i].W2:=data[i-1].W2;
                     data[i].B:=data[i-1].B;
                end;

                gotoxy(30,whereY);write(data[i].Y);
                gotoxy(34,whereY);write(data[i].Wa);
                gotoxy(39,whereY);write(data[i].Wb);
                gotoxy(44,whereY);write(data[i].Ba);
                gotoxy(49,whereY);write(data[i].W1);
                gotoxy(54,whereY);write(data[i].W2);
                gotoxy(59,whereY);write(data[i].B);

                writeln();
           end;
           epoch:=epoch+1;
           gotoxy(64,whereY-1);writeln('----> Epoch ke-',epoch);
     end;
     readkey();
end.
