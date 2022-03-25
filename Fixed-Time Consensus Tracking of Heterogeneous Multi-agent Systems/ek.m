function [sys,x0,str,ts] = ek(t,x,u,flag)
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
sizes.NumInputs      = 20;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)
x1=u(1);
x2=u(2);
x3=u(3);
x4=u(4);

theta1=u(1+8);
theta2=u(2+8);
theta3=u(3+8);
theta4=u(4+8);

e1=x1-theta1;
e2=x2-theta2;
e3=x3-theta3;
e4=x4-theta4;

sys(1)=e1;
sys(2)=e2;
sys(3)=e3;
sys(4)=e4;



% sys(1)=u(1)-u(1+8);%e1=x1-theta1
% sys(2)=u(2)-u(2+8);%e2=x2-theta2
% sys(3)=u(3)-u(3+8);%e3=x3-theta3
% sys(4)=u(4)-u(4+8);%e4=x4-theta4



