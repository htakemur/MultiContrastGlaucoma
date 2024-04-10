function s_tableS2

%This code aims to reproduce Supplementary Table 2 in the following paper.

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2022) 
% Multi-contrast magnetic resonance imaging of visual white matter pathways in patients with glaucoma. 
% Investigative Ophthalmology & Visual Science, 63, 29.

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 12/25/2021

% Load Data
load ../../Data/LOR_tissueproperty.mat
all_profile_lh = all_profile_all;    

load ../../Data/ROR_tissueproperty.mat
all_profile_rh = all_profile_all;

%% Average LH & RH & 2 runs, all subjects
all_profile_avg.qt1_1 = ( all_profile_lh.qt1_1 + all_profile_rh.qt1_1)./2;
all_profile_avg.qt1_2 = ( all_profile_lh.qt1_2 + all_profile_rh.qt1_2)./2;
all_profile_avg.icvf_1 = ( all_profile_lh.icvf_1 + all_profile_rh.icvf_1)./2;
all_profile_avg.icvf_2 = ( all_profile_lh.icvf_2 + all_profile_rh.icvf_2)./2;
all_profile_avg.odi_1 = ( all_profile_lh.odi_1 + all_profile_rh.odi_1)./2;
all_profile_avg.odi_2 = ( all_profile_lh.odi_2 + all_profile_rh.odi_2)./2;
all_profile_avg.fiso_1 = ( all_profile_lh.fiso_1 + all_profile_rh.fiso_1)./2;
all_profile_avg.fiso_2 = ( all_profile_lh.fiso_2 + all_profile_rh.fiso_2)./2;

all_profile_avg.qt1 = ( all_profile_avg.qt1_1 + all_profile_avg.qt1_2 )./2;
all_profile_avg.icvf = ( all_profile_avg.icvf_1 + all_profile_avg.icvf_2 )./2;
all_profile_avg.odi = ( all_profile_avg.odi_1 + all_profile_avg.odi_2 )./2;
all_profile_avg.fiso = ( all_profile_avg.fiso_1 + all_profile_avg.fiso_2 )./2;

% Compute control mean & std for each metric
control_mean_qt1 = mean(all_profile_avg.qt1(11:90,1:30),1);
control_mean_icvf = mean(all_profile_avg.icvf(11:90,1:30),1);
control_mean_odi = mean(all_profile_avg.odi(11:90,1:30),1);
control_mean_fiso = mean(all_profile_avg.fiso(11:90,1:30),1);

%% Calculate correlation among healthy control subjects
[r(1,1)] = corr(transpose(control_mean_qt1), transpose(control_mean_icvf));
[r(1,2)] = corr(transpose(control_mean_qt1), transpose(control_mean_odi));
[r(1,3)] = corr(transpose(control_mean_qt1), transpose(control_mean_fiso));
[r(2,2)] = corr(transpose(control_mean_icvf), transpose(control_mean_odi));
[r(2,3)] = corr(transpose(control_mean_icvf), transpose(control_mean_fiso));
[r(3,3)] = corr(transpose(control_mean_odi), transpose(control_mean_fiso));