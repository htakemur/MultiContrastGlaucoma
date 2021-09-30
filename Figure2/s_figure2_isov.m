function s_figure2_isov
%This code aims to reproduce right lower panel of Figure 2 in the following paper.

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2021) Multi-contrast magnetic resonance imaging of visual white matter pathways in glaucoma patients. medRxiv, 2021.06.29.21259608 (*: equal contribution)

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 09/30/2021

% Load Data
load ../Data/LOT_tissueproperty.mat

for k = 1:47
    if k < 31
        fiso_1_control_lh(:,k) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;
    else
        fiso_1_glaucoma_lh(:,k-30) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;
    end
end

load ../Data/ROT_tissueproperty.mat

for k = 1:47
    if k < 31
        fiso_1_control_rh(:,k) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;
    else
        fiso_1_glaucoma_rh(:,k-30) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;
    end
end

% Average data from left and right hemisphere
fiso_control_avg = (fiso_1_control_lh + fiso_1_control_rh)./2;
fiso_glaucoma_avg = (fiso_1_glaucoma_lh + fiso_1_glaucoma_rh)./2;

% Compute mean and std error for group
control_mean = mean(fiso_control_avg,2);
glaucoma_mean = mean(fiso_glaucoma_avg,2);
control_std = std(fiso_control_avg,0,2);
glaucoma_std = std(fiso_glaucoma_avg,0,2);

% Average data along nodes
control_mean_allnodes = mean(fiso_control_avg,1);
glaucoma_mean_allnodes = mean(fiso_glaucoma_avg,1);
std_control_allnodes = std(control_mean_allnodes, 0, 2);
std_glaucoma_allnodes = std(glaucoma_mean_allnodes, 0, 2);

% Calculate effect size and perform t-test
dprime = (mean(control_mean_allnodes,2) - mean(glaucoma_mean_allnodes,2))./sqrt(0.5 * (std_control_allnodes^2 + std_glaucoma_allnodes^2));
[h, p, ci, stats] = ttest2(control_mean_allnodes, glaucoma_mean_allnodes);

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
    plot([1:1:80],fiso_glaucoma_avg(:,kk),'color',[0 0 1],'LineWidth',0.5);
    hold on
end

plot([1:1:80],glaucoma_mean,'color',[0 0 1],'LineWidth',5)
hold on
plot([1:1:80],control_mean,'k','LineWidth',5)
hold on

h1.ylim(1) = 0.0;
h1.ylim(2) = 0.8;
ytick = [0.0 0.4 0.8];
set(gca,'tickdir','out', ...
    'box','off', ...
    'ylim',h1.ylim,'ytick',ytick)
ylabel('IsoV','fontsize',16);
xlabel('Position','fontsize',16);
titletext = ['OT dprime = ', num2str(dprime)];
title(titletext,'fontsize',16);