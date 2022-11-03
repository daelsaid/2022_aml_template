paralist.parallel = '1';
paralist.batchtemplatepath = '/oak/stanford/groups/menon/scsnlscripts/brainImaging/mri/fmri/preprocessing/spm12/preprocessfmrimodules/batchtemplates/';
paralist.spmversion = 'spm12';
paralist.parallel = '1';
paralist.subjectlist = 'subjectlist_all_aml_2022.txt';
paralist.spgrsubjectlist = 'subjectlist_all_aml_spgr.txt';
paralist.spgrfilename = 'skullstrip_spgr_spm12';
paralist.runlist = '/oak/stanford/groups/menon/projects/daelsaid/2022_aml/data/subjectlist/comp_mix_run2_runlist.txt';
paralist.pipeline = 'swgcar';
paralist.rawdatadir = '/oak/stanford/groups/menon/rawdata/scsnl';
paralist.projectdir = '/oak/stanford/groups/menon/projects/daelsaid/2022_aml/';
paralist.outputdirname = 'swgcar_spm12';
paralist.inputimgprefix = '';
paralist.trval = 0.49;paralist.discard_num = 16;
paralist.customslicetiming = 0;
paralist.slicetimingfile = '';
paralist.sliceacq= 'ascend';
paralist.smoothwidth = [6 6 6];
paralist.boundingboxdim = [nan nan nan; nan nan nan];


runconfig.jobcpus ='4';
runconfig.jobmem = '16G';
runconfig.jobtime= '5:00:00';
runconfig.overwrite='0';
runconfig.outputfile='${projectdir}/data/imaging/participants/${pid}/visit${visit}/session${session}/fmri/comp_mix_run2/swgcar_spm12/swgcarI.nii.gz'
