P_tan= date_indiv_SS(225)
%grid on;

omeg = logspace(-2,2,1000)';
[real1,imag1]=nyquist(P_tan,omeg);
real1=squeeze(real1);
imag1=reshape(imag1,length(omeg),1);
%plot(real1,imag1)
inters1=0.0927;
inters2=-0.3645;

%%

[real2,imag2]=nyquist((P_tan*2),omeg);
real2=squeeze(real2);
imag2=reshape(imag2,length(omeg),1);
%hold on;
%plot(real2,imag2)
inters3=-0.7289;

%%
[real3,imag3]=nyquist((P_tan*exp(-1i*pi/4)),omeg);
real3=squeeze(real3);
imag3=reshape(imag3,length(omeg),1);
%hold on;
%plot(real3,imag3)
inters4=-0.4978;

%%
s=tf('s');
[real4,imag4]=nyquist((P_tan*1/s),omeg);
real4=squeeze(real4);
imag4=reshape(imag4,length(omeg),1);
%hold on;
%plot(real4,imag4)
asimpt=-0.0701;

%%
K_1=1079.5;
T_1=0;
C_1= tf(K_1,[T_1 1])
[real5,imag5]=nyquist((P_tan*C_1),omeg);
real5=squeeze(real5);
imag5=reshape(imag5,length(omeg),1);
%plot(real5,imag5)

%%
K_12=1079.5;
T_12=0;
C_12= tf(K_12,[T_12 1])
[real6,imag6]=nyquist((P_tan*C_12),omeg);
real6=squeeze(real6);
imag6=reshape(imag6,length(omeg),1);
%plot(real6,imag6)

%%
K_2=1079.5;
T_2=1;
C_2= K_2*tf(1 ,[T_2 1])
[real7,imag7]=nyquist((P_tan*C_2),omeg);
real7=squeeze(real7);
imag7=reshape(imag7,length(omeg),1);
%plot(real7,imag7)

%%
K_4=1079.5;
T_4=0; 
C_4= K_4*tf(1 ,[T_4 1])
[real8,imag8]=nyquist((P_tan*C_4),omeg);
real8=squeeze(real8);
imag8=reshape(imag8,length(omeg),1);
%plot(real8,imag8)

K_5=-12;
T_5=0; 
C_5= K_5*tf(1 ,[T_5 1])
[real9,imag9]=nyquist((P_tan*C_5),omeg);
real9=squeeze(real9);
imag9=reshape(imag9,length(omeg),1);
%plot(real9,imag9)
%hold on;
%nyquist(tf([-1 1],[1 1]),omeg)

%%
t=0:0.001:10;
ut=7*sin(t+pi/4);
%bode(P_tan,ut)
amp1=0.5;
def1=22.91;


%%

%bode(P_tan*3,ut)
amp2=1.5;
def2=22.91;

%%

%bode(P_tan*exp(-1i*pi/6),ut)
amp3=0.5;
def3=34.38;

%%

%bode(P_tan*100,ut)
omeg_1=3.72;
omeg_2=1.87;

%%

K_3=1100;
w_3=1/5.5;
C_3 = tf(K_3*w_3, [1 w_3]);
%bode(P_tan*C_3,omeg)

%%

K_4=1;
w_4=1/5.5;
C_4 = tf(K_4*w_4, [1 w_4]);
%bode(P_tan*C_4,omeg)

%%

A_4=omeg_2*2/3;
B_4=omeg_2*3/2;
C_5 =100*tf(B_4*[1 A_4], A_4*[1 B_4]);
%bode(P_tan*C_5,omeg)

%%

save('tema_225.mat','inters1','inters2','inters3',...
    'inters4','asimpt','K_1','T_1','K_2','T_2','amp1',...
    'def1','amp2','def2','amp3','def3','omeg_1','omeg_2',...
    'K_3','w_3','A_4','B_4');
