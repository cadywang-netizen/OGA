function [psi,psi_a, psi_b, R] = findphi(x,y,w1,w2,b,theta)
    
    tempsame=w1*y-w2*x;
    cosphi=(w1*x+w2*y)./sqrt(x.^2+y.^2)*sqrt(w1^2+w2^2);
    
    if tempsame>0
        psi_atemp=2*pi-acos(cosphi);
    elseif tempsame<=0
        psi_atemp=acos(cosphi);
    end
    psi=psi_atemp;
    %psi_atemp=acos(cosphi);
    psi_btemp = psi_atemp+theta;
    % costemp=cos(psi_atemp+theta);
    costemp2=-b./(sqrt(x.^2+y.^2)*sqrt(w1^2+w2^2));

    zero1 = acos(costemp2);        
    zero2 = 2*pi - zero1;   
    if psi_btemp<=zero1
        psi_a=psi_atemp;
        psi_b=psi_btemp;
    elseif psi_atemp>=zero2
        psi_a=psi_atemp;
        psi_b=psi_btemp;
    elseif psi_btemp>zero1||psi_btemp<zero2
        if psi_atemp<=zero1
            psi_a=psi_atemp;
            psi_b=zero1;
        elseif psi_atemp>zero1
             psi_a=0;
             psi_b=0;
        end
    elseif psi_btemp>zero2
         if psi_atemp<=zero2
            psi_a=zero2;
            psi_b=psi_btemp;
         elseif psi_atemp>zero2
             psi_a=psi_atemp;
             psi_b=psi_btemp;
         end
    end
    R=sqrt(x.^2+y.^2)*sqrt(w1^2+w2^2);

end