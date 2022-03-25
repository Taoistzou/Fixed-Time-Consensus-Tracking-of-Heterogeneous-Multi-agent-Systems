function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3,
    sys=mdlOutputs(t,x,u);
case {1,2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 18;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)
alpha_l=3;beta_l=5;
r_l=1/3;k_l=5/3;D_l=0.5;

dotw0=u(1+6);

if abs(u(1+12))>2
    sys(1)=dotw0-beta_l*k_l*(u(1+12))^(k_l-1)*u(1+12+2)-alpha_l*sig(u(1+12+2+2),r_l)-beta_l*sig(u(1+12+2+2),k_l)-D_l*sign(u(1+12+2+2));
else
    sys(1)=u(1+6)-alpha_l*sig(u(1+12+2+2),r_l)-beta_l*sig(u(1+12+2+2),k_l)-D_l*sign(u(1+12+2+2));
end

if abs(u(2+12))>2
    sys(2)=u(2+6)-beta_l*k_l*(u(2+12))^(k_l-1)*u(2+12+2)-alpha_l*sig(u(2+12+2+2),r_l)-beta_l*sig(u(2+12+2+2),k_l)-D_l*sign(u(2+12+2+2));
else
    sys(2)=u(2+6)-alpha_l*sig(u(2+12+2+2),r_l)-beta_l*sig(u(2+12+2+2),k_l)-D_l*sign(u(2+12+2+2));
end
    


% 
% if abs(u(1+12))>2
% sys(1)=u(1+6)-beta_l*k_l*(u(1+12))^(k_l-1)*u(1+12+2)-alpha_l*sig(u(1+12+2+2),r_l)-beta_l*sig(u(1+12+2+2),k_l)-D_l*sign(u(1+12+2+2));
% sys(2)=u(2+6)-beta_l*k_l*(u(2+12))^(k_l-1)*u(2+12+2)-alpha_l*sig(u(2+12+2+2),r_l)-beta_l*sig(u(2+12+2+2),k_l)-D_l*sign(u(2+12+2+2));
% else
% sys(1)=u(1+6)-alpha_l*sig(u(1+12+2+2),r_l)-beta_l*sig(u(1+12+2+2),k_l)-D_l*sign(u(1+12+2+2));
% sys(2)=u(2+6)-alpha_l*sig(u(2+12+2+2),r_l)-beta_l*sig(u(2+12+2+2),k_l)-D_l*sign(u(2+12+2+2));
% end




