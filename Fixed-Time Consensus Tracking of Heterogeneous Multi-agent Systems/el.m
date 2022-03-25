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
sizes.NumOutputs     = 2;
sizes.NumInputs      = 20;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t,x,u)
x5=u(5);
x6=u(6);

theta5=u(5+8);
theta6=u(6+8);

e5=x5-theta5;
e6=x6-theta6;

sys(1)=e5;
sys(2)=e6;




% sys(1)=u(5)-u(5+8);%e5=x5-theta5
% sys(2)=u(6)-u(6+8);%e6=x6-theta6



