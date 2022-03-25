function [sys,x0,str,ts]=Observer(t,x,u,flag)
switch flag,
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,x,u);
case {2, 4, 9 }
    sys = [];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 12;%12个智能体的状态，即6个位置估计状态，6个速度估计状态
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 12;
sizes.NumInputs      = 15;%6个位置估计状态，6个速度估计状态，领导者的位置信息，速度信息，控制力信息
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[1 2 3 4 5 6  1 3 5 7 9 2];%前6为智能体的状态估计信息，后6位智能体的速度估计信息
str=[];
ts=[0 0];
function sys=mdlDerivatives(t,x,u)
% aij=[]
% c*sig(,1-p/q)-g*sig(,1+2*p/q);
x0=u(1);
v0=u(2);
u0=u(3);
N=6;
p=1;q=3;T1=2;
c=sqrt(2)*q/(0.236*p*T1);
g=(sqrt(2)*N^(p/q))/(0.236*p*T1);
sys(1)=x(7)-c*sig(x(1)-x(3)+x(1)-x(4)+  x(1)-x0,1-p/q)-g*sig(x(1)-x(3)+x(1)-x(4)+  x(1)-x0,1+2*p/q);
sys(2)=x(8)-c*sig(x(2)-x(5)+  x(2)-x0,1-p/q)-g*sig(x(2)-x(5)+  x(2)-x0,1+2*p/q);
sys(3)=x(9)-c*sig(x(3)-x(1)+x(3)-x(6),1-p/q)-g*sig(x(3)-x(1)+x(3)-x(6),1+2*p/q);
sys(4)=x(10)-c*sig(x(4)-x(1)+x(4)-x(5),1-p/q)-g*sig(x(4)-x(1)+x(4)-x(5),1+2*p/q);
sys(5)=x(11)-c*sig(x(5)-x(2)+x(5)-x(4),1-p/q)-g*sig(x(5)-x(2)+x(5)-x(4),1+2*p/q);
sys(6)=x(12)-c*sig(x(6)-x(3)+x(6)-x(5),1-p/q)-g*sig(x(6)-x(3)+x(6)-x(5),1+2*p/q);

sys(7)=u0-c*sig(x(1+6)-x(3+6)+x(1+6)-x(4+6)+  x(1+6)-v0,1-p/q)-g*sig(x(1+6)-x(3+6)+x(1+6)-x(4+6)+  x(1+6)-v0,1+2*p/q);
sys(8)=u0-c*sig(x(2+6)-x(5+6)+  x(2+6)-v0,1-p/q)-g*sig(x(2+6)-x(5+6)+  x(2+6)-v0,1+2*p/q);
sys(9)=u0-c*sig(x(3+6)-x(1+6)+x(3+6)-x(6+6),1-p/q)-g*sig(x(3+6)-x(1+6)+x(3+6)-x(6+6),1+2*p/q);
sys(10)=u0-c*sig(x(4+6)-x(1+6)+x(4+6)-x(5+6),1-p/q)-g*sig(x(4+6)-x(1+6)+x(4+6)-x(5+6),1+2*p/q);
sys(11)=u0-c*sig(x(5+6)-x(2+6)+x(5+6)-x(4+6),1-p/q)-g*sig(x(5+6)-x(2+6)+x(5+6)-x(4+6),1+2*p/q);
sys(12)=u0-c*sig(x(6+6)-x(3+6)+x(6+6)-x(5+6),1-p/q)-g*sig(x(6+6)-x(3+6)+x(6+6)-x(5+6),1+2*p/q);


function sys=mdlOutputs(t,x,u)
%theta
sys(1)=x(1);%theta1
sys(2)=x(2);%theta2
sys(3)=x(3);%theta3
sys(4)=x(4);%theta4
sys(5)=x(5);%theta5
sys(6)=x(6);%theta6

%omega
sys(1+6)=x(1+6);%w1
sys(2+6)=x(2+6);%w2
sys(3+6)=x(3+6);%w3
sys(4+6)=x(4+6);%w4
sys(5+6)=x(5+6);%w5
sys(6+6)=x(6+6);%w6






