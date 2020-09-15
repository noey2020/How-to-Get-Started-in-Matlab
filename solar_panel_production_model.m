dec = 23.45       % Summer solstice
lat = 42 + 17/60  % Natick: 42° 17'
%Convert from degrees to radians
dec = deg2rad(dec);
lat = deg2rad(lat);
%Make a vector of times from 5:30 am to 8 pm (slightly after sunrise to slightly before sunset). Use 1/4-hour increments (to match measured data).
t = 5.5:0.25:20;
LST = t - 1 + 14.6/60;
sunangle = sin(dec)*sin(lat) + cos(dec)*cos(lat)*cosd(15*(LST - 12));
plot(t,sunangle)
S_inc = 1.4883*0.7.^(sunangle.^-0.678);
%Calculate the final theoretical production for the whole array of panels, including the inverter limit (207 kW).
production_theory = 270*S_inc.*sunangle;
production_theory = min(production_theory,207);
plot(t,production_theory)
xlabel('Time of day')
ylabel('Production (kW)')
title('Theoretical max energy production for AH3 solar array')
%Compare with recorded data
%Import data for June 2018 from file.
production = readtable("GettingStartedWithMATLAB\SolarArrayProduction.xlsx");  % equivalent to using the Import Tool
plot(production.Timestamp,production.AH3)
xlabel('Date')
ylabel('Production (kW)')
title('AH3 solar array energy production for June 2018')

%Zoom in on June 21 (summer solstice).
xlim(datetime(2018,6,21:22))
ylim([-5 220])

%Zoom in on June 26 (completely clear day).
xlim(datetime(2018,6,26:27))
ylim([-5 220])

%Reorganize data into a matrix of times by days (4*24 = 96 times, by 30 days).
June2018 = reshape(production.AH3,96,30);
dayofinterest = June2018(:,26);
%Make a vector of times and plot the data for one day.
tfullday = 0:0.25:23.75;
plot(tfullday,dayofinterest,'.-')
%Compare against theory.
plot(tfullday,dayofinterest,'.-',t,production_theory)
xlabel('Time of day')
ylabel('Production (kW)')
legend('Measured data','Theoretical maximum')