#!/bin/bash -l
. /lfs/h1/nos/nosofs/noscrub/aijun.zhang/packages/nosofs.v3.6.0/versions/run.ver
module load envvar/${envvars_ver:?}
module load PrgEnv-intel/${PrgEnv_intel_ver}
module load craype/${craype_ver}
module load intel/${intel_ver}
rm -f /lfs/h1/nos/ptmp/aijun.zhang/rpt/v3.6.0/lsofs_*_18.out
rm -f /lfs/h1/nos/ptmp/aijun.zhang/rpt/v3.6.0/lsofs_*_18.err
export LSFDIR=/lfs/h1/nos/nosofs/noscrub/aijun.zhang/packages/nosofs.v3.6.0/pbs 
PREP=$(qsub  $LSFDIR/jnos_lsofs_prep_18.pbs) 
NFRUN=$(qsub -W depend=afterok:$PREP $LSFDIR/jnos_lsofs_nowcst_fcst_18.pbs)
qsub -W depend=afterok:$NFRUN $LSFDIR/jnos_lsofs_aws_18.pbs
