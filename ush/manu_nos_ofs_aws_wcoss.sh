#!/bin/sh
#  Script Name:  nos_ofs_aws_wcoss.sh
#  Purpose:                                                                   #
#  This script is to copy model files to corresonding directories after       #
#  successfully completing nowcast and forecast simulations and tar the       #
#  files for uploading to cloud                                               #
#  Technical Contact:   Aijun Zhang         Org:  NOS/CO-OPS                  #
#                       Phone: 240-533-0591                                   #
#                       E-Mail: aijun.zhang@noaa.gov                          #
#                                                                             #
#                                                                             #
###############################################################################
# --------------------------------------------------------------------------- #
#  Control Files For Model Run
if [ -s ${FIXofs}/${PREFIXNOS}.ctl ]
then
  . ${FIXofs}/${PREFIXNOS}.ctl
else
  echo "${RUN} control file is not found"
  echo "please provide  ${RUN} control file of ${PREFIXNOS}.ctl in ${FIXofs}"
  msg="${RUN} control file is not found"
  postmsg "$jlogfile" "$msg"
  postmsg "$nosjlogfile" "$msg"
  echo "${RUN} control file is not found"  >> $cormslogfile
  err_chk
fi
set -xa
echo ' '
echo '  		    ****************************************'
echo '  		    *** NOS OFS AWS SCRIPT  ***        '
echo '  		    ****************************************'
echo ' '
echo "Starting nos_ofs_aws_wcoss.sh at : `date`"
###############################################################################

export OBC_FORCING_FILE=${PREFIXNOS}.obc.$PDY.t${cyc}z.nc
export OBC_FORCING_FILE_EL=${PREFIXNOS}.obc.el.$PDY.t${cyc}z.nc
export OBC_FORCING_FILE_TS=${PREFIXNOS}.obc.ts.$PDY.t${cyc}z.nc
export RIVER_FORCING_FILE=${PREFIXNOS}.river.$PDY.t${cyc}z.nc
export INI_FILE_NOWCAST=${PREFIXNOS}.init.nowcast.$PDY.t${cyc}z.nc
export HIS_OUT_NOWCAST=${PREFIXNOS}.fields.nowcast.$PDY.t${cyc}z.nc
export AVG_OUT_NOWCAST=${PREFIXNOS}.avg.nowcast.$PDY.t${cyc}z.nc
export MOD_4DVAR=${PREFIXNOS}.mod.$PDY.t${cyc}z.nc
export STA_OUT_NOWCAST=${PREFIXNOS}.stations.nowcast.$PDY.t${cyc}z.nc
export RST_OUT_NOWCAST=${PREFIXNOS}.rst.nowcast.$PDY.t${cyc}z.nc
export MET_NETCDF_1_NOWCAST=${PREFIXNOS}.met.nowcast.$PDY.t${cyc}z.nc
export MET_NETCDF_2_NOWCAST=${PREFIXNOS}.hflux.nowcast.$PDY.t${cyc}z.nc
export OBC_TIDALFORCING_FILE=${PREFIXNOS}.roms.tides.$PDY.t${cyc}z.nc
export OBC_FORCING_FILE_NWGOFS_NOW=${PREFIXNOS}.nestnode.nwgofs.nowcast.$PDY.t${cyc}z.nc
export OBC_FORCING_FILE_NEGOFS_NOW=${PREFIXNOS}.nestnode.negofs.nowcast.$PDY.t${cyc}z.nc
export OBC_FORCING_FILE_NWGOFS_FOR=${PREFIXNOS}.nestnode.nwgofs.forecast.$PDY.t${cyc}z.nc
export OBC_FORCING_FILE_NEGOFS_FOR=${PREFIXNOS}.nestnode.negofs.forecast.$PDY.t${cyc}z.nc
export OBS_FORCING_FILE=${PREFIXNOS}.obs.$PDY.t${cyc}z.nc

