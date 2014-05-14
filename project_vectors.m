function project_vectors(origForeignVecFile, origEnVecFile,  subsetEnVecFile, subsetForeignVecFile, outputEnFile, outputForeignFile, truncRatio)

% first column is words, hence not being read
origEnVecs = dlmread(origEnVecFile, ' ', 0, 1);
origForeignVecs = dlmread(origForeignVecFile, ' ', 0, 1);
subsetEnVecs = dlmread(subsetEnVecFile, ' ', 0, 1);
subsetForeignVecs = dlmread(subsetForeignVecFile, ' ', 0, 1);

% Normalize all the matrices by rows
origEnVecs = normr(origEnVecs);
subsetEnVecs = normr(subsetEnVecs);
subsetForeignVecs = normr(subsetForeignVecs);

% Perform CCA on the subset of the aligned vectors
[A, B, r] = canoncorr(subsetEnVecs, subsetForeignVecs);

% Project the original english matrix onto the new direction
shape = size(origEnVecs);
shapeA = size(A);
numDimA = shapeA(2);

origEnVecsProjected = (origEnVecs-repmat(mean(origEnVecs),shape(1),1)) * A(:,1:ceil(truncRatio*numDimA));
origEnVecsProjected = normr(origEnVecsProjected);

% Project the original foreign matrix onto the new direction
shape = size(origForeignVecs);
shapeB = size(B);
numDimB = shapeB(2);

origForeignVecsProjected = (origForeignVecs-repmat(mean(origForeignVecs),shape(1),1)) * B(:,1:ceil(truncRatio*numDimB));
origForeignVecsProjected = normr(origForeignVecsProjected);

% Write the projected english vectors to file
dlmwrite(outputEnFile, origEnVecsProjected, ' ');
dlmwrite(outputForeignFile, origForeignVecsProjected, ' ');

% Delete all matrices from memory
clear;