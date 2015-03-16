function [FitArray] = Fitness( Result)
%FITNESS Summary of this function goes here
%   Detailed explanation goes here
FitArray = zeros(1, length(Result));
for i=1:length(Result)
        FitArray(i) = sum(sum(Result{i}(:, 1:2:end, 1)-Result{i}(:, 2:2:end, 1)));
end

end

