clc
clear all

P=5000/3;                    %Input_voltage=Vs
Q=3000/3;                    %Output_voltage=Vo
Vm=230;                     %Power()=P
Vdc=700;
Smax=5830.95;

Ilrms=Smax/(3*Vm)
Ti=acosd(P/sqrt(P^2 + Q^2))
L=2*Vm/(10000*pi*Ilrms)
Xl=100*pi*L
R=Xl/10
Z= R+ Xl*i
Zs=abs(Z)
T=angle(Z)
Ts=5*L/R;

Vnphrms=(Zs/Vm)*sqrt(((((Vm^2)*cos(T)/Zs)-P)^2)+(((Vm^2)*sin(T)/Zs)-Q)^2)
Vnllrms=Vnphrms*sqrt(3);
Vnllmx=Vnphrms*sqrt(6);

Delta=(atan((((Vm^2)*sin(T)/Zs)-Q)/(((Vm^2)*cos(T)/Zs)-P)) - T)*180/pi

Vdcminst=Vnphrms*sqrt(8)
Vdcminsv=Vnphrms*sqrt(6)

MI= 2*sqrt(2)*Vnphrms/Vdc

% I= (Vm*(cosd(Delta)+sind(Delta)*i)-Vnphrms)/Z
% abs(I)
% angle(I)*180/pi

Idc=3*P/Vdc

Cdc=300e-6
PL=P*3
QL=4000

MIL=2*sqrt(2)*Vm/Vdc