#export INI_FILE_FORECAST=$RST_OUT_NOWCAST
export HIS_OUT_FORECAST=${PREFIXNOS}.fields.forecast.$PDY.t${cyc}z.nc
export STA_OUT_FORECAST=${PREFIXNOS}.stations.forecast.$PDY.t${cyc}z.nc
export AVG_OUT_FORECAST=${PREFIXNOS}.avg.forecast.$PDY.t${cyc}z.nc
export RST_OUT_FORECAST=${PREFIXNOS}.rst.forecast.$PDY.t${cyc}z.nc
export MET_NETCDF_1_FORECAST=${PREFIXNOS}.met.forecast.$PDY.t${cyc}z.nc
export MET_NETCDF_2_FORECAST=${PREFIXNOS}.hflux.forecast.$PDY.t${cyc}z.nc
export MODEL_LOG_NOWCAST=${PREFIXNOS}.nowcast.$PDY.t${cyc}z.log
export MODEL_LOG_FORECAST=${PREFIXNOS}.forecast.$PDY.t${cyc}z.log
export RUNTIME_CTL_NOWCAST=${PREFIXNOS}.nowcast.$PDY.t${cyc}z.in
export RUNTIME_CTL_FORECAST=${PREFIXNOS}.forecast.$PDY.t${cyc}z.in
export NUDG_FORCING_FILE=${PREFIXNOS}.clim.$PDY.t${cyc}z.nc
if [ ${OCEAN_MODEL} == "SELFE" -o ${OCEAN_MODEL} == "selfe" ]
then
  export MET_NETCDF_1_NOWCAST=${PREFIXNOS}.met.nowcast.$PDY.t${cyc}z.nc.tar
  export MET_NETCDF_1_FORECAST=${PREFIXNOS}.met.forecast.$PDY.t${cyc}z.nc.tar
  export OBC_FORCING_FILE=${PREFIXNOS}.obc.$PDY.t${cyc}z.tar
  export OBC_FORCING_FILE_EL=${PREFIXNOS}.obc.el.$PDY.t${cyc}z.tar
  export OBC_FORCING_FILE_TS=${PREFIXNOS}.obc.ts.$PDY.t${cyc}z.tar
  export RIVER_FORCING_FILE=${PREFIXNOS}.river.$PDY.t${cyc}z.th.tar
  export INI_FILE_NOWCAST=${PREFIXNOS}.init.nowcast.$PDY.t${cyc}z.bin
  export RST_OUT_NOWCAST=${PREFIXNOS}.rst.nowcast.$PDY.t${cyc}z.bin
  export RST_OUT_FORECAST=${PREFIXNOS}.rst.forecast.$PDY.t${cyc}z.bin
#  export INI_FILE_FORECAST=$RST_OUT_NOWCAST
  export RUNTIME_MET_CTL_NOWCAST=${PREFIXNOS}.met_ctl.nowcast.$PDY.t${cyc}z.in
  export RUNTIME_MET_CTL_FORECAST=${PREFIXNOS}.met_ctl.forecast.$PDY.t${cyc}z.in
  export RUNTIME_COMBINE_RST_NOWCAST=${PREFIXNOS}.combine.hotstart.nowcast.$PDY.t${cyc}z.in
  export RUNTIME_COMBINE_NETCDF_NOWCAST=${PREFIXNOS}.combine.netcdf.nowcast.$PDY.t${cyc}z.in
  export RUNTIME_COMBINE_NETCDF_FORECAST=${PREFIXNOS}.combine.netcdf.forecast.$PDY.t${cyc}z.in
  export RUNTIME_COMBINE_NETCDF_STA_NOWCAST=${PREFIXNOS}.combine.netcdf.sta.nowcast.$PDY.t${cyc}z.in
  export RUNTIME_COMBINE_NETCDF_STA_FORECAST=${PREFIXNOS}.combine.netcdf.sta.forecast.$PDY.t${cyc}z.in
elif [ ${OCEAN_MODEL} == "FVCOM" -o ${OCEAN_MODEL} == "fvcom" ]
then
  export RIVER_FORCING_FILE=${PREFIXNOS}.river.$PDY.t${cyc}z.nc.tar
fi
cd $COMOUT

STATUS_FILE=${RUN}.status
if [ -s ${RUN}.status_${cyc} ]; then
  STATUS_FILE=${RUN}.status_${cyc}
else
  STATUS_FILE=${RUN}.status
fi
if [ -f $STATUS_FILE ]
then
  cp -p  $STATUS_FILE   $DATA
