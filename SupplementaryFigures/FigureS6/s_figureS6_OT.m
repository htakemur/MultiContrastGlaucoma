function s_figureS6_OT

%This code aims to reproduce the left panel of Supplementary Figure 6 in the following paper.

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2022) Multi-contrast magnetic resonance imaging of visual white matter pathways in patients with glaucoma. Investigative Ophthalmology & Visual Science, 63, 29. 

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 10/20/2021

%% Load Data
load ../../Data/LOT_tissueproperty_T1wT2w.mat

all_profile_lh = all_profile_all;    

load ../../Data/ROT_tissueproperty_T1wT2w.mat

all_profile_rh = all_profile_all;

%% Average LH & RH & 2 runs, all subjects
all_profile_avg.t1wt2w_1 = ( all_profile_lh.t1wt2w_1 + all_profile_rh.t1wt2w_1 )./2;
all_profile_avg.t1wt2w_2 = ( all_profile_lh.t1wt2w_2 + all_profile_rh.t1wt2w_2 )./2;
all_profile_avg.t1wt2w = ( all_profile_avg.t1wt2w_1 + all_profile_avg.t1wt2w_2 )./2;

% Compute control mean & std for each metric
control_mean_t1wt2w = mean(mean(all_profile_avg.t1wt2w(11:90,1:25),1),2);
control_std_t1wt2w = std(mean(all_profile_avg.t1wt2w(11:90,1:25),1),0,2);

%% Compute d-prime
for i = 26:42
   dprime_control(i-25,1) = (mean(all_profile_avg.t1wt2w(11:90,i),1) - control_mean_t1wt2w)/control_std_t1wt2w;
end

%% Plot results
bar(dprime_control);
ylim([-6 6]);
ylabel('Deviation from control mean (d-prime)','fontsize',10);
