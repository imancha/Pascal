program deretprima;
uses crt;

var
   n,i,j,c,d,e,s : integer;

begin
     write('Nilai : '); readln(n);
     writeln();

     s:=1;
     if (n=1) then
     begin
          write(s);
     end
     else
     begin
          write(s,'2':5);
          for i:=3 to n do
          begin
               for j:=2 to i-1 do
               begin
                    if i mod j = 0 then
                    begin
                         c:=i;
                    end
                    else
                    begin
                         d:=i;
                    end;
               end;

               if (c<>d) then
               begin
                    write(d:5);
               end;
           end;
     end;
     readkey();
end.
