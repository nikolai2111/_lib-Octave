function R_T = SHntcR(T, coeff)
%Function to calculate the resistance from the given temperature with the
%Steinhart-Hart formula.
%
%   R_T = SHntcR(T, coeff)
%
%   With coeff = [A, B, C].
%
%---Output---
%   R_T:        Resistance at the temperature T in °C.
%
%---Input---
%   T:          Temperature in °C.
%   [A, B, C]:  Steinhart-Hart coefficients as an array.

  % Convert temperatures in Kelvin
  T = C2K(T);

  if length(coeff) == 3
    % Pick out coefficients
    A = coeff(1);
    B = coeff(2);
    C = coeff(3);

    % Calculate resistance
    x = (A - 1./T)./C;
    y = sqrt((B./(3.*C)).^3 + (x./2).^2);
    R_T = exp((y - x./2).^(1./3) - (y + x./2).^(1./3));
  else
    assert(length(coeff) == 3, "SHntcR(): Invalid number of coefficients! Only 3 coefficients needed.")
    R_T = NaN(1);
  end

end%function