fi

# 1  copy nowcast output 
# 1.1 Nowcast log 
if [ -f ${MODEL_LOG_NOWCAST} ]
then
  cp -p  ${MODEL_LOG_NOWCAST} $DATA
fi
# 1.2 STA nowcast
if [ -f $STA_OUT_NOWCAST ]
then
  cp -p $STA_OUT_NOWCAST $DATA
fi
# 1.3 HIS nowcast 2D (if any) and 3D fields
nfile_2d=`ls ${PREFIXNOS}.2ds.n*t${cyc}z.nc |wc -l`
if [ $nfile_2d -ge 1 ]; then
 cp -p ${PREFIXNOS}.2ds.n*t${cyc}z.nc $DATA
fi

cp -p ${PREFIXNOS}.fields.n*t${cyc}z.nc  $DATA

if [ -f $AVG_OUT_NOWCAST ]
then
  cp -p $AVG_OUT_NOWCAST $DATA
fi
if [ -f $MOD_4DVAR ]
then
  cp -p $MOD_4DVAR $DATA
fi

# 1.4 RST nowcast
dday=${PDY:6:2} #extract day only
if [ $dday = '01' -o $dday = '11' -o  $dday = '21' ]; then
  if [ ${cyc} = "00" -o ${cyc} = "03" ]; then
    cp -p $INI_FILE_NOWCAST $DATA
  fi
fi
if [ $OFS = 'wcofs_da' ]; then
  cp -p $INI_FILE_NOWCAST $DATA
  cp -p ${INI_FILE_NOWCAST}.new $DATA
fi
# 1.5 OBC Forcing 
if [ -f $OBC_FORCING_FILE ]
then
  cp -p $OBC_FORCING_FILE  $DATA
fi
if [ -f $OBC_FORCING_FILE_EL ]
then
 cp -p $OBC_FORCING_FILE_EL $DATA
fi
if [ -f $OBC_FORCING_FILE_TS ]
then
  cp -p $OBC_FORCING_FILE_TS $DATA
fi
if [ -f $NUDG_FORCING_FILE ]; then
  cp -p $NUDG_FORCING_FILE $DATA
fi

#if [ -f $OBC_TIDALFORCING_FILE ]
#then
#  cp -p $OBC_TIDALFORCING_FILE  $DATA
#fi
# 1.6 River Forcing 
if [ -f $RIVER_FORCING_FILE ]
then
   cp -p $RIVER_FORCING_FILE $DATA
fi
# 1.7 Surface Forcing 
if [ -f $MET_NETCDF_1_NOWCAST ]
then
  cp -p $MET_NETCDF_1_NOWCAST $DATA
fi
# 1.8 Surface Forcing 2
#if [ -f $MET_NETCDF_2_NOWCAST ]
#then
#  cp -p $MET_NETCDF_2_NOWCAST $DATA
#fi
# 1.9 Model runtime control file for nowcast
if [ -f $RUNTIME_CTL_NOWCAST ]
then
  cp -p $RUNTIME_CTL_NOWCAST $DATA
fi

if [ -f $OBC_FORCING_FILE_NWGOFS_NOW ]; then
   cp -p $OBC_FORCING_FILE_NWGOFS_NOW $DATA
fi

if [ -f $OBC_FORCING_FILE_NEGOFS_NOW ]; then
   cp -p $OBC_FORCING_FILE_NEGOFS_NOW  $DATA
fi
if [ -f $OBC_FORCING_FILE_NWGOFS_FOR ]; then
   cp -p $OBC_FORCING_FILE_NWGOFS_FOR  $DATA
fi
if [ -f $OBC_FORCING_FILE_NEGOFS_FOR ]; then
   cp -p $OBC_FORCING_FILE_NEGOFS_FOR  $DATA
fi
if [ -f $OBS_FORCING_FILE ]; then
   cp -p $OBS_FORCING_FILE  $DATA
fi


# --------------------------------------------------------------------------- #
# 2  copy forecast output
# 2.1 forecast log 
if [ -f ${MODEL_LOG_FORECAST} ]
then
  cp -p ${MODEL_LOG_FORECAST}  $DATA 
