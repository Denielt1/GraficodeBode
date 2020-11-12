function [wr, x1m, y1m, maiorMod] = achaMaiorModulo(salvawr,salvax1m,salvay1m,...
    salvamaiorMod, modulo, modulo2, n, b, x1, y1)


x1m=0; y1m=0; maiorMod=0;
if modulo >= modulo2
     wr = n(b);
     x1m = x1;
     y1m = y1;
     maiorMod = modulo;
else
    wr = salvawr;
    x1m = salvax1m;
    y1m = salvay1m;
    maiorMod = salvamaiorMod;
end
end