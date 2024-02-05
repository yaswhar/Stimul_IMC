function [K,Q1]=stimulIMC(G1,G2,Q2,alpha,~)
% Inputs: G1, G2 in TF format, Q2 either TF or Symbolic, alpha for Euclid,
% the next input should be given if and only if Q2 is symbolic and can be any number
%
% Outputs: K, Q1 in TF format if Q2 is TF, in Symbolic format is Q is
% symbolic
%
% Course: Foundamentals of Automatic Control Design. 28-255 , Semester:
% 1402-1
% Sharif University of Technology, Department of Mechanical Engineering, Tehran, Iran.
% Prepared by: Yashar Zafari, S.N.: 99106209
if nargin==4
    Q2=tf2sym(Q2);
end
syms q_q
[N1, X1, M1, Y1]=Euclid(G1, alpha);
[N2, X2, M2, Y2]=Euclid(G2, alpha);
N1=tf2sym(N1);M1=tf2sym(M1);X1=tf2sym(X1);Y1=tf2sym(Y1);
N2=tf2sym(N2);M2=tf2sym(M2);X2=tf2sym(X2);Y2=tf2sym(Y2);
eq=simplifyFraction((X1+M1*q_q)/(Y1-N1*q_q))==simplifyFraction((X2+M2*Q2)/(Y2-N2*Q2));
Q1=solve(eq,q_q);
K=simplifyFraction((X2+M2*Q2)/(Y2-N2*Q2));
Q1=simplifyFraction(Q1);
if nargin==4
    K=sym2tf(K);
    Q1=sym2tf(Q1);
end
end
