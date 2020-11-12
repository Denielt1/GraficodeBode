clear all
close all
clc

eixoy = [-100 30];
eixoy1 = [-300 1];

tempo=0.1; j=100; b=0; maiorMod=0; x1m=0; y1m=0; wr1=0; salvawr=0; modulW=0; mai =0; 
salvax1m = 0; salvay1m = 0; salvamaiorMod = 0;
linha=''; pl=''; a=''; yeye='' ; yeye1='';
xx1 = []; yy1 = [];

filename = 'DiagPolar_DanielFonseca.gif';
if exist(filename)
    delete(filename)
end

h = figure;
n = logspace(0.5,5,j);
subplot(2,2,[1,3])
xlim([-0.4 1.2])
ylim([-1 1])
title('Diagrama polar','FontSize',15)
xlabel('Re')
ylabel('Im')
grid
hold on

figure(1)
fazBode(n)
h.OuterPosition = [ 0 0 1500 1500];

fazAnotacoes(b, j, modulW, mai, wr1,x1m,y1m);

for b = 1:j
    
    subplot(2,2,[1,3])
    s = i*n(b);
    g = (1/(1+(1.1*s/500)+(s/500)^2));
    x1 = real(g);
    y1 = imag(g);
    xx1 = [xx1 x1];
    yy1 = [yy1 y1];
    
    modulo = abs(g);
    if b>1
         [wr, x1m, y1m, maiorMod] = achaMaiorModulo(salvawr,...
             salvax1m, salvay1m, salvamaiorMod ,modulo, modulo2,n,b,x1,y1); %Descobre maior módulo e Wr
         salvawr = wr; salvax1m = x1m; salvay1m = y1m; salvamaiorMod = maiorMod;
         wr1  = num2str(wr);
    end
    modulo2 = modulo;
    
    delete(linha);
    delete(pl);
    
    linha = Seta(g);
    pl = plot(xx1,yy1,'-ob');

    subplot(2,2,2)
    delete (yeye);
    eixox = n(b).*ones(1,2);       %Vetor para varrer diagrama de bode: magnitude
    yeye = plot(eixox,eixoy,'r');
    xlim([0 100000])
    
    subplot(2,2,4)
    delete (yeye1);
    eixox1 = n(b).*ones(1,2);      %Vetor para varrer diagrama de bode: magnitude
    yeye1 = plot(eixox1,eixoy1,'r');
    xlim([0 100000])
    ylim([-180 1]) 
    
    modulW = num2str(n(b));
    mai = num2str(maiorMod);
    delete(a);
    a = fazAnotacoes(b, j, modulW, mai, wr1,x1m,y1m);
 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256);  
      if b == j
          tempo = 3;
      end
      if exist(filename) == 0 
          imwrite(imind,cm,filename,'gif', 'Loopcount',65535,'DelayTime',tempo); 
      else 
          imwrite(imind,cm,filename,'gif','WriteMode','append','DelayTime',tempo); 
      end 
end
