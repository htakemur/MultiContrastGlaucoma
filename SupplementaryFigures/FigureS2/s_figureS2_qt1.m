function s_figureS2_qT1

%This code aims to reproduce left upper panel of Supplementary Figure 2 in the following paper.

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2021) Multi-contrast magnetic resonance imaging of visual white matter pathways in glaucoma patients. medRxiv, 2021.06.29.21259608 (*: equal contribution)

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 09/30/2021

% Load Data
load ../../Data/LOR_tissueproperty.mat

for k = 1:47
    if k < 31
        qt1_control_lh(:,k) = (all_profile_all.qt1_1(11:90,k) + all_profile_all.qt1_2(11:90,k))./2;
    else
        qt1_glaucoma_lh(:,k-30) = (all_profile_all.qt1_1(11:90,k) + all_profile_all.qt1_2(11:90,k))./2;
    end
end

load ../../Data/ROR_tissueproperty.mat
for k = 1:47
    if k < 31
        qt1_control_rh(:,k) = (all_profile_all.qt1_1(11:90,k) + all_profile_all.qt1_2(11:90,k))./2;
    else
        qt1_glaucoma_rh(:,k-30) = (all_profile_all.qt1_1(11:90,k) + all_profile_all.qt1_2(11:90,k))./2;
    end
end

qt1_control_avg = (qt1_control_lh + qt1_control_rh)./2;
qt1_glaucoma_avg = (qt1_glaucoma_lh + qt1_glaucoma_rh)./2;

% Compute mean and std error for group
control_mean = mean(qt1_control_avg,2);
glaucoma_mean = mean(qt1_glaucoma_avg,2);
control_std = std(qt1_control_avg,0,2);
glaucoma_std = std(qt1_glaucoma_avg,0,2);

load ../../Data/Subject_profile.mat

control_mean_allnodes = mean(qt1_control_avg,1);
glaucoma_mean_allnodes = mean(qt1_glaucoma_avg,1);

qt1_all(:,1:30) = qt1_control_avg;
qt1_all(:,31:47) = qt1_glaucoma_avg;


for jj = 1:80
mdl{jj} = fitlm(profile.age, qt1_all(jj,:));
end

for jjk = 1:80
for ik = 1:47
predict_qt1(jjk,ik) = mdl{jjk}.Coefficients.Estimate(1) + mdl{jjk}.Coefficients.Estimate(2)*profile.age(ik);
end
end

% Measure residuals
qt1_residual = qt1_all - predict_qt1;

qt1_control_avg = qt1_residual(:,1:30);
qt1_glaucoma_avg = qt1_residual(:,31:47);

% Compute mean and std error for group
control_mean = mean(qt1_control_avg,2);
glaucoma_mean = mean(qt1_glaucoma_avg,2);
control_std = std(qt1_control_avg,0,2);
glaucoma_std = std(qt1_glaucoma_avg,0,2);

control_mean_allnodes = mean(qt1_control_avg,1);
glaucoma_mean_allnodes = mean(qt1_glaucoma_avg,1);
std_control_allnodes = std(control_mean_allnodes, 0, 2);
std_glaucoma_allnodes = std(glaucoma_mean_allnodes, 0, 2);
dprime = (mean(control_mean_allnodes,2) - mean(glaucoma_mean_allnodes,2))./sqrt(0.5 * (std_control_allnodes^2 + std_glaucoma_allnodes^2));
[h, p, ci, stats] = ttest2(control_mean_allnodes, glaucoma_mean_allnodes);

figure; 
% render area plot
A3 = area((control_mean+2*control_std),-0.3); hold on;
A1 = area((control_mean+control_std),-0.3); hold on;
A2 = area((control_mean-control_std),-0.3); hold on;
A4 = area((control_mean-2*control_std),-0.3); hold on;

% set color and style
set(A1,'FaceColor',[0.6 0.6 0.6],'linestyle','none');
set(A2,'FaceColor',[0.8 0.8 0.8],'linestyle','none');
set(A3,'FaceColor',[0.8 0.8 0.8],'linestyle','none');
set(A4,'FaceColor',[1 1 1],'linestyle','none');

for kk = 1:17
     plot([1:1:80],qt1_glaucoma_avg(:,kk),'color',[0 0 1],'LineWidth',0.5);
     hold on
end


plot([1:1:80],glaucoma_mean,'color',[0 0 1],'LineWidth',5)
hold on
plot([1:1:80],control_mean,'k','LineWidth',5)
hold on

h1.ylim(1) = -0.2;
h1.ylim(2) = 0.2;

ytick = [-0.2 0 0.2];

    set(gca,'tickdir','out', ...
        'box','off', ...
        'ylim',h1.ylim,'ytick',ytick)
ylabel('Residual qT1','fontsize',16);
xlabel('Position','fontsize',16);
titletext = ['OT dprime = ', num2str(dprime)];
title(titletext,'fontsize',16);
