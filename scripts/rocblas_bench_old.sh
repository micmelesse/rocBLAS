cd /root/rocBLAS/build/release/clients/staging
while read p; do
    ROCBLAS_COMMAND="TENSILE_DB=2 ${p//\"}"

    eval $ROCBLAS_COMMAND
  
 

done <$1 &>$2

chmod 777 $2
