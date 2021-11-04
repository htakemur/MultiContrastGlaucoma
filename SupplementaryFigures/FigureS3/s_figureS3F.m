function s_figureS3F
%This code aims to reproduce panel F of Supplementary Figure 3 in the following paper.

% Ogawa, S., Takemura, H., Horiguchi, H., Miyazaki, A., Matsumoto, K., Masuda, Y., Yoshikawa, K. & Nakano, T. (2021) Multi-contrast magnetic resonance imaging of visual white matter pathways in glaucoma patients. medRxiv, 2021.06.29.21259608 (*: equal contribution)

% Author: Hiromasa Takemura, National Institute for Physiological Sciences, Japan
% First version: 10/08/2021

% Load Data
load ../../Data/LOR_tissueproperty.mat

for k = 1:47
    if k < 31
    icvf_1_control_lh(:,k) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;    
    else
    icvf_1_glaucoma_lh(:,k-30) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;
    end
end

load ../../Data/ROR_tissueproperty.mat

for k = 1:47
    if k < 31
    icvf_1_control_rh(:,k) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;      
    else
    icvf_1_glaucoma_rh(:,k-30) = (all_profile_all.icvf_1(11:90,k) + all_profile_all.icvf_2(11:90,k))./2;
    end
end

icvf_control_avg = (icvf_1_control_lh + icvf_1_control_rh)./2;
icvf_glaucoma_avg = (icvf_1_glaucoma_lh + icvf_1_glaucoma_rh)./2;

load ../../Data/Subject_profile.mat

icvf_all(:,1:30) = icvf_control_avg;
icvf_all(:,31:47) = icvf_glaucoma_avg;

% Calculate ODI residual
for jj = 1:80
mdl{jj} = fitlm(profile.age, icvf_all(jj,:));
end

for jjk = 1:80
for ik = 1:47
predict_icvf(jjk,ik) = mdl{jjk}.Coefficients.Estimate(1) + mdl{jjk}.Coefficients.Estimate(2)*profile.age(ik);
end
end

% Measure residuals
icvf_residual = icvf_all - predict_icvf;

icvf_control_avg = icvf_residual(:,1:30);
icvf_glaucoma_avg = icvf_residual(:,31:47); 

control_icvf_mean = mean(icvf_control_avg,1);
control_icvf_mean_mean = mean(control_icvf_mean);
std_icvf_mean = std(control_icvf_mean,0,2);
glaucoma_icvf_mean = mean(icvf_glaucoma_avg,1);
glaucoma_icvf_individual = (glaucoma_icvf_mean - control_icvf_mean_mean)./std_icvf_mean;

visualfield = (profile.visualfield_left(31:47) + profile.visualfield_right(31:47))./2;

[r(1,1), p(1,1)] = corr(transpose(glaucoma_icvf_individual), transpose(visualfield));

% Plot ODI and visual field test
figure(1)
scatter(transpose(glaucoma_icvf_individual), transpose(visualfield),'Marker','o','MarkerEdgeColor','k', 'MarkerFaceColor','none');
xlim([-6 6]);
ylim([-30 10]);
xtick = [-6 0 6];
ytick = [-30 -20 -10 0 10];
set(gca, 'tickdir', 'out', 'box', 'off','xtick',xtick, 'ytick',ytick);

hold on
% add 95% bootstrap CI
Critical = 0.05;%critical region
y = visualfield';
x = [ones(size(y)) glaucoma_icvf_individual'];
b = regress(y,x);
yfit = x*b;
repetition = 10000;
[coefficient index] = bootstrp(...
         repetition,@regress,y,x);
xfig = xtick(1):0.001:xtick(end);
for j =1:length(xfig)
    for k = 1:repetition
        y_candi(k) = coefficient(k,2)*xfig(j) + coefficient(k,1);
    end
    y_candi_sort = sort(y_candi);
    y_down(j) = y_candi_sort(repetition*Critical/2);
    y_up(j) = y_candi_sort(repetition*(1-Critical/2));
    clear y_candi
end
plot(xfig,y_down,'c-','LineWidth',0.2)
hold on
plot(xfig,y_up,'c-','LineWidth',0.2)
hold on
y_hat = @(i) b(2)*i+b(1);
plot(xfig,y_hat(xfig),'Color','k','LineWidth',2);

xlabel('ICVF Residual (s.d. from control mean)');
ylabel('Visual field test');
axis square