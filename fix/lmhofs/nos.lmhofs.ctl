# control files for lmhofs, which is read in by shell script 

export DBASE_MET_NOW=HRRR
export DBASE_MET_FOR=HRRR:NDFD
export DBASE_WL_NOW=OBS
export DBASE_WL_FOR=OBS
export DBASE_TS_NOW=OBS
export DBASE_TS_FOR=OBS

export OCEAN_MODEL=FVCOM
export LEN_FORECAST=120
export IGRD_MET=2
export IGRD_OBC=0
export BASE_DATE=1858111700
export TIME_START=2015010100

export MINLON=-89.0
export MINLAT=41.0
export MAXLON=-78.0
export MAXLAT=47.0
export SCALE_HFLUX=1.0 
export CREATE_TIDEFORCING=-1
########################################################
##  static input file name, do not include path name
########################################################
export GRIDFILE=${PREFIXNOS}.grid.dat
export RIVER_CTL_FILE=${PREFIXNOS}.river.ctl
export RIVER_CLIM_FILE=${NET}.river.clim.usgs.nc
export OBC_CTL_FILE=${PREFIXNOS}.obc.ctl
export OBC_CLIM_FILE=${NET}.clim.WOA05.nc
export STA_OUT_CTL=${PREFIXNOS}_station.dat
export VGRID_CTL=${PREFIXNOS}.vgrid.dat
export RUNTIME_CTL=${PREFIXNOS}.fvcom.nml
export CORRECTION_STATION_CTL=${PREFIXNOS}.wlobc.correction.ctl
export WL_OFFSET_OLD=${PREFIXNOS}.wlobc.correction.old
export RESIDUAL_CTL=${PREFIXNOS}_residual_calculation.ctl
export STA_EDGE_CTL=${PREFIXNOS}_station_edge.dat
export NWM_REACHID_FILE=${PREFIXNOS}.nwm.reach.dat
export HC_FILE_NWLON=${NET}.HC_NWLON.nc
########################################################
# parameters for FVCOM RUN
########################################################
export NNODE=90806
export NELE=171377
export KBm=20
export DELT_MODEL=6.0
export EXTSTEP_SECONDS=6.0
export ISPLIT=2
export RST_OUT_INTERVAL=21600.0
export NSTA=360.0
export IREPORT=100
export NFLT=3600.0
export NC_OUT_INTERVAL=3600.0
export NCSF_OUT_INTERVAL=0.0
export NC_STA_INTERVAL=360.0
export NAVG=3600
#export NRIVERS=7
export MIN_DEPTH=0.1
export HEATING_LONGWAVE_LENGTHSCALE=3.6
export HEATING_LONGWAVE_PERCTAGE=0.55
export HEATING_SHORTWAVE_LENGTHSCALE=0.35
export NESTING_BLOCKSIZE=5

### Files Used in Model Run
export RIVER_NAMELIST=${PREFIXNOS}.nmelist.nml
export CORIOLISFILE=${PREFIXNOS}_cor.dat
export DEPTHFILE=${PREFIXNOS}_dep.dat
export RUNGRIDFILE=${PREFIXNOS}_grd.dat
export MODELOBCFILE=${PREFIXNOS}_obc.dat
export SIGMA_LEVEL=${PREFIXNOS}_sigma.dat
export SPONGEFILE=${PREFIXNOS}_spg.dat
export STATIONFILE=${PREFIXNOS}_station.dat
export InputNodeFile=${PREFIXNOS}.node.dat
export InputNode2LFile=${PREFIXNOS}.node.2LayerNd.dat

