function testSimpleKMeans
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Step 0
% Place the following files in your working directory:  
%		simpleAssignToCentroids.m
%		simpleDetermineCentroids.m
%		simpleKMeans.m
%		simplePoints.m
%		testSimpleKMeans.m
%		simpleKMeansFinished_0Points.m
%		simpleKMeansFinished_zScore.m
%
% Step 1
% Remove any previous file called simpleKMeansFinished.m 
% from your working directory.
% Place the student's file simpleKMeansFinished in your working directory.
%
% Step 2
% In the console type:  clear all
% In the console type:  testSimpleKMeans
%
% Step 3
% Copy the outputs that start with "simpleKMeansFinished" to a txt file
% 
% Repeat from Step 1 for the next student
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% You can test the system by renaming simpleKMeansFinished_zScore.m to
% simpleKMeansFinished.m and then going through Steps 1 to 3.  You should
% get 6 points
%
% You can test the system by renaming simpleKMeansFinished_0Points.m to
% simpleKMeansFinished.m and then going through Steps 1 to 3.  You should
% get 0 points
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

warning('off','all')
clc
points = simplePoints;
disp(' -------------------------------------------- ');
disp(' -------------------------------------------- ');

%
% Test of Test
%
if (exist('simpleKMeans.m') ~= 2)
	disp('simpleKMeans.m is not found.')
	disp('simpleKMeans.m must be in your working directory.')
	disp('simpleKMeans must work before this test works.')
	return;
end % if
centroids = [0, 0; -1, 0; 0, 1];
try
	centroids = simpleKMeans(points, centroids);
catch
	disp('simpleKMeans does not work and may not compile.')
	disp('simpleKMeans may not have its dependent files.')
	disp('simpleKMeans must work before this test works.');
	return;
end
centroidsTest = [ ...
   -1.3250,   -0.2900; ...
  -15.2579,   -0.8837; ...
    9.0944,    0.6919; ...
	];	
comparison = compareCentroids(centroids, centroidsTest);
if (comparison == 0)
	disp('The test works');
elseif (comparison == -1)
	disp('simpleKMeans produces an unexpected number of centroids');
	disp('simpleKMeans must work before this test works.');
	return
elseif (comparison == -2)
	disp('simpleKMeans produces unexpected centroids.');
	disp('simpleKMeans must work before this test works.');
	return;
else
	disp('simpleKMeans has unexpected results');
	disp('simpleKMeans must work before this test works.');
	return
end % if

if (exist('simpleKMeansFinished.m') ~= 2)
	disp('simpleKMeansFinished.m is not found.')
	disp('simpleKMeansFinished.m must be in your working directory.')
	return;
else
	disp('simpleKMeansFinished can be tested.  Total:  0 points. ')
end % if

%
% First Test
%
centroids = [0, 0; -1, 0; 0, 1];
try
centroids = simpleKMeansFinished(points, centroids);
catch
	disp('simpleKMeansFinished does not work at all and may not compile. ');
	return
end
disp('simpleKMeansFinished compiles and passes first test.  Total:  1 point. ');

%
% Second Test
%
centroidsTest = [ ...	
    0.25200,   -0.58680; ...
  -14.66500,   -1.04300; ...
    7.56316,    0.93500; ...
	];
comparison = compareCentroids(centroids, centroidsTest);
if (comparison == 0)
	disp('simpleKMeansFinished produces correct results using first centroids and passes second test.  Total:  2 points');
elseif (comparison == -1)
	disp('simpleKMeansFinished does not pass the second test.')
	disp('simpleKMeansFinished produces an unexpected number of centroids');
	return
elseif (comparison == -2)
	disp('simpleKMeansFinished does not pass the second test.')
	disp('simpleKMeansFinished produces unexpected centroids.');
	return;
else
	disp('simpleKMeansFinished does not pass the second test.')
	disp('simpleKMeansFinished has unexpected results');
end % if	

%
% Third Test
%
centroidsTest = [ ...
   -0.077778,   -0.499259; ...
  -14.665000,   -1.043000; ...
    8.216667,    0.953889; ...
	];
