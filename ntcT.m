function T = ntcT(R_T, B = 3984, R_ref = 10e3, T_ref = 25)
%Function to calculate the resistance from the given temperature.
%
%   T = ntcR(R_T, B, R_ref, T_ref)
%
%   Paramter 2 to 4 are optionally, standard values given below are used!
%
%---Output---
%   T:      Temperature in °C.
%
%---Input---
%   R_T:    Resistance at the temperature T in °C.
%   B:      B-Konstant in K, usually also B_{x/y} called, usually 3984K.
%           Typical ranges:
%           B_{0/50}:     3000 – 4140K
%           B_{25/50}:	 	1950 – 5000K
%           B_{25/85}:		2680 – 4792K
%           B_{25/100}:   2758 – 5000K
%   R_ref:  Reference resistance in Ω, at the temperature T_ref, usually 10kΩ.
%   T_ref:  Reference temperature in °C, usually 25°C.

  % Convert temperatures in Kelvin
  T_ref = C2K(T_ref);

  % Calculate temperature
  T = (B .* T_ref)./(B + log(R_T./R_ref) .* T_ref);

  % Convert temperature in °C
  T = K2C(T);

end%function
