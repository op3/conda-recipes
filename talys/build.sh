datapath="${PREFIX}/share/"
#datapathnew=`echo $datapath | sed 's/.\{50\}/&\\\\\&\\\\\n           \\\\\&/g' | sed 's/\//\\\\\//g' `
datapathnew=`echo $datapath | sed 's/\//\\\\\//g' `
cd 'source'
sed "s/ home='.*'/ home='${datapathnew}'/" machine.f  > machine_tmp.f
awk -v WIDTH=72 '{
    while (length>WIDTH) {
        print substr($0,1,WIDTH) "&";
        $0="     &"substr($0,WIDTH+1);
    }
    print;
}' machine_tmp.f > machine_tmp2.f
mv -f machine_tmp2.f machine.f
rm -f machine_tmp.f

$FC -fpic -mcmodel=medium -c *.f
$FC *.o -o talys

install -Dm 0755 talys ${PREFIX}/bin/talys
cd ..

for dir in structure samples doc; do
    find $dir -type f -exec install -Dm 644 "{}" "${PREFIX}/share/talys/{}" \;
done
