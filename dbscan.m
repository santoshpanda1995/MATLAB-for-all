rng('default') % For reproducibility

% Parameters for data generation
N = 300;  % Size of each cluster
r1 = 0.5; % Radius of first circle
r2 = 5;   % Radius of second circle
theta = linspace(0,2*pi,N)';

X1 = r1*[cos(theta),sin(theta)]+ rand(N,1); 
X2 = r2*[cos(theta),sin(theta)]+ rand(N,1);
X = [X1;X2]; % Noisy 2-D circular data set

figure;
scatter(X(:,1),X(:,2))

idx = dbscan(X,1,5); % The default distance metric is Euclidean distance
figure;
gscatter(X(:,1),X(:,2),idx);
title('DBSCAN Using Euclidean Distance Metric')

idx2 = dbscan(X,1,5,'Distance','squaredeuclidean');
figure;
gscatter(X(:,1),X(:,2),idx2);
title('DBSCAN Using Squared Euclidean Distance Metric')
