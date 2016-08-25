
echo "Printing mean CV error:"

for i in {2..15};
do
#    echo $i
    grep -h CV replicate*/*.log$i.out| cut -f 2 -d ":"| awk '{ total += $1; count++ } END { print total/count }';
done
echo "==============="
echo "Printing min CV error for each K:"

for i in {2..15};
do
    grep -h CV replicate*/*.log$i.out| cut -f 2 -d ":"| awk 'NR == 1 || $1 < min {line = $0; min = $1}END{print line}'
done
