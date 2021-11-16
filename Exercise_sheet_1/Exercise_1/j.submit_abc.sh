#!/bin/bash -l
#
# allocate 16 nodes (64 CPUs) for 1 hours
#PBS -l nodes=1:ppn=40,walltime=01:00:00
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

mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_040.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_045.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_050.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_055.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_060.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_065.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_070.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_075.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_080.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_085.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_090.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_095.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_100.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_105.in
mpirun -np 20 -genv I_MPI_PERHOST=allcores  $~/bin/qe/mpi/pw.x -i $~/Exercise_sheet_1/Exercise_1MgO_110.in
