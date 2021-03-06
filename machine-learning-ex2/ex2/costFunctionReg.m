function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
L = eye(size(theta));
L(1,1) = 0;
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


for i=1:m
  J = J + 1/(m) * ((-1)*y(i,1) * log(sigmoid(X(i,:)*theta)) - (1 - y(i,1)) * log(1 - sigmoid(X(i,:)*theta)));
endfor;

for i=2:size(theta)
  J = J + lambda / (2 * m ) * (theta(i,1)^2);
endfor;

for i=2:size(theta)
  grad(i,1) = 1/m*(sigmoid(X * theta) - y)' * X(:, i) + lambda / m * theta(i);
endfor;
grad(1,1) = 1/m*(sigmoid(X * theta) - y)' * X(:, 1);

% =============================================================

end
