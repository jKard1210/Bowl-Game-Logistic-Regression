games = load('gamesID.mat');
games = getfield(games, 'games');
teams = load('Teams.mat');
teams = getfield(teams, 'c');

n = size(teams);


wins = zeros(n);
losses = zeros(n);

hID = str2num(char(games{:, 1}));
aID = str2num(char(games{:, 3}));
hScore = games{:, 2};
aScore = games{:, 4};

data = horzcat(hID, hScore, aID, aScore);
c = zeros(length(wins));

for m=1:length(data)
    hTeam = data(m, 1);
    aTeam = data(m, 3);
    c(hTeam, aTeam) = c(hTeam, aTeam) - 1;
    c(aTeam, hTeam) = c(aTeam, hTeam) - 1;
    if(data(m, 2) > data(m, 4))
        wins(hTeam) = wins(hTeam) + 1;
        losses(aTeam) = losses(aTeam) + 1;
    else
        losses(hTeam) = losses(hTeam) + 1;
        wins(aTeam) = wins(aTeam) + 1;
    end
end

b = zeros(length(wins), 1);

for m=1:length(wins(:, 1))
    b(m) = 1+(wins(m)-losses(m))/2;
end


for m=1:length(wins(:, 1))
    c(m, m) = 2 + wins(m) + losses(m);
end


c = inv(c);
values = c*b;

teams = string(teams);
finalData = horzcat(values, teams);
finalData = sortrows(finalData, -1);
finalData;




    

    





    




            




        