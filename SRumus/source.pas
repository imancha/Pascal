program srumus;
uses crt;

var
   x,y,n : integer;
   result : real;
   show,temp : string;

begin
     readln(n);

     show := 'S = 1';
     y:=1;
     result:=1.0;

     if n = 1 then
     begin
          write(show,' = ',result:0:3);
     end
     else
     begin
          for x:=2 to n do
          begin
               y:=y+2;

               if x mod 2 = 1 then
               begin
                    result := result+(real(x)/real(y));
                    show:=show+'+';
               end
               else
               begin
                    result := result-(real(x)/real(y));
                    show:=show+'-';
               end;
               str(x,temp);
               show:=show+'('+temp+'/';
               str(y,temp);
               show:=show+temp+')';
          end;
     show:=show+'=';
     writeln(show,result:4:3);
     end;
     readkey();
end.
