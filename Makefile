
idrisid:
	@echo "Launching idrisid"
	pwd
	echo src/*.idr | entr sh -c 'make build'

build:	build/exec/main.js

build/exec/main.js:	src/Main.idr 
	idris2 -o main.js src/Main.idr --cg javascript

web:
	live-server