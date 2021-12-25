function s_tableS3

%This code aims to reproduce Supplementary Table 3 in the following paper.

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2021) Multi-contrast magnetic resonance imaging of visual white matter pathways in glaucoma patients. medRxiv, 2021.06.29.21259608 (*: equal contribution)

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 10/14/2021

% Load Data
load ../../Data/LOT_tissueproperty.mat

for k = 1:47
    if k < 31
    icvf_1_control_lh(:,k) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;    
    odi_1_control_lh(:,k) = (all_profile_all.odi_1(11:90,k) + all_profile_all.odi_2(11:90,k))./2;
    fiso_1_control_lh(:,k) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;    

    fa1_control_lh(:,k) = (all_profile_all.fa1(11:90,k) + all_profile_all.fa2(11:90,k))./2;
    md1_control_lh(:,k) = (all_profile_all.md1(11:90,k) + all_profile_all.md2(11:90,k))./2;    
    ad1_control_lh(:,k) = (all_profile_all.ad1(11:90,k) + all_profile_all.ad2(11:90,k))./2;  
    rd1_control_lh(:,k) = (all_profile_all.rd1(11:90,k) + all_profile_all.rd2(11:90,k))./2;  
    else
    icvf_1_glaucoma_lh(:,k-30) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;
    odi_1_glaucoma_lh(:,k-30) = (all_profile_all.odi_1(11:90,k) + all_profile_all.odi_2(11:90,k))./2;
    fiso_1_glaucoma_lh(:,k-30) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;

    fa1_glaucoma_lh(:,k-30) = (all_profile_all.fa1(11:90,k) + all_profile_all.fa2(11:90,k))./2;
    md1_glaucoma_lh(:,k-30) = (all_profile_all.md1(11:90,k) + all_profile_all.md2(11:90,k))./2;    
    ad1_glaucoma_lh(:,k-30) = (all_profile_all.ad1(11:90,k) + all_profile_all.ad2(11:90,k))./2;  
    rd1_glaucoma_lh(:,k-30) = (all_profile_all.rd1(11:90,k) + all_profile_all.rd2(11:90,k))./2;  
    end
end

load ../../Data/ROT_tissueproperty.mat

for k = 1:47
    if k < 31
    icvf_1_control_rh(:,k) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;    
    odi_1_control_rh(:,k) = (all_profile_all.odi_1(11:90,k) + all_profile_all.odi_2(11:90,k))./2;    
    fiso_1_control_rh(:,k) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;    

    fa1_control_rh(:,k) = (all_profile_all.fa1(11:90,k) + all_profile_all.fa2(11:90,k))./2;
    md1_control_rh(:,k) = (all_profile_all.md1(11:90,k) + all_profile_all.md2(11:90,k))./2;    
    ad1_control_rh(:,k) = (all_profile_all.ad1(11:90,k) + all_profile_all.ad2(11:90,k))./2;  
    rd1_control_rh(:,k) = (all_profile_all.rd1(11:90,k) + all_profile_all.rd2(11:90,k))./2;  
    else
    icvf_1_glaucoma_rh(:,k-30) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;
    odi_1_glaucoma_rh(:,k-30) = (all_profile_all.odi_1(11:90,k) + all_profile_all.odi_2(11:90,k))./2;
    fiso_1_glaucoma_rh(:,k-30) = (all_profile_all.fiso_1(11:90,k) + all_profile_all.fiso_2(11:90,k))./2;

    fa1_glaucoma_rh(:,k-30) = (all_profile_all.fa1(11:90,k) + all_profile_all.fa2(11:90,k))./2;
    md1_glaucoma_rh(:,k-30) = (all_profile_all.md1(11:90,k) + all_profile_all.md2(11:90,k))./2;    
    ad1_glaucoma_rh(:,k-30) = (all_profile_all.ad1(11:90,k) + all_profile_all.ad2(11:90,k))./2;  
    rd1_glaucoma_rh(:,k-30) = (all_profile_all.rd1(11:90,k) + all_profile_all.rd2(11:90,k))./2;  
    end
end

icvf_control_avg = (icvf_1_control_lh + icvf_1_control_rh)./2;
icvf_glaucoma_avg = (icvf_1_glaucoma_lh + icvf_1_glaucoma_rh)./2;
odi_control_avg = (odi_1_control_lh + odi_1_control_rh)./2;
odi_glaucoma_avg = (odi_1_glaucoma_lh + odi_1_glaucoma_rh)./2;
fiso_control_avg = (fiso_1_control_lh + fiso_1_control_rh)./2;
fiso_glaucoma_avg = (fiso_1_glaucoma_lh + fiso_1_glaucoma_rh)./2;

