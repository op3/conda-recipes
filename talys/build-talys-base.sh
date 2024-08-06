#!/usr/bin/env sh
datapath="${PREFIX}/share/talys"
#datapathnew=`echo $datapath | sed 's/.\{50\}/&\\\\\&\\\\\n           \\\\\&/g' | sed 's/\//\\\\\//g' `
datapathnew=$(echo $datapath | sed 's/\//\\\//g')
cd 'source' || exit

# Setup talys data directory
sed -i "s/^  codedir = '.*'/  codedir = '${datapathnew}/'/" machine.f90

# Hardcoding the username does not make any sense
sed -i "s/^  user = '.*'/  call getenv('USER',user)/" machine.f90

# Paths can become quite long
for f in *.f90; do
  sed -i 's/len=132\(.*dir\)/len=1024\1/' "$f"
  sed -i 's/len=132\(.*path\)/len=1024\1/' "$f"
  sed -i 's/len=132\(.*file\)/len=1024\1/' "$f"
done

#awk -v WIDTH=72 '{
#    while (length>WIDTH) {
#        print substr($0,1,WIDTH) "&";
#        $0="     &"substr($0,WIDTH+1);
#    }
#    print;
#}' machine_tmp.f > machine_tmp2.f
#mv -f machine_tmp2.f machine.f
#rm -f machine_tmp.f

$FC -fpic -c *.f
$FC *.o -o talys

install -Dm 0755 talys ${PREFIX}/bin/talys
