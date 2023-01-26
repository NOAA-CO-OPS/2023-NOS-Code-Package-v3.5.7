#!/bin/bash -l
. /lfs/h1/nos/nosofs/noscrub/aijun.zhang/packages/nosofs.v3.6.0/versions/run.ver
module purge 
module load envvar/${envvars_ver:?}
module load PrgEnv-intel/${PrgEnv_intel_ver}
module load craype/${craype_ver}
module load intel/${intel_ver}
export LSFDIR=/lfs/h1/nos/nosofs/noscrub/aijun.zhang/packages/nosofs.v3.6.0/pbs 
rm -f /lfs/h1/nos/ptmp/aijun.zhang/rpt/v3.6.0/glofs_aws_12_prod.out
rm -f /lfs/h1/nos/ptmp/aijun.zhang/rpt/v3.6.0/glofs_aws_12_prod.err
qsub $LSFDIR/jnos_glofs_aws_12.prod
