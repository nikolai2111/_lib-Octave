function [realt,imagt,mag,angR,angD] = comp(w)
%This function calculates all nessecary parts of a complex number.
%
%   [real, imag, mag ,angleRAD, angelGRAD] = comp(w)
%
%---Output---
%   real:       Real part of the complex number w.
%   imag:       Imaginary part of the complex number w.
%   mag:        Magnitude of the complex number w.
%   angleRAD:   Angle in RAD of the complex number w.
%   angleGRAD:  Angle in ° of the complex number w.
%
%---Input---
%   w:          Complex number.

%% Calculating the parts
realt=real(w);
imagt=imag(w);
mag=abs(w);
angR=angle(w);
angD=rad2deg(angle(w));
end
