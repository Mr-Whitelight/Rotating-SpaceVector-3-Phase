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
                             
% Voltage
A = 10;                     % Amplitude of the AC Voltage
B= 5;                       % Amplitude of the AC Current
T = 360;                      % Period of the AC signal
w = 2*pi/T;                  % Angular speed of the AC phasor
N = 400;                   % Number of frames for animation; smaller the value, the more triagular the sinewave will be
t = linspace(0,3*T,N);              % time increment
v = A .* sin(2*pi*t/T);     % Mathmatic function of the AC Waveform
V1 = A .* sin(2*pi*t/T+2*pi/3);  % phase shift forward 120 degree
V2 = A .* sin(2*pi*t/T-2*pi/3);  % phase shift backward 120 degree


%vP = A .* cos(2*pi*t/T);   % Use this if you want a Cosine Waveform

% GRAPHICS ================================================================
figure(1)
%   Setup for plot window
set(gcf,'units','normalized'); 
set(gcf,'position',[0.1 0.1 0.6 0.30]);
set(gcf,'Color',[1 1 1]);
set(gca,'FontSize',12);

% circle

p = linspace(0,2*pi,500);
xc = 15 .* cos(p);  % Horizontal Parameter of Circle_Voltage
yc = 15 .* sin(p);  % Vertical Parameter of Circle_Voltage


for a = 1 : N 
for c = 1 : N
    hold off
   axis off
 %Circle Voltage

   subplot(1,2,1);
   
   plot([0 A*sin(w*t(c))],[0 0],'lineWidth',3,'Color',[0 0 1]); % Tracking line of circle (Blue)

   hold on
  
   plot([A*sin(w*t(c)) A*sin(w*t(c))+A*sin(w*t(c)-2*pi/3)*-0.5],[0 0+A*sin(w*t(c)-2*pi/3)*sqrt(3)/2],'lineWidth',3,'Color',[0 1 0]); % Tracking line of circle (Green)
   plot([A*sin(w*t(c))+A*sin(w*t(c)-2*pi/3)*-0.5 A*sin(w*t(c))+A*sin(w*t(c)-2*pi/3)*-0.5+A*sin(w*t(c)+2*pi/3)*-0.5],[0+A*sin(w*t(c)-2*pi/3)*sqrt(3)/2 0+A*sin(w*t(c)-2*pi/3)*sqrt(3)/2-A*sin(w*t(c)+2*pi/3)*sqrt(3)/2],'lineWidth',3,'Color',[1 1 0]); % Tracking line of circle (yellow)
   plot([0 A*sin(w*t(c))+A*sin(w*t(c)-2*pi/3)*-0.5+A*sin(w*t(c)+2*pi/3)*-0.5],[0 0+A*sin(w*t(c)-2*pi/3)*sqrt(3)/2-A*sin(w*t(c)+2*pi/3)*sqrt(3)/2],'lineWidth',3,'Color',[0 0 0]); % Tracking line of circle (Black)

   plot(xc,yc,'m','lineWidth',1);  % Perimeter of circle

   xP = [0 0]; yP = [-A*1.5 A*1.5]; % Background vertical coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);

   xP = [-A*1.5 A*1.5]; yP = [0 0];  % Background horizontal coordinate axis of circle
   plot(xP,yP,'k','LineWidth',1);
   
   hold off
   set(gca,'FontSize',12);
   axis equal
   axis on

  % Sin wave Voltage 
  subplot(1,2,2);

   xP = [0 t(end)]; yP = [0 0]; %Background horizontal axis of sin wave, [start point, end point]
   plot(xP,yP,'k','LineWidth',1);
   xlabel('x/degree')
   ylabel('amplitude')
   hold on
  
   xP = t(1:c); yP = v(1:c); % Horizontal component of sin wave (blue trcking line)
   plot(xP,yP,'b','LineWidth',3); 

   xP = t(1:c); yP = V1(1:c); % Horizontal component of sin wave (yellow trcking line)
   plot(xP,yP,'y','LineWidth',3); 

   xP = t(1:c); yP = V2(1:c); % Horizontal component of sin wave (green trcking line)
   plot(xP,yP,'g','LineWidth',3); 

   hold off
   set(gca,'FontSize',12);

   axis on
   pause(0.01) % Delay 

end
end