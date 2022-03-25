function [sys,x0,str,ts] = spacemodel(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
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
sizes.NumOutputs     = 6;%智能体的控制输出 control input
sizes.NumInputs      = 6;%智能体的w位置信息
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [0 0];
function sys=mdlOutputs(t,x,u)
sys(1)=u(6)+u(2)-2*u(1);
sys(2)=u(1)+u(3)-2*u(2);
sys(3)=u(2)+u(4)-2*u(3);
sys(4)=u(5)+u(3)-2*u(4);
sys(5)=u(4)+u(6)-2*u(5);
sys(6)=u(1)+u(5)-2*u(6);

