function s_figureS5_mtv
%This code aims to reproduce Supplementary Figure 5 in the following paper.

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2022) 
% Multi-contrast magnetic resonance imaging of visual white matter pathways in patients with glaucoma. 
% Investigative Ophthalmology & Visual Science, 63, 29.

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 10/06/2021

% Load Data
load ../../Data/LOR_tissueproperty.mat

for k = 1:47
    if k < 31
    mtv_control_lh(:,k) = (all_profile_all.mtv_1(11:90,k) + all_profile_all.mtv_2(11:90,k))./2;    
    else
    mtv_glaucoma_lh(:,k-30) = (all_profile_all.mtv_1(11:90,k) + all_profile_all.mtv_2(11:90,k))./2;
    end
end

load ../../Data/ROR_tissueproperty.mat

for k = 1:47
    if k < 31
    mtv_control_rh(:,k) = (all_profile_all.mtv_1(11:90,k) + all_profile_all.mtv_2(11:90,k))./2;    
    else
    mtv_glaucoma_rh(:,k-30) = (all_profile_all.mtv_1(11:90,k) + all_profile_all.mtv_2(11:90,k))./2;
    end
end

% Average data from left and right hemisphere
mtv_control_avg = (mtv_control_lh + mtv_control_rh)./2;
mtv_glaucoma_avg = (mtv_glaucoma_lh + mtv_glaucoma_rh)./2;

% Compute mean and std error for group
control_mean = mean(mtv_control_avg,2);
glaucoma_mean = mean(mtv_glaucoma_avg,2);
control_std = std(mtv_control_avg,0,2);
glaucoma_std = std(mtv_glaucoma_avg,0,2);

% Average data along nodes
control_mean_allnodes = mean(mtv_control_avg,1);
glaucoma_mean_allnodes = mean(mtv_glaucoma_avg,1);
std_control_allnodes = std(control_mean_allnodes, 0, 2);
std_glaucoma_allnodes = std(glaucoma_mean_allnodes, 0, 2);

% Calculate effect size and perform t-test
dprime = (mean(control_mean_allnodes,2) - mean(glaucoma_mean_allnodes,2))./sqrt(0.5 * (std_control_allnodes^2 + std_glaucoma_allnodes^2));

% Plot figure
figure; 
% render area plot
A3 = area(control_mean+2*control_std); hold on;
A1 = area(control_mean+control_std); hold on;
A2 = area(control_mean-control_std); hold on;
A4 = area(control_mean-2*control_std); hold on;

% set color and style
set(A1,'FaceColor',[0.6 0.6 0.6],'linestyle','none');
set(A2,'FaceColor',[0.8 0.8 0.8],'linestyle','none');
set(A3,'FaceColor',[0.8 0.8 0.8],'linestyle','none');
set(A4,'FaceColor',[1 1 1],'linestyle','none');

for kk = 1:17
     plot([1:1:80],mtv_glaucoma_avg(:,kk),'color',[0 0 1],'LineWidth',0.5);
     hold on
end

plot([1:1:80],glaucoma_mean,'color',[0 0 1],'LineWidth',5)
hold on
plot([1:1:80],control_mean,'k','LineWidth',5)
hold on

h1.ylim(1) = 0.2;
h1.ylim(2) = 0.4;

ytick = [0.2 0.3 0.4];
    set(gca,'tickdir','out', ...
        'box','off', ...
        'ylim',h1.ylim,'ytick',ytick)
ylabel('MTV','fontsize',16);
xlabel('Position','fontsize',16);
titletext = ['OR dprime = ', num2str(dprime)];
title(titletext,'fontsize',16);