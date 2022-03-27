#!/usr/bin/env pwsh

# CD grass/

# Install OSGeo4W
$exe = 'osgeo4w-setup.exe'
$url = 'http://download.osgeo.org/osgeo4w/v2/' + $exe
dir
(New-Object System.Net.WebClient).DownloadFile($url, $exe)
dir
Start-Process ('.\'+$exe) -ArgumentList '-A -g -k -q -s http://download.osgeo.org/x86_64 -P proj-devel,gdal-devel,geos-devel,libtiff-devel,libpng-devel,pdal-devel,netcdf-devel,cairo-devel,fftw,freetype-devel,gdal-ecw,gdal-mrsid,liblas-devel,libxdr,libpq-devel,pdcurses,python3-matplotlib,python3-numpy,python3-ply,python3-pywin32,python3-six,python3-wxpython,regex-devel,wxwidgets-devel,zstd-devel' -Wait

# Install MSYS2 packages
C:\msys64\usr\bin\pacman.exe --noconfirm -S tar libintl make bison flex diffutils git dos2unix zip mingw-w64-x86_64-toolchain mingw-w64-x86_64-cairo mingw-w64-x86_64-fftw mingw-w64-x86_64-lapack mingw-w64-x86_64-pkg-config mingw-w64-x86_64-gcc mingw-w64-x86_64-ccache mingw-w64-x86_64-zlib mingw-w64-x86_64-libiconv mingw-w64-x86_64-bzip2 mingw-w64-x86_64-gettext mingw-w64-x86_64-libsystre mingw-w64-x86_64-libtre-git mingw-w64-x86_64-libwinpthread-git mingw-w64-x86_64-libpng mingw-w64-x86_64-pcre mingw-w64-x86_64-python3-six

# Compile GRASS GIS
CD grass
C:\msys64\usr\bin\bash.exe -l (''+(Get-Location)+'\.github\workflows\build_osgeo4w.sh') (Get-Location)
CD $HOME

#   - name: Test executing of the grass command
#     run: .github/workflows/test_simple.bat 'C:\OSGeo4W\opt\grass\grass81.bat'

#   - name: Test executing of the grass command in bash
#     run: C:\msys64\usr\bin\bash.exe .github/workflows/test_simple.sh

#   - name: Run tests
#     run: .github/workflows/test_thorough.bat 'C:\OSGeo4W\opt\grass\grass81.bat' 'C:\OSGeo4W\bin\python3'

# CD $HOME