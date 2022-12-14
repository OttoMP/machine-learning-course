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

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

theta_non_zero = theta;
theta_non_zero(1,:) = [];

hip = sigmoid(X*theta);
cost1 = -y'*log(hip);
cost2 = (1-y)'*log(1-hip);
cost_h = cost1 - cost2;
cost_reg = sum(theta_non_zero.^2)*lambda/(2*m);
J = cost_h/m + cost_reg;

reg = lambda/m*theta_non_zero;
grad = (X'*(hip-y))/m + [0; reg];


% =============================================================

end
