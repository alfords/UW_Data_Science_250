% simpleKMeans is a 2D K-means implementation.  
% The function takes points and initial centroids and 
% returns centroids K-mean centroids
function centroids = simpleKMeans(points, centroids)
% test:  centroids = simpleKMeansFinished(simplePoints, [0, 0; -1, 0; 0, 1])
% test:  simpleKMeansTests
% Get ridiculous values for the initial cluster ids
clusterIDOld = -1;

% Parameters for normalization and de-normalization
% Determine the mean and standard deviation of the points in both dimensions
% Missing code:
stdCol1 = std(points(:,1));
meanCol1 = mean(points(:,1));
stdCol2 = std(points(:,2));
meanCol2 = mean(points(:,2));

% Normalize points
% for each dimension for each point subtract away its mean and then divide by the standard deviation
% Missing code:
for i = 1:rows(points(:,1))
    points(i,1) = (points(i,1) - meanCol1) / stdCol1;
end
for i = 1:rows(points(:,1))
    points(i,2) = (points(i,2) - meanCol2) / stdCol2;
end

% Normalize Centroids
% For each dimension and centroid subtract away the mean of the dimension
% and then divide by the standard deviation of the dimension
% Missing code:
for i = 1:rows(centroids(:,1))
    centroids(i,1) = (centroids(i,1) - meanCol1) / stdCol1;
end
for i = 1:rows(centroids(:,1))
    centroids(i,2) = (centroids(i,2) - meanCol2) / stdCol2;
end

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
% for each dimension for each centroid mutiply by standard deviation and then add mean
% Missing code:
for i = 1:rows(centroids(:,1))
    centroids(i,1) = centroids(i,1) * stdCol1 + meanCol1;
end
for j = 1:rows(centroids(:,2))
    centroids(i,2) = centroids(i,2) * stdCol2 + meanCol2;
end

% End the function
return

%{
1a. The data needs to be standardized before running K-Mean clustering. Normalization 
    standardizes the data.

1b. I would assign numeric values to categories or binarize (if applicable).

1c. Clustering algorithms cannot be influenced nor corrected as opposed to 
    supervised learning algorithms that can be directed. 

2. The call from within simpleKMeans to simpeDetermineCentroids(points, clusterID, 
   size(centroids, 1)) returns closest centroid matrix.

3. The call from within simpleKMeans to simpleDetermineCentroids return a matrix 
   populated with points and centroid numbers the points belong to.
%}
