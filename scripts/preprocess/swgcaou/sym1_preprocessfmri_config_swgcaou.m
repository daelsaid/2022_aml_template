paralist.batchtemplatepath = '/oak/stanford/groups/menon/scsnlscripts/brainImaging/mri/fmri/preprocessing/spm12/preprocessfmrimodules/batchtemplates/';
paralist.spmversion = 'spm12';
paralist.parallel = '1';

paralist.subjectlist = 'subjectlist_all_aml_2022.txt';
paralist.spgrsubjectlist ='subjectlist_all_aml_spgr.txt';



paralist.runlist = '/oak/stanford/groups/menon/projects/daelsaid/2022_aml/data/subjectlist/sym1_runlist.txt';

paralist.rawdatadir = '/oak/stanford/groups/menon/rawdata/scsnl';
paralist.projectdir = '/oak/stanford/groups/menon/projects/daelsaid/2022_aml/';

paralist.spgrfilename = 'skullstrip_spgr_spm12';
paralist.pipeline = 'swgcaou';

paralist.outputdirname = 'swgcaou_spm12';
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
runconfig.outputfile='${projectdir}/data/imaging/participants/${pid}/visit${visit}/session${session}/fmri/sym1/swgcaou_spm12/swgcaouI.nii.gz'
