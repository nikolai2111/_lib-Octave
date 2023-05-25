function F = C2F(C)
%Function converts temperature in °C to °F.
%
%   F = C2F(C)
%
%---Output---
%   F:      Temperature in °F.
%
%---Input---
%   C:      Temperature in °C.

  F = (C .* 1.8) + 32;

end
