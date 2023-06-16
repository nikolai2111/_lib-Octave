function y=trigPoly(t, w_0, m, a, b)
%Calculates the value of the trigonomic Polynom at the point t
%   Detailed explanation goes here

ka=1:length(a);
A=cos(w_0*ka'*t);

kb=1:length(b);
B=sin(w_0*kb'*t);

y=m+a*A+b*B;
end

