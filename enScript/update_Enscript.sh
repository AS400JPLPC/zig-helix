#!/bin/sh


#put the access path in clear text, of the enscript.st file
match="modula_2;"
insert="  \/\\\.zig\$\/					zig;"

file='/usr/share/enscript/hl/enscript.st'


sed -i "s/$match/$match\n$insert/" $file



exit 0
