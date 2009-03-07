include ../DATA_RULES
DB = map.db
all: $(DB) svg
	cp $(DB) $(OUT_DIR)
	for i in `ls *.svg` ; do cp $$i "$(OUT_DIR)/`echo $$i | tr _ \ `" ; done
svg:
	@echo "Building SVG files"
	./make_all.sh
clean:
	-rm *.db *.svg

%.svg:
	@echo Making svg file for region $*
	@./make_flat_reg.sh $*
