program bketupat;
uses crt;

var
   i,n,j : integer;

begin
     write('Nilai : '); readln(n);
     writeln();

     for i:=0 to (2*n) do
     begin
          for j:=0 to (2*n) do
          begin
               if (i<n) then
               begin
                    if ((j>n-i) and (j<n+i)) then
                    begin
                         write(' ');
                    end
                    else
                    begin
                         write('*');
                    end;
               end
               else
               begin
                    if ((j>i-n) and (j<3*n-i)) then
                    begin
                         write(' ');
                    end
                    else
                    begin
                         write('*');
                    end;
               end;
          end;
          writeln();
     end;
     readkey();
end.
