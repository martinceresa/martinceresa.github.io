all:
	stack build
	stack exec site clean
	stack exec site build

clean:
	stack exec site clean

watch:
	stack exec site watch
