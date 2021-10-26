function s_figure6_OR
%This code aims to reproduce the right panel of Figure 6 in the following paper.

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2021) Multi-contrast magnetic resonance imaging of visual white matter pathways in glaucoma patients. medRxiv, 2021.06.29.21259608 (*: equal contribution)

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 10/14/2021

% Load Data
load ../Data/LOR_tissueproperty.mat

all_profile_lh = all_profile_all;    


load ../Data/ROR_tissueproperty.mat

all_profile_rh = all_profile_all;

%% Average LH & RH & 2 runs, all subjects

all_profile_avg.fa1 = ( all_profile_lh.fa1 + all_profile_rh.fa1 )./2;
all_profile_avg.fa2 = ( all_profile_lh.fa2 + all_profile_rh.fa2 )./2;
all_profile_avg.md1 = ( all_profile_lh.md1 + all_profile_rh.md1 )./2;
all_profile_avg.md2 = ( all_profile_lh.md2 + all_profile_rh.md2 )./2;
all_profile_avg.rd1 = ( all_profile_lh.rd1 + all_profile_rh.rd1 )./2;
all_profile_avg.rd2 = ( all_profile_lh.rd2 + all_profile_rh.rd2 )./2;
all_profile_avg.ad1 = ( all_profile_lh.ad1 + all_profile_rh.ad1 )./2;
all_profile_avg.ad2 = ( all_profile_lh.ad2 + all_profile_rh.ad2 )./2;
all_profile_avg.qt1_1 = ( all_profile_lh.qt1_1 + all_profile_rh.qt1_1)./2;
all_profile_avg.qt1_2 = ( all_profile_lh.qt1_2 + all_profile_rh.qt1_2)./2;
all_profile_avg.mtv_1 = ( all_profile_lh.mtv_1 + all_profile_rh.mtv_1)./2;
all_profile_avg.mtv_2 = ( all_profile_lh.mtv_2 + all_profile_rh.mtv_2)./2;
all_profile_avg.icvf_1 = ( all_profile_lh.icvf_1 + all_profile_rh.icvf_1)./2;
all_profile_avg.icvf_2 = ( all_profile_lh.icvf_2 + all_profile_rh.icvf_2)./2;
all_profile_avg.odi_1 = ( all_profile_lh.odi_1 + all_profile_rh.odi_1)./2;
all_profile_avg.odi_2 = ( all_profile_lh.odi_2 + all_profile_rh.odi_2)./2;
all_profile_avg.fiso_1 = ( all_profile_lh.fiso_1 + all_profile_rh.fiso_1)./2;
all_profile_avg.fiso_2 = ( all_profile_lh.fiso_2 + all_profile_rh.fiso_2)./2;

all_profile_avg.fa = ( all_profile_avg.fa1 + all_profile_avg.fa2 )./2;
all_profile_avg.md = ( all_profile_avg.md1 + all_profile_avg.md2 )./2;
all_profile_avg.ad = ( all_profile_avg.ad1 + all_profile_avg.ad2 )./2;
all_profile_avg.rd = ( all_profile_avg.rd1 + all_profile_avg.rd2 )./2;
all_profile_avg.qt1 = ( all_profile_avg.qt1_1 + all_profile_avg.qt1_2 )./2;
all_profile_avg.mtv = ( all_profile_avg.mtv_1 + all_profile_avg.mtv_2 )./2;
all_profile_avg.icvf = ( all_profile_avg.icvf_1 + all_profile_avg.icvf_2 )./2;
all_profile_avg.odi = ( all_profile_avg.odi_1 + all_profile_avg.odi_2 )./2;
all_profile_avg.fiso = ( all_profile_avg.fiso_1 + all_profile_avg.fiso_2 )./2;

% Compute control mean & std for each metric

control_mean_fa = mean(mean(all_profile_avg.fa(11:90,1:30),1),2);
control_std_fa = std(mean(all_profile_avg.fa(11:90,1:30),1),0,2);

control_mean_md = mean(mean(all_profile_avg.md(11:90,1:30),1),2);
control_std_md = std(mean(all_profile_avg.md(11:90,1:30),1),0,2);

control_mean_ad = mean(mean(all_profile_avg.ad(11:90,1:30),1),2);
control_std_ad = std(mean(all_profile_avg.ad(11:90,1:30),1),0,2);

control_mean_rd = mean(mean(all_profile_avg.rd(11:90,1:30),1),2);
control_std_rd = std(mean(all_profile_avg.rd(11:90,1:30),1),0,2);

control_mean_qt1 = mean(mean(all_profile_avg.qt1(11:90,1:30),1),2);
control_std_qt1 = std(mean(all_profile_avg.qt1(11:90,1:30),1),0,2);

control_mean_mtv = mean(mean(all_profile_avg.mtv(11:90,1:30),1),2);
control_std_mtv = std(mean(all_profile_avg.mtv(11:90,1:30),1),0,2);

control_mean_icvf = mean(mean(all_profile_avg.icvf(11:90,1:30),1),2);
control_std_icvf = std(mean(all_profile_avg.icvf(11:90,1:30),1),0,2);

control_mean_odi = mean(mean(all_profile_avg.odi(11:90,1:30),1),2);
control_std_odi = std(mean(all_profile_avg.odi(11:90,1:30),1),0,2);

control_mean_fiso = mean(mean(all_profile_avg.fiso(11:90,1:30),1),2);
control_std_fiso = std(mean(all_profile_avg.fiso(11:90,1:30),1),0,2);


%% Compute d-prime

for i = 31:47
   dprime_control(i-30,1) = (mean(all_profile_avg.fa(11:90,i),1) - control_mean_fa)/control_std_fa;
   dprime_control(i-30,2) = (mean(all_profile_avg.md(11:90,i),1) - control_mean_md)/control_std_md;
   dprime_control(i-30,3) = (mean(all_profile_avg.rd(11:90,i),1) - control_mean_rd)/control_std_rd;
   dprime_control(i-30,4) = (mean(all_profile_avg.ad(11:90,i),1) - control_mean_ad)/control_std_ad;
   dprime_control(i-30,5) = (mean(all_profile_avg.qt1(11:90,i),1) - control_mean_qt1)/control_std_qt1;
   dprime_control(i-30,6) = (mean(all_profile_avg.mtv(11:90,i),1) - control_mean_mtv)/control_std_mtv;
   dprime_control(i-30,7) = (mean(all_profile_avg.icvf(11:90,i),1) - control_mean_icvf)/control_std_icvf;
   dprime_control(i-30,8) = (mean(all_profile_avg.odi(11:90,i),1) - control_mean_odi)/control_std_odi;
   dprime_control(i-30,9) = (mean(all_profile_avg.fiso(11:90,i),1) - control_mean_fiso)/control_std_fiso;
end

bar(transpose(dprime_control));
ylim([-6 6]);
set(gca,'XTickLabel',{'FA','MD','RD','AD','qT1','MTV','ICVF','ODI','ISoV'},'fontsize',10);
    ylabel('Deviation from control mean (d-prime)','fontsize',10);
