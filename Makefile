include ../DATA_RULES
DB = map.db
DUMP = map.dump
all: $(DB) svg
	cp $(DB) *.svg $(OUT_DIR)

svg:
	@echo "Building SVG files"
	./make_all.sh
clean:
	-rm *.db *.svg
