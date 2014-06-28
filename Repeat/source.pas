program ulang;
uses crt;

var
   x : char;

begin
     repeat
           write('Input [Y/T] : '); readln(x);
           writeln();
           x := upcase(x);

           if ((x<>'Y') and (x<>'T')) then
           begin
                writeln('Maho Detected');
                writeln();
           end;

           if ((x='Y') and (x<>'T')) then
           begin
                writeln('Anda menekan tombol Y');
                writeln();
           end;
     until (x='T');
     write('Press any key to continue...');
     readkey();
end.
