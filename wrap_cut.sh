dossier='multi_bands_tif'
cd $dossier
for f in $dossier/*$workdir/*
do
	echo $f
	b=$(basename $f)
	c=$(dirname $f)
	mkdir $c/gare_sud/
	echo $b
	echo $c
	OTB-7.3.0-Linux64/bin/gdalwarp -q -cutline target_shape_file.shp -crop_to_cutline -tr 10.0 10.0 -of GTiff $f $c/target_shape_file/$b
done
