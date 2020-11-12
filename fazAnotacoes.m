function a = fazAnotacoes(b, j, modulW, mai, wr1,x1m,y1m)

a = '';
dim = [.15 .3 .3 .3];           %Localização da anotação
dim1 = [.15 .6 .3 .3];
dim2 = [.33 .6 .3 .3];
dim3 = [.33 .5 .3 .3];
dim4 = [.39 .5 .3 .3];
dim5 = [.15 .55 .3 .3];

subplot(2,2,[1 3])          %Define o plot em que a anotação será feita

if b == 0          %Verifica se o texto está no início do programa
    textoInicio = '$1\over 1 + 2 \zeta ({jw\over wn)}) + ({w\over wn})^2$';
    pp =annotation('textbox',dim2,'String',textoInicio,'FitBoxToText','on','Interpreter','Latex');
    pp.FontSize = 18;

    texto2 = '$\zeta = 0.55$'
    pp =annotation('textbox',dim3,'String',texto2,'FitBoxToText','on','Interpreter','Latex');
    pp.FontSize = 12;

    texto3 = '$w_n = 500$'
    pp =annotation('textbox',dim4,'String',texto3,'FitBoxToText','on','Interpreter','Latex');
    pp.FontSize = 12;
    hold on
else
    
    textW = 'W: ';
    a = annotation('textbox',dim,'String',strcat(textW,32,modulW),'FitBoxToText','on','Interpreter','Latex');
    a.FontSize = 12;
    if b == j
          
          tex1 = 'O maior modulo é: ';
          tex2 = 'Wr: ';  tex22 = 'rad/s';
          cont1 = strcat(tex1,32,mai);
          cont2 = strcat(tex2,32,wr1,32,tex22);
        
          inf =  annotation('textbox',dim1,'String',cont1,'FitBoxToText','on');
          inf2 = annotation('textbox',dim5,'String',cont2,'FitBoxToText','on');
          inf.FontSize  = 12;
          inf2.FontSize = 12;
          
          ccc = annotation('textarrow',[0.3 0.35],[0.3 0.2],'String','Wr');
          plot(x1m,y1m,'--gs',...
          'LineWidth',2,...
          'MarkerSize',10,...
          'MarkerEdgeColor','r',...
          'MarkerFaceColor','r');
          ccc.FontSize = 12;
      drawnow;
    end
end
end
