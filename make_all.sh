for i in `sqlite3 map.db 'select regionName from mapRegions;' | sed -e 's/ /_/g' `
do
	i=`echo $i | sed -e 's/_/ /g'`
	./make_flat_reg.sh "$i"
done