fi
# 2.2 STA FORECAST
if [ -f $STA_OUT_FORECAST ]
then
  cp -p $STA_OUT_FORECAST $DATA
fi
# 2.3 HIS FORECAST (Only transfer 48-hour forecast (2D if exist or 3D) during development)
nfile=`ls ${PREFIXNOS}.2ds.f*t${cyc}z.nc |wc -l`
if [ $nfile -ge 1 ]; then
 cp -p ${PREFIXNOS}.2ds.f*t${cyc}z.nc $DATA
fi
#if [ $nfile -ge 1 ]; then
#  I=0
#  while (( I < 49))
#  do
#    fhr3=`echo $I |  awk '{printf("%03i",$1)}'`
#    fileout=${PREFIXNOS}.2ds.f${fhr3}.$PDY.t${cyc}z.nc
#    if [ -s $fileout ]; then
#      cp -p ${fileout} $DATA
#    fi
#    (( I = I + 1 ))
#  done
#
#fi
#  I=0
#  while (( I < 49))
#  do
#    fhr3=`echo $I |  awk '{printf("%03i",$1)}'`
#    fileout=${PREFIXNOS}.fields.f${fhr3}.$PDY.t${cyc}z.nc
#    if [ -s $fileout ]; then
#      cp -p ${fileout} $DATA
#    fi
#    (( I = I + 1 ))
#  done
cp -p ${PREFIXNOS}.fields.f*t${cyc}z.nc  $DATA
if [ -f $AVG_OUT_FORECAST ]
then
  cp -p $AVG_OUT_FORECAST $DATA
fi

# 2.4 Surface Forcing 
if [ -f $MET_NETCDF_1_FORECAST ]
then
  cp -p $MET_NETCDF_1_FORECAST $DATA
fi
# 2.5 Surface Forcing 2
#if [ -f $MET_NETCDF_2_FORECAST ]
#then
#  cp -p $MET_NETCDF_2_FORECAST  $DATA
#fi
# 2.6 Model runtime control file for FORECAST
if [ -f $RUNTIME_CTL_FORECAST ]
then
  cp -p $RUNTIME_CTL_FORECAST  $DATA
fi
# 2.7 CORMS FLAG file for forecast
if [ -f ${PREFIXNOS}.corms.${PDY}.${cycle}.log ]
then
  cp -p ${PREFIXNOS}.corms.${PDY}.${cycle}.log  $DATA
fi
# 2.8 jlog file for nowcast and forecast
if [ -f ${PREFIXNOS}.jlogfile.${PDY}.${cycle}.log ]
then
  cp -p ${PREFIXNOS}.jlogfile.${PDY}.${cycle}.log  $DATA
fi

if [ -f ${PREFIXNOS}.jlog.${PDY}.${cycle}.log ]
then
  cp -p ${PREFIXNOS}.jlog.${PDY}.${cycle}.log  $DATA
fi

# 2.9 OFS status file for nowcast and forecast
if [ -f $STATUS_FILE ]
then
  cp -p  $STATUS_FILE   $DATA
fi
## Tar folder to a tar file
cd $DATA
#tarfile=${OFS}.${PDY}${cyc}.${envir}.tar
tar -cf ../${tarfile} .
echo started uploading at `date`
#cd ~/s3test
#python s3_upload_file.py ${DATAROOT}/${tarfile} ${tarfile}
aws s3 cp ${DATAROOT}/${tarfile} s3://co-ops.nceptransfer/${tarfile}
export err=$?
if [ $err -ne 0 ]
then
  echo "File transfer to AWS did not complete normally"
  msg="File transfer to AWS did not complete normally"
 # postmsg "$jlogfile" "$msg"
  echo "AWS NOWCAST/FORECAST DONE 0" >> $cormslogfile
else
  echo "File transfer to AWS completed normally"
  msg="File transfer to AWS completed normally"
  #postmsg "$jlogfile" "$msg"
  echo "AWS NOWCAST/FORECAST DONE 100" >> $cormslogfile
fi
# --------------------------------------------------------------------------- #
# 4.  Ending output

  echo ' '
  echo "Ending nos_ofs_aws_wcoss.sh at : `date`"
  echo ' '
  echo '        *** End of NOS OFS AWS SCRIPT ***'
  echo ' '
