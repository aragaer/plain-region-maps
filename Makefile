include ../DATA_RULES
FILES = map.db
all: db_from_dump svg
	@echo "ALL"

svg:
	@echo "Building SVG files"
# Add here calls to GraphViz

db_from_dump:
	@echo "Building database from dump"
# Add here calls to sqlite3
