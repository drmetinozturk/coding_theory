% This code is to calculate the probability of at least two people,
% from a set (e.g., students in a classroom),
% were born on exactly the same day.
clc;
clearvars;
close all;
dbstop if error;
num_days = 365; % number of days considered
num_trial = 1e4; % number of trials for monte-carlo simulation
num_ppl = 1:1:100; % number of people in the set
counter = zeros(length(num_ppl),1); % a counter that counts if there are at least two people with the same birthday
for j = 1:length(num_ppl)
    bdays = randi(num_days,num_ppl(j),num_trial); % randomly generated birthdays for everyone in the set and for all the trials
    for i = 1:num_trial
        ch = numel(unique(bdays(:,i)))~= size(bdays,1);
        counter(j) = counter(j) + ch;
    end
end
prob = 100*counter/num_trial;
figure;
plot(prob, 'linewidth', 2.5);
grid on;
xlabel('Number of people in the set');
ylabel('Probability of at least two people having the same bday');