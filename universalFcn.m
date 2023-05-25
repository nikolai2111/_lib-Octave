function y = universalFcn(fcn, x, p, dispPlot)
%Universal functions, calculates y according to the given parameters p with the selected function.
%
%   yValue = universalFit(functionModel(x,p), xValue, parameter, displayPlot)
%
%---Output---
%   yValue:             Y-Values calculated with the given function and X-Values
%
%---Input---
%   functionModel:      Model of the function which should used to calculate.
%                       Example: fcn = @(t,p) p(2) + (p(1) - p(2)).*exp(-t./p(3));
%
%                       Predefined Models:
%                       'expGrowth' & 'expDecay'
%                           Model:          p(1) .* exp(x ./ p(2))
%                           Parameters:     p(1):   Begining Amplitude A_0
%                                           p(2):   Timeconstant \tau
%                           Comment:        p(2) is pos. for 'expGrowth' and neg. for 'expDecay'
%
%                       'expApproch'
%                           Model:          p(2) + (p(1) - p(2)) .* exp(-x ./ p(3))
%                           Parameters:     p(1):   Start value A_Begin
%                                           p(2):   Value which gets approximated A_End
%                                           p(3):   Timeconstant \tau
%                           Comment:        no comment
%
%                       'log'
%                           Model:          p(1) + p(2) * log(x + p(3))
%                           Parameters:     p(1):   Vertical shift (along the Y-axis)
%                           Comment:        The other parameters haven't a "real" meaning the are
%                                           mixed together.
%
%                       'sqrt'
%                           Model:          p(1) + p(2) * sqrt(x + p(3))
%                           Parameters:     p(1):   Vertical shift (along the Y-axis)
%                           Comment:        The other parameters haven't a "real" meaning the are
%                                           mixed together.
%
%                       'sin'
%                           Model:          no model
%                           Parameters:     p(1):
%                                           p(2):
%                                           p(3):
%                                           p(4):
%                           Comment:        no comment
%
%   xValue:             Values of x or t or whatever variable
%   parameter:          Parameter whitch should used to calculate with the given
%                       model.
%   displayPlot:        Is used for display the plot to check if it's right.
%                       'Y', 'y' or 1 to display the plot.

% Predefined models
if isa(fcn, 'function_handle')
    disp('Custom function handle is used.')

else if isa(fcn, 'char') % Looking for predefined models

        switch fcn
            case 'expDecay' % Is the same expect the sign of the exponent
            case 'expGrowth'
                disp('Fitting model "exponential decay/growth" used.')
                fcn = @(x,p) p(1).*exp(x./p(2));

            case 'expApproch'
                disp('Fitting model "exponential approach" used.')
                fcn = @(x,p) p(2) + (p(1) - p(2)).*exp(-x./p(3));

            case 'log'
                disp('Fitting model "logarithmic" used.')
                fcn = @(x,p) p(1) + p(2) * log(x - p(3));

            case 'sqrt'
                disp('Fitting model "squareroot" used.')
                fcn = @(x,p) p(1) + p(2) * sqrt(x + p(3));

            otherwise
                disp('Not a predefined fitting model!')
        end%if

    else
        disp('The fitting model is not valid')
    end%if
end%if

% Calculate yValue
y = fcn(x,p);

% Plots the figure to check the result
if dispPlot == 'Y' || dispPlot == 'y' || dispPlot == 1
    disp('Fit-Plot enabled')

    figure(1),clf;
    plot(x,y,'-b')
    grid on
    xlabel('x')
    ylabel('y')
else
    disp('Fit-Plot disabled')
end%if
end%function