# Parameters Used in Model RUN
#export NRST=3600
#export NSTA=360
#export NFLT=3600
#export NHIS=3600
#export NAVG=3600
#export DCRIT="0.10d0     !m"
#export TOTAL_TASKS=560
export TOTAL_TASKS=630
#export TOTAL_TASKS=756
#############################################################
# GLOSSARY
# #############################################################
# GRIDFILE    :ocean model grid netCDF file including lon, lat, depth, etc.
# DBASE       :Name of NCEP atmospheric operational products, e.g. NAM, GFS, RTMA, NDFD, etc.
# DBASE_MET_NOW : Data source Name of NCEP atmospheric operational products for Nowcast run.
# DBASE_MET_FOR : Data source Name of NCEP atmospheric operational products for Forecast run.
# DBASE_WL_NOW  : Data source Name of water level open boundary conditions for Nowcast run.
# DBASE_WL_FOR  : Data source Name of water level open boundary conditions for Forecast run.
# DBASE_TS_NOW  : Data source Name of T & S open boundary conditions for Nowcast run.
# DBASE_TS_FOR  : Data source Name of T & S open boundary conditions for Forecast run.
# OCEAN_MODEL :Name of Hydrodynamic Ocean Model, e.g. ROMS, FVCOM, SELFE, etc.
# LEN_FORECAST:Forecast length of OFS forecast cycle.
# IGRD_MET    :spatial interpolation method for atmospheric forcing fields
#           =0:on native grid of NCEP products with wind rotated to earth coordinates
#	    =1:on ocean model grid (rotated to local coordinates) interpolated using remesh routine.
#	    =2:on ocean model grid (rotated to local coordinates) interpolated using bicubic routine.
#	    =3:on ocean model grid (rotated to local coordinates) interpolated using bilinear routine.
#           =4:on ocean model grid (rotated to local coordinates) interpolated using nature neighbors routine.
# IGRD_OBC    :spatial interpolation method for ocean open boundary forcing fields
# BASE_DATE   :base date for the OFS time system, e.g. YYYYMMDDHH (2008010100)
# TIME_START  :forecast start time/current time, e.g. 2008110600
# MINLON      :longitude of lower left/southwest corner to cover the OFS domain
# MINLAT      :latitude of lower left /southwest corner to cover the OFS domain
# MAXLON      :longitude of upper right/northeast corner to cover the OFS domain
# MAXLAT      :latitude of  upper right/northeast corner to cover the OFS domain
# THETA_S     :S-coordinate surface control parameter, [0 < theta_s < 20].
# THETA_B     :S-coordinate bottom  control parameter, [0 < theta_b < 1].
# TCLINE      :Width (m) of surface or bottom boundary layer in which
#             :higher vertical resolution is required during stretching.
# SCALE_HFLUX :scaling factor (fraction) of surface heat flux (net short-wave and downward
#              long-wave radiation). if =1.0, no adjustment to atmospheric products.  
# CREATE_TIDEFORCING : > 0, generate tidal forcing file
# HC_FILE_ADCIRC     : ADCIRC EC2001 harmonic constant file 
# HC_FILE_ROMS     : Tidal forcing file of ROMS (contains tide constituents of WL, ubar, and vbar) 
# EL_HC_CORRECTION   : > 0, correction elevation harmonics with user provided data
# FILE_EL_HC_CORRECTION : file name contains elevation harmonics for correction                
# RIVER_CTL_FILE  : File name contains river attributes (Xpos, Epos, Flag, River name,etc.)
# OBC_CTL_FILE  : Control file name for generating open boundary conditions (WL, T and S).
# IM          :GRID Number of I-direction RHO-points, it is xi_rho for ROMS
# JM          :GRID Number of J-direction RHO-points, it is eta_rho for ROMS
# DELT_ROMS   :Time-Step size in seconds.  If 3D configuration, DT is the
#              size of baroclinic time-step.  If only 2D configuration, DT
#              is the size of the barotropic time-step.
#  NDTFAST     Number of barotropic time-steps between each baroclinic time
#              step. If only 2D configuration, NDTFAST should be unity since
#              there is not need to splitting time-stepping.
# KBm         :Number of vertical levels at temperature points of OFS
#  NRST        Number of time-steps between writing of re-start fields.
#
#  NSTA        Number of time-steps between writing data into stations file.
#              Station data is written at all levels.
#
#  NFLT        Number of time-steps between writing data into floats file.
#  NHIS        Number of time-steps between writing fields into history file.
#
#  RDRG2       Quadratic bottom drag coefficient.
#
#  Zob         Bottom roughness (m).
#  AKT_BAK     Background vertical mixing coefficient (m2/s) for active
#              (NAT) and inert (NPT) tracer variables.
#  AKV_BAK     Background vertical mixing coefficient (m2/s) for momentum.
#
#  AKK_BAK     Background vertical mixing coefficient (m2/s) for turbulent
#              kinetic energy.
#
#  AKP_BAK     Background vertical mixing coefficient (m2/s) for turbulent
#              generic statistical field, "psi".
#
#  TKENU2      Lateral, harmonic, constant, mixing coefficient (m2/s) for
#              turbulent closure variables.
#
#  TKENU4      Lateral, biharmonic, constant mixing coefficient (m4/s) for
#              turbulent closure variables.
#  DCRIT       Minimum depth (m) for wetting and drying.
#  DSTART      Time stamp assigned to model initialization (days).  Usually
#              a Calendar linear coordinate, like modified Julian Day.  For
#              Example:
#  TIDE_START  Reference time origin for tidal forcing (days). This is the
#              time used when processing input tidal model data. It is needed
#              in routine "set_tides" to compute the correct phase lag with
#              respect ROMS/TOMS initialization time.
# TOTAL_TASKS  Total tasks to be run
