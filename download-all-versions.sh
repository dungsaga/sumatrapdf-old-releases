#!/usr/bin/env bash

wget https://www.sumatrapdfreader.org/docs/Version-history

# find strings like '3.4.6 (2022-06-08)', then cut out the version
versions=$(grep -oE '[0-9](\.[0-9]){1,2} \(20[0-9][0-9]-[0-1][0-9]-[0-3][0-9]\)' Version-history | cut -d' ' -f1)

# download 64bit releases (only exist since version 3.1)
for v in $versions ; do [[ $v =~ ^[0-2]\. ]] || wget https://www.sumatrapdfreader.org/dl/rel/$v/SumatraPDF-$v-64-install.exe ; done
for v in $versions ; do [[ $v =~ ^[0-2]\. ]] || wget https://www.sumatrapdfreader.org/dl/rel/$v/SumatraPDF-$v-64.zip ; done

# download 32bit releases
for v in $versions ; do wget https://www.sumatrapdfreader.org/dl/rel/$v/SumatraPDF-$v-install.exe ; done
for v in $versions ; do wget https://www.sumatrapdfreader.org/dl/rel/$v/SumatraPDF-$v.zip ; done
