function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 2;
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];

function sys=mdlOutputs(t,x,u)
alpha_l=3;
beta_l=5;
k_l=5/3;
if abs(u(3))>2%abs(e(5))>2
    sys(1)=u(1)+beta_l*u(1+2)^k_l;
else
    sys(1)=u(1)+alpha_l*sign(u(1+2));
end
if abs(u(4))>2
    sys(2)=u(2)+beta_l*u(2+2)^k_l;
else
    sys(2)=u(2)+alpha_l*sign(u(2+2));
end