fa_control_avg = (fa1_control_lh + fa1_control_rh)./2;
fa_glaucoma_avg = (fa1_glaucoma_lh + fa1_glaucoma_rh)./2;
md_control_avg = (md1_control_lh + md1_control_rh)./2;
md_glaucoma_avg = (md1_glaucoma_lh + md1_glaucoma_rh)./2;
rd_control_avg = (rd1_control_lh + rd1_control_rh)./2;
rd_glaucoma_avg = (rd1_glaucoma_lh + rd1_glaucoma_rh)./2;
ad_control_avg = (ad1_control_lh + ad1_control_rh)./2;
ad_glaucoma_avg = (ad1_glaucoma_lh + ad1_glaucoma_rh)./2;

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

control_fa_mean = mean(fa_control_avg,1);
control_fa_mean_mean = mean(control_fa_mean);
std_fa_mean = std(control_fa_mean,0,2);
glaucoma_fa_mean = mean(fa_glaucoma_avg,1);
glaucoma_fa_individual = (glaucoma_fa_mean - control_fa_mean_mean)./std_fa_mean;

control_md_mean = mean(md_control_avg,1);
control_md_mean_mean = mean(control_md_mean);
std_md_mean = std(control_md_mean,0,2);
glaucoma_md_mean = mean(md_glaucoma_avg,1);
glaucoma_md_individual = (glaucoma_md_mean - control_md_mean_mean)./std_md_mean;

control_rd_mean = mean(rd_control_avg,1);
control_rd_mean_mean = mean(control_rd_mean);
std_rd_mean = std(control_rd_mean,0,2);
glaucoma_rd_mean = mean(rd_glaucoma_avg,1);
glaucoma_rd_individual = (glaucoma_rd_mean - control_rd_mean_mean)./std_rd_mean;

control_ad_mean = mean(ad_control_avg,1);
control_ad_mean_mean = mean(control_ad_mean);
std_ad_mean = std(control_ad_mean,0,2);
glaucoma_ad_mean = mean(ad_glaucoma_avg,1);
glaucoma_ad_individual = (glaucoma_ad_mean - control_ad_mean_mean)./std_ad_mean;

[r(1,1), p(1,1)] = corr(transpose(glaucoma_icvf_individual), transpose(glaucoma_fa_individual));
[r(1,2), p(1,2)] = corr(transpose(glaucoma_icvf_individual), transpose(glaucoma_md_individual));
[r(1,3), p(1,3)] = corr(transpose(glaucoma_icvf_individual), transpose(glaucoma_rd_individual));
[r(1,4), p(1,4)] = corr(transpose(glaucoma_icvf_individual), transpose(glaucoma_ad_individual));

[r(2,1), p(2,1)] = corr(transpose(glaucoma_odi_individual), transpose(glaucoma_fa_individual));
[r(2,2), p(2,2)] = corr(transpose(glaucoma_odi_individual), transpose(glaucoma_md_individual));
[r(2,3), p(2,3)] = corr(transpose(glaucoma_odi_individual), transpose(glaucoma_rd_individual));
[r(2,4), p(2,4)] = corr(transpose(glaucoma_odi_individual), transpose(glaucoma_ad_individual));

[r(3,1), p(3,1)] = corr(transpose(glaucoma_fiso_individual), transpose(glaucoma_fa_individual));
[r(3,2), p(3,2)] = corr(transpose(glaucoma_fiso_individual), transpose(glaucoma_md_individual));
[r(3,3), p(3,3)] = corr(transpose(glaucoma_fiso_individual), transpose(glaucoma_rd_individual));
[r(3,4), p(3,4)] = corr(transpose(glaucoma_fiso_individual), transpose(glaucoma_ad_individual));

imagesc(r);
colormap hot
caxis([-1 1]);
colorbar('Ticks',[-1 -0.5 0 0.5 1.0]);
xtick = [1 2 3 4];
ytick = [1 2 3 4];
set(gca,'xtick',xtick,'ytick',ytick,'tickdir','out');
set(gca,'YTickLabel',{'ICVF','ODI','IsoV'});
set(gca,'XTickLabel',{'FA','MD','RD','AD'});