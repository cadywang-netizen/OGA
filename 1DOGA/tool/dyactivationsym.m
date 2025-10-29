function result = dyactivationsym(x,y,w1,w2,b,k,thea)%syms R;
    ptsbr = 15;
    rectangle = [0,thea];
    [theatemp,wei] = rquadpts1dnew(rectangle,ptsbr);
    ctheatemp=cos(theatemp');
    stheatemp=sin(theatemp');
    B=b*ones(size(x));
    dactivationbr=@(x)dReLU(x,k,1);
    dygdomiantemp=0;
    for sss = 1:ptsbr

           tempx=ctheatemp(sss)*x+stheatemp(sss)*y;
           tempy=ctheatemp(sss)*x-stheatemp(sss)*y;  
           ckbctemp = w1*tempx+w2*tempy+B;
           dygdomiantemp=dygdomiantemp+(1/thea)*wei(sss)*dactivationbr(ckbctemp).*(w1*ones(size(x))*stheatemp(sss)+w2*ones(size(x))*ctheatemp(sss));
    
    end
    result=dygdomiantemp;
end