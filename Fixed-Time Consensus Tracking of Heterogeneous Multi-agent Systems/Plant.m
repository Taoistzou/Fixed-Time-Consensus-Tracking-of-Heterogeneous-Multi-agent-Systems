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
sizes.NumContStates  = 8;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 8;
sizes.NumInputs      = 6;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [1 2 3 4 5 6  1 2];
str = [];
ts  = [0 0];
function sys=mdlDerivatives(t,x,u)
dk=0.5*sin(t);
dl=0.5*sin(t);
sys(1)=u(1)+dk;
sys(2)=u(2)+dk;
sys(3)=u(3)+dk;
sys(4)=u(4)+dk;
sys(5)=x(7);
sys(6)=x(8);
sys(7)=u(5)+dl;
sys(8)=u(6)+dl;

function sys=mdlOutputs(t,x,u)
sys(1)=x(1);
sys(2)=x(2);
sys(3)=x(3);
sys(4)=x(4);

sys(5)=x(5);
sys(6)=x(6);

sys(7)=x(7);
sys(8)=x(8);



