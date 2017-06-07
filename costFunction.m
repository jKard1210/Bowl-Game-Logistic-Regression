function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
 m = length(y); % number of training examples
 n = length(theta); %number of parameters (features)

    % You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the cost of a particular choice of theta.
    %               You should set J to the cost.
    %               Compute the partial derivatives and set grad to the partial
    %               derivatives of the cost w.r.t. each parameter in theta

    % ----------------------1. Compute the cost-------------------
    %hypothesis
 h = sigmoid(X*theta);
 T = -y.*log(h) - (1 - y).*log(1-h);
 J = sum(T)/m;
   
for i = 1:m,
    grad = grad + (h(i) - y(i)) * X(i,:)';
end
    % =============================================================
grad = 1/m*grad;
end