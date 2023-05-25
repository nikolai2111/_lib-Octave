function T = SHntcT(R_T, coeff)
%Function to calculate the temperature from the given resistance with the
%Steinhart-Hart formula.
%
%   T = SHntcT(R_T, coeff)
%
%   With coeff = [A, B, C].
%
%---Output---
%   T:          Temperature in °C.
%
%---Input---
%   R_T:        Resistance at the temperature T in °C.
%   [A, B, C]:  Steinhart-Hart coefficients as an array.

  if length(coeff) == 3
    % Pick out coefficients
    A = coeff(1);
    B = coeff(2);
    C = coeff(3);

    % Calculate resistance
    T = (A + B.*log(R_T) + C.*log(R_T).^3).^(-1);

    % Convert temperature in °C
    T = K2C(T);
  else
    assert(length(coeff) == 3, "SHntcT(): Invalid number of coefficients! Only 3 coefficients needed.")
    T = NaN(1);
  end

end%function
