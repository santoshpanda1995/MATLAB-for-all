load fisheriris;
inds = ~strcmp(species,'versicolor');
X = meas(inds,1:2);
s = species(inds);
SVMModel = fitcsvm(X,s);
sv = SVMModel.SupportVectors; % Support vectors
beta = SVMModel.Beta; % Linear predictor coefficients
b = SVMModel.Bias; % Bias term
hold on
gscatter(X(:,1),X(:,2),s)
plot(sv(:,1),sv(:,2),'ko','MarkerSize',10)
X1 = linspace(min(X(:,1)),max(X(:,1)),100);
X2 = -(beta(1)/beta(2)*X1)-b/beta(2);
plot(X1,X2,'-')

m = 1/sqrt(beta(1)^2 + beta(2)^2);  % Margin half-width
X1margin_low = X1+beta(1)*m^2;
X2margin_low = X2+beta(2)*m^2;
X1margin_high = X1-beta(1)*m^2;
X2margin_high = X2-beta(2)*m^2;
plot(X1margin_high,X2margin_high,'b--')
plot(X1margin_low,X2margin_low,'r--')
xlabel('X_1 (Sepal Length in cm)')
ylabel('X_2 (Sepal Width in cm)')
legend('setosa','virginica','Support Vector', ...
    'Boundary Line','Upper Margin','Lower Margin')
hold off
