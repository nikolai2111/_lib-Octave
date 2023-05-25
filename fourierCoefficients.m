function [c, f] = fourierCoefficients(t, y)
%This function calculates the coefficients and the coresponding frequencies.
%
%   [coefficients, frequency] = fourierCoefficients(xValues, yValues)
%
%---Output---
%   coefficients:   Complex coefficients of the F.T.
%   frequency:      Frequencies coresponding to the coefficients.
%
%---Input---
%   xValues:        Values of the x-axis usually time values t.
%   yValues:        Values of the y-axis usually the values of f(t).

%% Calculating the coefficients and the frequency
% Number of taken measurements
n = length(y);

% Checks if n is odd or even
if mod(n, 2) == 0
    n_half = n/2 - 1;
else
    n_half = (n - 1)/2;
end%if

% Calculate the fast fourier transformation
c = fft(y);
c = c(1:n_half + 1)/n; % trim the coefficients because only n/2 + 1 are valid coefficients

% Calculate the period
T = n * (t(2) - t(1));

% Calculate the frequency
k = 1:n_half+1;
f = 1/T * k;

end%function

