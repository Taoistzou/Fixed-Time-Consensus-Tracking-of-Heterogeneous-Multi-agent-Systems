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
sizes.NumOutputs     = 4;
sizes.NumInputs      = 24;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)
alpha_k=3;beta_k=5;
r_k=1/3;k_k=5/3;D_k=0.5;



sys(1)=u(1+12+6)-alpha_k*u(1)-beta_k*u(1+4)-alpha_k*sig(u(1+8),r_k)-beta_k*sig(u(1+8),k_k)-D_k*sign(u(1+8));
sys(2)=u(1+13+6)-alpha_k*u(2)-beta_k*u(2+4)-alpha_k*sig(u(2+8),r_k)-beta_k*sig(u(2+8),k_k)-D_k*sign(u(2+8));
sys(3)=u(1+14+6)-alpha_k*u(3)-beta_k*u(3+4)-alpha_k*sig(u(3+8),r_k)-beta_k*sig(u(3+8),k_k)-D_k*sign(u(3+8));
sys(4)=u(1+15+6)-alpha_k*u(4)-beta_k*u(4+4)-alpha_k*sig(u(4+8),r_k)-beta_k*sig(u(4+8),k_k)-D_k*sign(u(4+8));


