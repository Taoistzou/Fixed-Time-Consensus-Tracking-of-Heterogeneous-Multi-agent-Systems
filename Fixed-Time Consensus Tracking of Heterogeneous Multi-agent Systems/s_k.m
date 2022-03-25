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
sizes.NumOutputs     = 4;
sizes.NumInputs      = 12;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];

function sys=mdlOutputs(t,x,u)
alphak=3;betak=5;
e1=u(1);
e2=u(2);
e3=u(3);
e4=u(4);

integral_rk_1=u(5);
integral_rk_2=u(6);
integral_rk_3=u(7);
integral_rk_4=u(8);

integral_kk_1=u(9);
integral_kk_2=u(10);
integral_kk_3=u(11);
integral_kk_4=u(12);


s_1=e1+alphak*integral_rk_1+betak*integral_kk_1;
s_2=e2+alphak*integral_rk_2+betak*integral_kk_2;
s_3=e3+alphak*integral_rk_3+betak*integral_kk_3;
s_4=e4+alphak*integral_rk_4+betak*integral_kk_4;

sys(1)=s_1;
sys(2)=s_2;
sys(3)=s_3;
sys(4)=s_4;




% sys(1)=u(1)+alphak*u(5)+betak*u(9);
% sys(2)=u(2)+alphak*u(6)+betak*u(10);
% sys(3)=u(3)+alphak*u(7)+betak*u(11);
% sys(4)=u(4)+alphak*u(8)+betak*u(12);

% sys(1)=u(1)+alphak*u(1+4)+betak*u(1+8);
% sys(2)=u(2)+alphak*u(2+4)+betak*u(2+8);
% sys(3)=u(3)+alphak*u(3+4)+betak*u(3+8);
% sys(4)=u(4)+alphak*u(4+4)+betak*u(4+8);