centroids = [0, 0; -10, -1; 10, 1];
centroids = simpleKMeansFinished(points, centroids);
comparison = compareCentroids(centroids, centroidsTest);
if (comparison == 0)
	disp('simpleKMeansFinished produces correct results using other centroids and passes third test.  Total:  3 points');
elseif (comparison == -1)
	disp('simpleKMeansFinished does not pass the third test.')
	disp('simpleKMeansFinished produces an unexpected number of centroids');
	return
elseif (comparison == -2)
	disp('simpleKMeansFinished does not pass the third test.')
	disp('simpleKMeansFinished produces unexpected centroids.');
	return;
else
	disp('simpleKMeansFinished does not pass the third test.')
	disp('simpleKMeansFinished has unexpected results');
	return
end % if

%
% Fourth Test
%
centroids = [0, 0; -1, 0; 0, 1];
points = simplePoints;
numberOfPoints = round(0.75 * length(simplePoints));
points = points(1:numberOfPoints,:);
try
	centroids = simpleKMeansFinished(points, centroids);
catch
	disp('simpleKMeansFinished does not pass the fourth test.')
	disp('simpleKMeansFinished crashes with different input points.')
	return;
end
centroidsTest = [ ...
   8.08333,  -0.68500; ...
  -1.94286,  -0.61810; ...
   8.24571,   0.97714; ...
   ];
comparison = compareCentroids(centroids, centroidsTest);
if (comparison == 0)
	disp('simpleKMeansFinished can handle different input points and passes fourth test.  Total:  4 points');
elseif (comparison == -1)
	disp('simpleKMeansFinished does not pass the fourth test.')
	disp('simpleKMeansFinished produces an unexpected number of centroids when using different input points');
	return
elseif (comparison == -2)
	disp('simpleKMeansFinished does not pass the fourth test.')
	disp('simpleKMeansFinished is too specific for the test.');
	disp('simpleKMeansFinished produces unexpected centroids when using different input points.');
	return;
else
	disp('simpleKMeansFinished does not pass the fourth test.')
	disp('simpleKMeansFinished has unexpected results when using different input points');
	return
end % if

%
% Fifth Test
%
centroids = [0, 0; -1, 0; 0, 1; 1, 1];
points = simplePoints;
try
	centroids = simpleKMeansFinished(points, centroids);
catch
	disp('simpleKMeansFinished does not pass the fifth test.')
	disp('simpleKMeansFinished crashes with different number of centroids');
	return;
end
disp('simpleKMeansFinished can handle an additional centroid and passes fifth test.  Total:  5 points');

%
% Sixth Test
centroidsTest = [ ...
    0.25200   -0.58680
  -14.66500   -1.04300
   -2.22500    1.35750
    8.71471    0.88529
   ];
comparison = compareCentroids(centroids, centroidsTest);
if (comparison == 0)
	disp('simpleKMeansFinished works with additional centroids and passes sixth test.  Total:  6 points');
elseif (comparison == -1)
	disp('simpleKMeansFinished does not pass the sixth test.');
	disp('simpleKMeansFinished produces an unexpected number of centroids when additional input centroids are used.');
	return
elseif (comparison == -2)
	disp('simpleKMeansFinished does not pass the sixth test.');
	disp('simpleKMeansFinished produces unexpected centroids  when additional input centroids are used.');
	return;
else
	disp('simpleKMeansFinished does not pass the sixth test.');
	disp('simpleKMeansFinished has unexpected results  when additional input centroids are used.');
	return
end % if
return % testSimpleKMeans

function comparison = compareCentroids(centroids, centroidsTest)
	if (sum(size(centroids) == size(centroidsTest)) ~= 2)
		comparison = -1;
		return
	end % if
	centroids = sortrows(centroids, 1);
	centroidsTest = sortrows(centroidsTest, 1);
	diff = abs((centroids - centroidsTest)./std(centroidsTest)) > 0.05;
	if (sum(sum(diff)) > 1)
		comparison = -2;
		return
	end % if
	comparison = 0;
return % comparison = compareCentroids
