#!/bin/bash -l
#
# allocate 16 nodes (64 CPUs) for 6 hours
#PBS -l nodes=2:ppn=40,walltime=01:00:00
#
# job name 
#PBS -N MoS2.phon
#
# stdout and stderr files
#PBS -o run.out -e run.err
#
# first non-empty non-comment line ends PBS options

export OMP_NUM_THREADS=1

module load intel64
module load gcc

echo $PBS_O_WORKDIR
cd $PBS_O_WORKDIR

mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_030_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_035_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_040_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_045_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_050_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_055_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_060_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_065_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_070_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_075_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_080_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_085_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_090_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_095_8.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $HOME/bin/qe/mpi/pw.x -i $HOME/Exercise_sheet_1/Exercise_1/1_d/MgO_100_8.in
