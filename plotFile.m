function plotFile(filename,lableX,lableY)
%Plots File with the entered axis name.
%   plotFile(filename,0,0) uses the standart names for the axis.
[x,y]=textread(filename,'%f %f');

if lableX==0
    lableX='x';
end%if

if lableY==0
    lableY='y';
end%if

plot(x,y,'xr');
grid on
xlabel(lableX)
ylabel(lableY)
end%func

