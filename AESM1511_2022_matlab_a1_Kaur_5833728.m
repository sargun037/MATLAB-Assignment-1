%%
% Assignment 1- LTI Systems and Principal of Superposition
% Author- Sargun Kaur
% Student ID- 5833728

start = -pi/2; % minimum observational point along horizontal axis
stop = 3*pi/2; % maximum observational point along horizontal axis
steps=1257;    % number of observation points

% Calculate the horizontal distance between data points
len=(abs(start)+abs(stop))/steps; 
disp('The sampling length is:');
disp(len)

% Create an evenly spaced row vector between -pi/2 and 3pi/2
x=linspace(start,stop,steps); 

% Display the number of observation points
disp('Length of the signal is:')
disp(numel(x))

% Scale x with odd numbers between 1 and 11 to obtain all six signals
scale= [1:2:11];
y1 = sin(x .* scale(1))./scale(1);
y2 = sin(x .* scale(2))./scale(2);
y3 = sin(x .* scale(3))./scale(3);
y4 = sin(x .* scale(4))./scale(4);
y5 = sin(x .* scale(5))./scale(5);
y6 = sin(x .* scale(6))./scale(6);

% Create a new matrix of dimensions 6 x 1257
% Add all six signals to the matrix in separate rows
newsignal= zeros(6,1257);
newsignal= [y1;y2;y3;y4;y5;y6];

% Plot all scaled signals
subplot(2,2,1), plot(x,newsignal);
legend('Scale :'+string(scale))

% Calculate the cumulative sum of all rows in matrix newsignal
sum1=y1;
sum2=sum1+y2;
sum3=sum2+y3;
sum4=sum3+y4;
sum5=sum4+y5;
sum6=sum5+y6;

% Plot a graph to obtain summed signals
subplot(2,2,2);
plot(x,sum1,x,sum2,x,sum3,x,sum4,x,sum5,x,sum6);
legend('Mastersignal', 'Sum of first 2 signals',' Sum of first 3','Sum of first 4','Sum of first 5','Sum of first 6');


evensum= y2+y4+y6;      % Calculate sum of even-numbered rows
oddsum=y1+y3+y5;        % Calculate sum of odd-numbered rows
totalsum=evensum+oddsum;% Calculate sum of even and odd rows

% Plot sum of all even matrix-rows, odd rows and sum of both sums
subplot(2,2,3);
plot(x,evensum, x, oddsum, x, totalsum);
legend('Sum of even scales', 'Sum of odd scales', 'Sum of even and odd scales')
disp(['The mastersignal shows a decreasing amplitude and increasing frequency with addition of more signals. Thus on addition of 1000 signals, the mastersignal will start to represent a Square wave'])

% Plot cummulative sum of all signals and 
% sum of all odd and all even signal matrix-rows
subplot(2,2,4);
plot(x,sum6,x,totalsum);
legend('Sum of all scales', 'Sum of even and odd scales')


