REGIONS=
for i in `sqlite3 map.db 'select regionName from mapRegions;' | tr \  _ `
do
	REGIONS="$REGIONS $i.svg"
done
make $REGIONS
