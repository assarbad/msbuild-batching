#!/usr/bin/env bash

BASEDIR="project"
if [[ ! -d "$BASEDIR" ]]; then
	mkdir -p "$BASEDIR"
fi
# main.cpp
printf "#include <cstdio>\n#include <cstdlib>\n#include \"main.hpp\"\n\nint main(int, char**)\n{\n"|tee "$BASEDIR/main.cpp"
printf ""|tee "$BASEDIR/main.hpp"
# Individual .cpp files
for name in $BASEDIR/{a..c}/{x..z}/file{0..9} $BASEDIR/a/{x,y}/file{10..19} $BASEDIR/b/z/file{20..29} $BASEDIR/c/z/file{10..99}; do
	test -d "${name%/*}" || mkdir -p "${name%/*}"
	printf "// %s\nextern \"C\" char const* %s()\n{\n\treturn __FILE__;\n}\n" "$name" "${name//\//_}"|tee "$name.cpp"
	printf "\tprintf(\"%%s%s\", %s());\n" '\n' "${name//\//_}" |tee -a "$BASEDIR/main.cpp"
	printf "extern \"C\" char const* %s();\n" "${name//\//_}" |tee -a "$BASEDIR/main.hpp"
done
# finalize main.cpp
printf "\n\treturn EXIT_SUCCESS;\n}\n"|tee -a "$BASEDIR/main.cpp"
premake4 vs2022
