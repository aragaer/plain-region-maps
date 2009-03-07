reg=$1;
regr=`echo $reg | tr _ \ `

exec_sqlite="sqlite3 -batch map.db"

regid=`echo "select regionID from mapRegions where regionName='$regr';" | $exec_sqlite`

q="select f.solarSystemName, t.solarSystemName \
from mapSolarSystemJumps as j \
left join mapSolarSystems as f on fromSolarSystemID=f.solarSystemID 	\
left join mapSolarSystems as t on toSolarSystemID=t.solarSystemID	\
where j.regionID=$regid;"

echo 'graph "$reg" {' > "$reg.dot"
echo 'graph [overlap=compress, size="15,10"]' >> "$reg.dot"
echo 'node [fontsize="60", id="\L"]' >> "$reg.dot"
echo 'edge [len=0.05]' >> "$reg.dot"
echo $q | $exec_sqlite | sed -e 's/|/" -- "/' -e 's/^/"/' -e 's/$/"/' >> "$reg.dot"
echo "}" >> "$reg.dot"

fdp -Tsvg "$reg.dot" > "$reg.svg"

sed -i -e 's/id="node.*"\(.*\)<title>\(.*\)<\/title>/id="\2"\1/' \
       -e 's/font-size:\(.*\)\.0*/font-size:\1px/' "$reg.svg"
rm "$reg.dot"
