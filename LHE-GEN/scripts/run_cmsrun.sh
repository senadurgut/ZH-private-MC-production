#!/bin/bash
set -e

# Debug: Check what files are available
echo "Current directory: $(pwd)"
echo "Files in current directory:"
ls -la

export SCRAM_ARCH=slc7_amd64_gcc700
source /cvmfs/cms.cern.ch/cmsset_default.sh

if [ -r CMSSW_10_6_21/src ] ; then
  echo "CMSSW_10_6_21 already exists"
else
  scram p CMSSW CMSSW_10_6_21
fi

cd CMSSW_10_6_21/src
eval `scram runtime -sh`

mkdir -p Configuration/GenProduction/python
cp ../../ZH_HToWW_ZTObb_20UL_16_cfg.py Configuration/GenProduction/python/


scram b
cd ../..

# Debug: Check if tarball is accessible
echo "Checking for tarball before running cmsRun:"
ls -la HZJ_Hto2Wto2L2Nu_modified.tgz || echo "Tarball not found!"

# Copy the tarball to /tmp to ensure it's accessible from any directory
cp HZJ_Hto2Wto2L2Nu_modified.tgz /tmp/
ls -la /tmp/HZJ_Hto2Wto2L2Nu_modified.tgz || echo "Failed to copy tarball to /tmp"

cmsRun ZH_HToWW_ZTObb_20UL_16_cfg.py
