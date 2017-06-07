data = load('MasterData.mat');
data = getfield(data, 'data');

% X is a 82x3 matrix with teams' Colley Ranking, Preseason Ranking, and a
% boolean value indicating whether or not the team is a member of a Power
% Five conference. Y is a 82x1 matrix with boolean values indicating
% whether or not a team won their bowl game
winnerData = data(1:41, :);
loserData = data(42:82, :);

%Changes data to show the net values (relative to opponent), instead of raw
%values. This is done to account for the fact that stronger teams are
%typically matched against stronger opponents.
for i = 1:41,
    wr = winnerData(i, 1);
    lr = loserData(i, 1);
    wc = winnerData(i, 2);
    lc = loserData(i, 2);
    wPr = winnerData(i, 3);
    lPr = loserData(i, 3);
    winnerData(i, 1) = wr - lr;
    loserData(i, 1) = lr - wr;
    winnerData(i, 2) = wc - lc;
    loserData(i, 2) = lc - wc;
    winnerData(i, 3) = wPr - lPr;
    loserData(i, 3) = lPr - wPr;
end
data = vertcat(winnerData, loserData);
X = data(:, [1, 2, 3]); y = data(:, 4);


[m, n] = size(X);
X = [ones(m, 1) X];
initial_theta = zeros(n + 1, 1);
[cost, grad] = costFunction(initial_theta, X, y);
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);







