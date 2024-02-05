%% Yashar Zafari - 99106209
% Bahman 1402 - Feb. 2024
% Stimultaneous Stability Sovler
% Test case script for example on Pages 2 & 3 of 25-2 Stimultaneous
% Stability
%% Example 1
clear; clc;
s=tf('s');
G1_1=1/(s+1);
G1_2=1/(s-1);
Q1_2=tf(0); % Q2 should be Transfer Function
[K1,Q1_1]=stimulIMC(G1_1,G1_2,Q1_2,1)
%% Example 2
G2_1=G1_1;
G2_2=(0.5*s+1)/(s+1)/(s-1);
Q2_2=tf(0);
[K2,Q2_1]=stimulIMC(G2_1,G2_2,Q2_2,1)
%% Example 1 - Q2 as symbolic lead or lag
G3_1=G1_1;
G3_2=G1_2;
syms a b c s
Q3_2=(a*s+b)/(s+c);
[K3,Q3_1]=stimulIMC(G3_1,G3_2,Q3_2,1,1)