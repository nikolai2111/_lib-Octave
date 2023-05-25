function fourierSpectrum(filename, xMin, xMax, format)
%This function calculates the coefficients and the coresponding frequencies
%with the function fourierCoefficients and displays the spectrum in a graph.
%
%   fourierSpectrum(filename, xMin, yMax, format, dispPlot)
%
%---Output---
%
%---Input---
%   filename:       Filename of the input file.
%   xMin:           Minimal value of the x-axis.
%   xMax:           Maximal value of the x-axis.
%   format:         Format of the file
%
%                   Supported formats:
%                   'audio'
%                   Uses the function audioread.
%                   Supported types (.wav, .mp3, .m4a, .mp4, etc.)
%   displayPlot:    Is used for display the plot to check if it's right.
%                   'Y' or 1 to display the plot.

% Choosing the correct format
if format == 'audio' % For audio formats
    disp('Audio was imported.')
    % Import
    [y, Fs] = audioread(filename);
    % Parameters
    Dt = 1 / Fs;
    n = length(y);
    t=[1:n]*Dt;

    % Calculates the coefficients and the frequencies
    [c, f] = fourierCoefficients(t, y);
else
    disp('NO data importet, wrong format.')
end%if

figure(1);
plot(f, abs(c(1:end-1)))
grid on
xlim([xMin, xMax])
xlabel('Frequency /Hz')
ylabel('Coefficient |c_K|')
end%function

