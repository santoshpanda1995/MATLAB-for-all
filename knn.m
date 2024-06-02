load fisheriris
X = meas;
Y = species;
Mdl = fitcknn(X,Y,'NumNeighbors',5,'Standardize',1)
