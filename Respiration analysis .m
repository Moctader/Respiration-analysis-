beltSignals=load('beltSignals.txt');
regressionCoefficients1=load('regressionCoefficients1.txt');
regressionCoefficients2=load('regressionCoefficients2.txt');
regressionCoefficients3=load('regressionCoefficients3.txt');
spirometer=load('spirometer.txt');
s_spirometer=resample(spirometer,50,100);
fest1=sum((regressionCoefficients1'.*beltSignals),2);
f=sum((regressionCoefficients2(1:2)'.*beltSignals),2);
g=regressionCoefficients2(3)'.*beltSignals(:,1).^2;
h=regressionCoefficients2(4)'.*beltSignals(:,2).^2;
fest2=f+g+h
k=sum((regressionCoefficients3(1:2)'.*beltSignals),2);
m=regressionCoefficients3(3)'.*beltSignals(:,1).*beltSignals(:,2);
fest3=k+m;
corelation1_1=[sum(fest1.*s_spirometer)-length(s_spirometer)*mean(fest1)*mean(s_spirometer)]^2;
corelation1_2=[sum(fest1.^2)-length(s_spirometer)*mean(fest1).^2]*[sum(s_spirometer.^2)-length(s_spirometer)*(mean(s_spirometer)).^2]
corr1=corelation1_1/corelation1_2;
cor1_1=sqrt(corr1)
corelation2_1=[sum(fest2.*s_spirometer)-length(s_spirometer)*mean(fest2)*mean(s_spirometer)]^2;
corelation2_2=[sum(fest2.^2)-length(s_spirometer)*mean(fest2).^2]*[sum(s_spirometer.^2)-length(s_spirometer)*(mean(s_spirometer)).^2]
corr2=corelation2_1/corelation2_2;
corr1_2=sqrt(corr2)
corelation3_1=[sum(fest3.*s_spirometer)-length(s_spirometer)*mean(fest3)*mean(s_spirometer)]^2;
corelation3_2=[sum(fest3.^2)-length(s_spirometer)*mean(fest3).^2]*[sum(s_spirometer.^2)-length(s_spirometer)*(mean(s_spirometer)).^2]
corr3=corelation3_1/corelation3_2;
corr1_3=sqrt(corr3)
sserr_1=sum((s_spirometer-fest1).^2);
sserr_2=sum((s_spirometer-fest2).^2)
sserr_3=sum((s_spirometer-fest3).^2)
mse_1=sserr_1/length(s_spirometer);
mse_2=sserr_2/length(s_spirometer);
mse_3=sserr_3/length(s_spirometer);
rmse_1=sqrt(mse_1);
rmse_2=sqrt(mse_2);
rmse_3=sqrt(mse_3);
time=linspace(0,60,3000);
subplot(2,1,1)
plot(time,s_spirometer,'k');
hold on
plot(time,fest1,'r');
hold on
plot(time,fest2,'b');
hold on
plot(time,fest3,'g');
title('time vs air flows')
xlabel('time in sec')
ylabel('air flows in ml/s')


subplot(2,1,2)
plot(time,beltSignals(:,1),'b')
hold on
plot(time,beltSignals(:,2),'g')
title(' time vs chest and abdomen signal')
xlabel('time in sec')
ylabel('chest and abdomen signal in au')