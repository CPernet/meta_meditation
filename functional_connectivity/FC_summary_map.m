%% functional connectivity script from seed regions
% ----------------------------------------------------

% downloaded from NeuroSynth 6 connectivity maps with seed in the right insula
maps = dir('functional_connectivity*.nii');

% create a summary map 
% sum of maps thresholded at r>=0.2maps = dir('functional_connectivity*.nii');
data = NaN(91,109,91,6);
for m=1:6
    V(m) = spm_vol([maps(m).folder filesep maps(m).name]);
    data(:,:,:,m) = spm_read_vols(V(m)) >= 0.2;
end
summary_map = sum(data,4);
W           = V(1);
W.fname     = [maps(1).folder filesep 'summary_map.nii'];
W.descrip   = 'sum of binarized FC maps';
spm_write_vol(W,summary_map)

% threshold this map
[~,PCI]        = binofit(3,6); % chance level 3 out of 6
threshold      = round(PCI(2).*6); 
th_summary_map = summary_map>=threshold;

% for visualization of connectivity value, post-multiply by mean
% connectivity the thresholded map
mean_values    = mean(data,4);
th_summary_map = (th_summary_map) .* mean_values;
W.fname        = [maps(1).folder filesep 'th_summary_map.nii'];
W.descrip      = 'thresholded summary map with mean connectivity values';
spm_write_vol(W,th_summary_map)


