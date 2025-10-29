function result = activationsym(x,y,w1,w2,b,k,thea)%syms R; 
    ptsbr = 15;
    rectangle = [0,thea];
    [theatemp,wei] = rquadpts1dnew(rectangle,ptsbr);
    ctheatemp=cos(theatemp');
    stheatemp=sin(theatemp');
    B=b*ones(size(x));
    activationbr=@(x)ReLU(x,k);
    gbctemp=0;
    for sss = 1:ptsbr

           tempx=ctheatemp(sss)*x+stheatemp(sss)*y;
           tempy=ctheatemp(sss)*x-stheatemp(sss)*y;  
           ckbctemp = w1*tempx+w2*tempy+B;
           gbctemp =gbctemp+ (1/thea)*wei(sss)*activationbr(ckbctemp);
    
    end
    result=gbctemp;
end
    
