function s_rightOT_contralateralvisualfield
%This code aims to calculate correlation coefficient between tissue properties of the right optic tract and visual field test results in the contralateral visual field as described in the following paper:

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2022) 
% Multi-contrast magnetic resonance imaging of visual white matter pathways in patients with glaucoma. 
% Investigative Ophthalmology & Visual Science, 63, 29.

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 10/07/2021

% Load Data
load ../../Data/ROT_tissueproperty.mat

for k = 1:47
    if k < 31
    icvf_1_control_rh(:,k) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;    
    odi_1_control_rh(:,k) = (all_profile_all.odi_1(11:90,k) + all_profile_all.odi_2(11:90,k))./2;
    fiso_1_control_rh(:,k) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;    
    qt1_control_rh(:,k) = (all_profile_all.qt1_1(11:90,k) + all_profile_all.qt1_2(11:90,k))./2;    
    else
    icvf_1_glaucoma_rh(:,k-30) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;
    odi_1_glaucoma_rh(:,k-30) = (all_profile_all.odi_1(11:90,k) + all_profile_all.odi_2(11:90,k))./2;
    fiso_1_glaucoma_rh(:,k-30) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;
    qt1_glaucoma_rh(:,k-30) = (all_profile_all.qt1_1(11:90,k) + all_profile_all.qt1_2(11:90,k))./2;
    end
end

icvf_control_avg = icvf_1_control_rh;
icvf_glaucoma_avg = icvf_1_glaucoma_rh;
odi_control_avg = odi_1_control_rh;
odi_glaucoma_avg = odi_1_glaucoma_rh;
fiso_control_avg = fiso_1_control_rh;
fiso_glaucoma_avg = fiso_1_glaucoma_rh;
qt1_control_avg = qt1_control_rh;
qt1_glaucoma_avg = qt1_glaucoma_rh;

% Compute mean and std error for group
control_icvf_mean = mean(icvf_control_avg,1);
control_icvf_mean_mean = mean(control_icvf_mean);
std_icvf_mean = std(control_icvf_mean,0,2);
glaucoma_icvf_mean = mean(icvf_glaucoma_avg,1);
glaucoma_icvf_individual = (glaucoma_icvf_mean - control_icvf_mean_mean)./std_icvf_mean;

control_odi_mean = mean(odi_control_avg,1);
control_odi_mean_mean = mean(control_odi_mean);
std_odi_mean = std(control_odi_mean,0,2);
glaucoma_odi_mean = mean(odi_glaucoma_avg,1);
glaucoma_odi_individual = (glaucoma_odi_mean - control_odi_mean_mean)./std_odi_mean;

control_fiso_mean = mean(fiso_control_avg,1);
control_fiso_mean_mean = mean(control_fiso_mean);
std_fiso_mean = std(control_fiso_mean,0,2);
glaucoma_fiso_mean = mean(fiso_glaucoma_avg,1);
glaucoma_fiso_individual = (glaucoma_fiso_mean - control_fiso_mean_mean)./std_fiso_mean;

control_qt1_mean = mean(qt1_control_avg,1);
control_qt1_mean_mean = mean(control_qt1_mean);
std_qt1_mean = std(control_qt1_mean,0,2);
glaucoma_qt1_mean = mean(qt1_glaucoma_avg,1);
glaucoma_qt1_individual = (glaucoma_qt1_mean - control_qt1_mean_mean)./std_qt1_mean;

load ../../Data/Subject_profile.mat

visualfield = profile.visualfield_leftvisualfield(31:47);

% Individual correlation
[r(1,1), p(1,1)] = corr(transpose(glaucoma_icvf_individual), transpose(visualfield));
[r(2,1), p(2,1)] = corr(transpose(glaucoma_odi_individual), transpose(visualfield));
[r(3,1), p(3,1)] = corr(transpose(glaucoma_fiso_individual), transpose(visualfield));
[r(4,1), p(4,1)] = corr(transpose(glaucoma_qt1_individual), transpose(visualfield));