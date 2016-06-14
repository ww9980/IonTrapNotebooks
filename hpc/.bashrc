if [ -r /etc/bashrc ]; then
  . /etc/bashrc
fi

module load hdf5
ln -sf /research/amo/iqt/apps/etc/modulefiles/scuff-em ~/privatemodules/scuff-em
ln -sf /research/amo/iqt/apps/etc/modulefiles/gmsh/2.12.0 ~/privatemodules/gmsh
module load use.own
module load gmsh
module load scuff-em
module load python/2.7.11
module load lapack/gcc/64/3.4.2
module load blas
module load paraview
module add matlab/R2012b
module add gcc
module add openfoam
mkdir -p $WM_PROJECT_USER_DIR
mkdir -p $FOAM_RUN
mkdir -p $FOAM_USER_APPBIN
module add gnuplot
module add julia
module add R
module add openmpi
