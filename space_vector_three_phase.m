% File name: PhasorAnimation.m
% Author: CHAN Yun Sang, Ethan; CHAN Ho Kwan, Tony; SIU Pui Yin, Benji
% Department of Electrical Engineering, The Hong Kong Polytechnic
% University
% Email: ethan.ys.chan@connect.polyu.hk
% Demonstration program: Phasor and space vector

clear all
close all
clc

% SETUP ===================================================================
% all physical quantities in S.I. units unless stated otherwise
h=msgbox({'Author: CHAN Yun Sang, Ethan; CHAN Ho Kwan, Tony; SIU Pui Yin, Benji','','Department of Electrical Engineering, The Hong Kong Polytechnic University','','Demonstration program: Phasor and space vector'},"Copyright Information","modal");
uiwait(h);
prompt = {'Enter the AC line frequency (Default is 50Hz)','How many seconds do you want the simulation to run? (Default is 0.02 seconds)' };
dlgtitle = 'AC Line frequency & Simulation Runtime';
dims = [1 80];
definput = {'50','0.02'};
user_input = inputdlg(prompt,dlgtitle,dims,definput);
A = 10;                     % Amplitude of the AC Voltage
f_num=str2double(user_input(1,1));
runtime_num=str2double(user_input(2,1));
T=1/f_num;
N = 100;                   % Number of frames for animation; smaller the value, the more triagular the sinewave will be
dummy=1.5;
t = linspace(0,runtime_num,100);                  % time increment
v = A .* sin(2*pi*t/T);     % Mathmatic function of the AC Waveform
V1 = A .* sin(2*pi*t/T+2*pi/3*1);  % phase shift forward 120 degree
V2 = A .* sin(2*pi*t/T+2*pi/3*2);  % phase shift forward 240 degree

Phase_Num= [0:2];
real=cos(2*pi/3.*Phase_Num);
imaginary=sin(2*pi/3.*Phase_Num);

% GRAPHICS ================================================================
%   Setup for plot window
figure('Name','Phasor & Vector Time Domain Plotting','NumberTitle','off')
set(gcf,'units','normalized'); 
set(gcf,'position',[0.1 0.1 0.8 0.6]);
set(gcf,'Color',[1 1 1]);
set(gca,'FontSize',12);


% circle
p = linspace(0,2*pi,500);
xc = dummy*A .* cos(p);  % Horizontal Parameter of Circle_Voltage
yc = dummy*A .* sin(p);  % Vertical Parameter of Circle_Voltage


for c = 1 : N
   hold off
   %Circle Voltage
   
   subplot(1,2,1);

   plot([0 v(c)*real(1)],[0 v(c)*imaginary(1)],'lineWidth',3,'Color',[0 0 1], 'LineStyle',':'); % Tracking line of circle (Blue) degree:0
   hold on
   plot([v(c)*real(1) v(c)*real(1)+V1(c)*real(2)],[v(c)*imaginary(1) v(c)*imaginary(1)+V1(c)*imaginary(2)],'lineWidth',3,'Color',[1 1 0], 'LineStyle',':'); % Tracking line of circle (yellow) degree:120

   plot([v(c)*real(1)+V1(c)*real(2) v(c)*real(1)+V1(c)*real(2)+V2(c)*real(3)],[v(c)*imaginary(1)+V1(c)*imaginary(2) v(c)*imaginary(1)+V1(c)*imaginary(2)+V2(c)*imaginary(3)],'lineWidth',3,'Color',[0 1 0], 'LineStyle',':');% Tracking line of circle (yellow) degree:240
   
   plot([0 v(c)*real(1)+V1(c)*real(2)+V2(c)*real(3)],[0 v(c)*imaginary(1)+V1(c)*imaginary(2)+V2(c)*imaginary(3)],'lineWidth',2,'Color',[0 0 0]); % Tracking line of circle (Black) combined

   plot(xc,yc,'b','lineWidth',1);  % Perimeter of circle
   title('Space Vectors in  Complex Plane')
   xlabel('Unit Length');
   xP = [0 0]; yP = [-A*dummy A*dummy]; % Background vertical coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);

   xP = [-A*dummy A*dummy]; yP = [0 0];  % Background horizontal coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);
   
   hold off
   set(gca,'FontSize',14);
   txtTime = ['Time: ' num2str(t(c)) 's'];
   txtFrequency = ['Frequency: ' num2str(f_num) 'Hz'];
   txtPeriod = ['Period: ' num2str(T) 's'];
   text(16,10,txtTime,'FontSize',12);
   text(16,15,txtFrequency,'FontSize',12);
   text(16,5,txtPeriod,'FontSize',12);
   axis equal
   axis on

  % Sin wave Voltage 
  subplot(1,2,2);
   
   xP = [0 t(end)]; yP = [0 0]; %Background horizontal axis of sin wave, [start point, end point]
   plot(xP,yP,'k','LineWidth',1);
   hold on
   
   xlabel('Time in seconds')
   ylabel('Amplitude')
   
   title('Balanced 3-phase currents waveform')
   xP = t(1:c); yP = v(1:c); % Horizontal component of sin wave (blue trcking line)
   plot(xP,yP,'b','LineWidth',2); 

   yP2 = V1(1:c); % Horizontal component of sin wave (yellow trcking line)
   plot(xP,yP2,'y','LineWidth',2); 

   yP3 = V2(1:c); % Horizontal component of sin wave (green trcking line)
   plot(xP,yP3,'g','LineWidth',2); 

   hold off
   set(gca,'FontSize',12);
   axis on
   pause(0.001) % Delay 

end
h1=msgbox({'Simulation completed successfully! You may now close the window.'},"Simulation End","modal");
