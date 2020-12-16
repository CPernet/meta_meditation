% subplots figures 1 & 2
% ----------------------

% read data generated by G-power
data        = importdata('GPower_output.csv'); % assuming already in current directory
effectsized = data.data(:,1);                % Cohens' d values
N80         = data.data(:,2);                % Sample sizes for 80% power
N95         = data.data(:,3);                % Sample sizes for 95% power
CI1         =[0.6357911 1.516707];           % Cohens'd all brain
CI2         =[0.2534431 1.433329];           % Cohens'd right insula
                                             
% plots
figure('Name', 'all brain controls vs meditators'); 
plot(N80./2,effectsized,'-o','LineWidth',3)
hold on; plot(N95./2,effectsized,'-o','LineWidth',3)
box on; grid on; ylabel('Cohen''s d'); xlabel('Sample Size per group')
axis([0 95 0.15 1.65 ]); title('Two-sample t-test power curves')
plot(0:95,repmat(CI1(1),96,1),'-k','LineWidth',2)   % lower bound of the 95% CI
plot(0:95,repmat(CI1(2),96,1),'-k','LineWidth',2)  % higher bound of the 95% CI

figure('Name', 'right insula'); 
plot(N80./2,effectsized,'-o','LineWidth',3)
hold on; plot(N95./2,effectsized,'-o','LineWidth',3)
box on; grid on; ylabel('Cohen''s d'); xlabel('Sample Size per group')
axis([0 450 0.15 1.65 ]); title('Two-sample t-test power curves')
plot(0:450,repmat(CI2(1),451,1),'-k','LineWidth',2)   % lower bound of the 95% CI
plot(0:450,repmat(CI2(2),451,1),'-k','LineWidth',2)  % higher bound of the 95% CI
