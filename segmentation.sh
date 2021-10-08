dossier="/multi_bands_tif/2018/"
splist=(50)
ranger=(100)
minsize=(30)
for sp in ${splist[@]}
do      
        for ranger in ${ranger[@]}      
        do
             for minsize in ${minsize[@]}    
                do
                      
			mkdir -p $dossier/$sp.$ranger.$minsize/segmented
                        cd  $dossier
                        for a in $(ls *.tif)
                        do
                           echo "============="$sp
                          TB-7.3.0-Linux64/bin/otbcli_LargeScaleMeanShift -in $a -spatialr $sp -ranger $ranger -minsize $minsize -mode.vector.out $dossier/$sp.$ranger.$minsize/segmented/$a 			  
						  
                        done						
                done
        done
  
done 
