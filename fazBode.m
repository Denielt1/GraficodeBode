function fazBode(n1)

for b = 1:100
    
    s = i*n1(b);
    g(b) = (1/(1+(1.4*s/500)+(s/500)^2));
    mod(b) = db(abs(g(b)));
    theta(b) = radtodeg(angle(g(b)));

end

subplot(2,2,2)
semilogx(n1,mod)
title('Diagrama de Bode: Magnitude','FontSize',15)
xlabel('Frequência (rad/s)')
ylabel('Amplitude (dB)')
ylim([-100 30])
grid 
hold on

subplot(2,2,4)
semilogx(n1,theta)
title('Diagrama de Bode: Fase','FontSize',15)
xlabel('Frequência (rad/s)')
ylabel('Fase( °)')
grid
hold on
end
