function ut=uTemp(temp)
%This function calcualtes the Thermal Voltage at a specific Temperature.
%
%   U_T = uTemp(Temp)
%
%---Output---
%   U_T:    Thermal Voltage in V.
%
%---Input---
%   Temp:   Temperature in °C.

%% Calculating the Thermal Voltage
ut = ((1.3806488e-23) .* (273.15 + temp)) ./ (1.6021765e-19);

end

