centroids = [-1.3250, -0.2900; -15.2579, -0.8837; 9.0944, 0.6919;];

centroids

stdCol1 = std(centroids(:,1))
meanCol1 = mean(centroids(:,1))
stdCol2 = std(centroids(:,2))
meanCol2 = mean(centroids(:,2))

for i = 1:rows(centroids(:,1))
    centroids(i,1) = centroids(i,1) * stdCol1 + meanCol1;
end
for j = 1:rows(centroids(:,2))
    centroids(i,2) = centroids(i,2) * stdCol2 + meanCol2;
end

centroids