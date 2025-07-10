# ZH->bbww Signal MC Production
This is an ongoing work, and it's all for 2016 preVFP for now, next years will be added. 
# LHE-GEN Step
1. Start from existing gridpack:

```
#Run 2
/cvmfs/cms.cern.ch/phys_generator/gridpacks/UL/13TeV/powheg/V2/HZJ_slc7_amd64_gcc820_CMSSW_10_6_2_HZJ_HtoWW/v1/HZJ_slc7_amd64_gcc820_CMSSW_10_6_2_HZJ_HtoWW.tgz
#Run 3
/cvmfs/cms.cern.ch/phys_generator/gridpacks/RunIII/13p6TeV/slc7_amd64_gcc700/Powheg/V2/HZJ_Hto2Wto2L2Nu_slc7_amd64_gcc700_CMSSW_10_6_28_HZJ_M125.tgz
```

Untar,  and update the JHUGen card to match the desired final state.  Use "DecayMode1=10 DecayMode2=5". This will give  Z->all + H->WW->lnuqq, and then we have to apply an LHE filter to select Z->bbar events when interfacing the gridpack to pythia. 
2. Find fragment 
Go to MCM (https://cms-pdmv-prod.web.cern.ch/mcm/), find the dataset. The selected dataset is: 
```
HIG-RunIISummer20UL16wmLHEGEN-01510
```
Get the 'setup command' and 'fragment' for this dataset. 
The setup command for this dataset is saved as 'run_cmsDriver.sh'.
The fragment is saved as 'HIG-RunIISummer20UL16wmLHEGEN-01510-fragment.py'
Run the setup command:
```
source LHE-GEN/scripts/run_cmsDriver.sh
```
This script will run cmsDriver.py command with the fragment as input file, and will output a config file called 'HIG-RunIISummer20UL16wmLHEGEN-01510_1_cfg.py' 

We need to edit this config file to apply a custom LHE filter to select the Z->bb events before we can run it with cmsRun.
The edited config file is named: 'ZH_HToWW_ZTObb_20UL_16_cfg.py'
Now we can run it using cmsRun. 


