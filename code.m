% print("how would you like to enter data? 1. record voice 2. use recorded clip.");
% input(choice);
%  switch(choice)
clc
clear all
fs=16000;                      % Sampling rate

nbits=16;

nChannels=1;

duration=5;                 % Recording duration

arObj=audiorecorder(fs, nbits, nChannels);

fprintf("Press any key to start %g seconds of recording…", duration); pause

fprintf("Recording…");

recordblocking(arObj, duration);

fprintf("Finished recording.\n");

fprintf("Press any key to play the recording…"); pause; fprintf("\n");

play(arObj);

fprintf("Plotting the waveform…\n");

y=getaudiodata(arObj);          % Get audio sample data

plot(y);             % Plot the waveform

ms2 = fs/500;

ms20 = fs/50;

r = xcorr(y, ms20, "coeff");

d = (-ms20:ms20)/fs;

plot(d, r);

title("Autocorrelation");

xlabel("Delay (s)");

ylabel("Correlation coeff.");

r = r(ms20 + 1 : 2*ms20+1);

[rmax, tx] = max(r(ms2:ms20));

 Fx = fs/(ms2+tx-1);

 %%—-recognizing voice—

Fth= 160; %% threshold frequency is 160 Hz, you can change this frequency too

if Fx> Fth

    disp("It is a female voice!")

else

    disp("It is a male voice!")

end
