function coeff = SHcoeff(R_ref, T_ref)
%Function to calculate the Steinhart-Hart coefficients for the conversion with
%Steinhart-Hart formula.
%
%   coeff = SHcoeff(R_ref, T_ref)
%
%   With coeff = [A, B, C].
%
%---Output---
%   coeff:    Steinhart-Hart coefficients as an array.
%
%---Input---
%   R_ref:    Reference resistances in Ω.
%   T_ref:    Reference resistances in °C.

  if (length(R_ref) == 3) && (length(T_ref) == 3)
    %Pick out coefficients and take logarithm
    L_1 = log(R_ref(1));
    L_2 = log(R_ref(2));
    L_3 = log(R_ref(3));

    % Form matrix
    L = [1, L_1, L_1^3;
         1, L_2, L_2^3;
         1, L_3, L_3^3];

    % Convert temperatures in Kelvin, pick out coefficients and creat vector
    T = 1./[C2K(T_ref(1)); C2K(T_ref(2)); C2K(T_ref(3))];

    coeff = L^(-1) * T;
  else
    assert((length(R_ref) == 3) && (length(T_ref) == 3), "SHcoeff(): Invalid number of parameters! Only 3 entries per parameter needed.")
    coeff = NaN(1, 3);
  end

end%function
