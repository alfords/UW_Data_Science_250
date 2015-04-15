function simpleKMeansTests
clc
points = simplePoints;

centroids = [0, 0; -1, 0; 0, 1];
disp(' ');
disp(' -------------------------------------------x ');
disp(' -------------------------------------------- ');
disp(' ');
disp( 'The following are standard results:');
centroids = simpleKMeans(points, centroids)
% centroids:
%   -1.3250   -0.2900
%  -15.2579   -0.8837
%    9.0944    0.6919

centroids = [0, 0; -1, 0; 0, 1];
disp(' ');
disp(' -------------------------------------------- ');
disp(' ');
disp(' The following results are for segmentations in normalized space:');
disp(' Inputs were normalized, segmented, and the resulting centroids de-normalized:');
centroids = simpleKMeansFinished(points, centroids)
% centroids:
%   0.25200   -0.58680
% -14.66500   -1.04300
%   7.56316    0.93500

disp(' ');
disp(' -------------------------------------------- ');

centroids = [0, 0; -10, -1; 10, 1];
disp(' ');
disp(' -------------------------------------------- ');
disp(' -------------------------------------------- ');
disp(' ');
disp( 'The following are standard results:');
centroids = simpleKMeans(points, centroids)
% centroids:
%   -1.3250   -0.2900
%  -15.2579   -0.8837
%    9.0944    0.6919

centroids = [0, 0; -10, -1; 10, 1];
disp(' ');
disp(' -------------------------------------------- ');
disp(' ');
disp(' The following results are for segmentations in normalized space:');
disp(' Inputs were normalized, segmented, and the resulting centroids de-normalized:');
centroids = simpleKMeansFinished(points, centroids)
% centroids:
%  -0.077778   -0.499259
% -14.665000   -1.043000
%   8.216667    0.953889

disp(' ');
disp(' -------------------------------------------- ');
