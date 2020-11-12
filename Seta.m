function linha = Seta(s)

tamanho = 0.1;
x0 = 0;
y0 = 0;
x1 = real(s); y1 = imag(s); th = angle(s);

    x2 = x1 - tamanho*cos(th);
    y2 = y1 - tamanho*sin(th);
    x3 = x2 + tamanho*0.5*cos(th+pi/2);
    y3 = y2 + tamanho*0.5*sin(th+pi/2);
    x4 = x2 + tamanho*0.5*cos(th-pi/2);
    y4 = y2 + tamanho*0.5*sin(th-pi/2);
    

    linha = line([x0 x1 x3 x4 x1], ...
          [y0 y1 y3 y4 y1],'color','red','linewidth',4);

end