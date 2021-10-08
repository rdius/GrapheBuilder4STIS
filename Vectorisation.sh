dossier=".../4.20.3/segmented"

cd  $dossier
for a in $(ls *_merged.tif) do 
do
   echo "============="$a
   mkdir -p $dossier/withoutnodata
   mkdir -p $dossier/shapefile
   /OTB-7.3.0-Linux64/bin/gdal_translate -of GTiff -a_nodata 0  $dossier/$a   $dossier/withoutnodata/$a

done 
 
cd  $dossier
 
for a2 in $(ls *_merged.tif) do 
do
   
   /OTB-7.3.0-Linux64/bin/otbcli_LSMSVectorization -in $a2 -inseg $dossier/withoutnodata/$a2 -out $dossier/shapefile/$a2.shp
done


