% Question 1:
% A) So that the dimensions (data attributes) have similar scales.  
% B) Category attributes are binarized.
% C) The algorithm is not told what is observed or what the "goal" is.  There is no expert label.
% Question 2: simpleAssignToCentroids returns a vector where the value at index i is the cluster number (like 1, 2, or 3) for point(i, :);  In this case i is 17
% Question 3: simpleDetermineCentroids returns a matrix called centroids where row i is the centroid for cluster i.  In this case i is 2.

% simpleKMeans is a 2D K-means implementation.
% The function takes points and initial centroids and
% returns centroids K-mean centroids
function centroids = simpleKMeansFinished(points, centroids)

% test:  centroids = simpleKMeans(simplePoints, [0, 0; -1, 0; 0, 1])
% test:  simpleKMeansTests
% Get ridiculous values for the initial cluster ids
clusterIDOld = -1;

% Parameters for normalization and de-normalization
% Determine the mean and standard deviation of the points in both dimensions
% Missing code:
meanPoints = mean(points);
sigma = std(points);

% Normalize points
% for each dimension for each point subtract away its mean and then divide by the standard deviation
% Missing code:
points = (points .- meanPoints) ./ sigma;

% Normalize Centroids
% For each dimension and centroid subtract away the mean of the dimension
% and then divide by the standard deviation of the dimension
% Missing code:
centroids = (centroids .- meanPoints) ./ sigma;

% repeat the following processes using a loop.  Use a for loop to prevent infinite loops
for (iter1 = 1:20)
    % For each point find its closest cluster centre (centroid)
    clusterID = simpleAssignToCentroids(points, centroids);
    % If there was no change in cluster assignments, then stop;  Use "break" to break out of the loop
    if (sum(clusterID ~= clusterIDOld) < 1)   
        break;
    end % if
    % For each cluster of points determine its centroid;  The number of clusters is the number of centroids
    centroids = simpleDetermineCentroids(points, clusterID, size(centroids, 1));
    % remember clusterID before clusterID is re-assigned
    clusterIDOld = clusterID;
    % end the for loop
end % for

% Denormalization
% for each dimension for each centroid multiply by standard deviation and then add mean
% Missing code:
centroids = (centroids .* sigma) .+ meanPoints;

% End the function
return
