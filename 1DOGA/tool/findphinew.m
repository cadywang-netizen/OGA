function [psi,psi_a, psi_b, R] = findphinew(x,y,w1,w2,b,theta)
    
    tempsame=w1*y-w2*x;
    cosphi=(w1*x+w2*y)./sqrt(x.^2+y.^2)*sqrt(w1^2+w2^2);
    tempsame1=tempsame>0;
    tempsame2=tempsame<=0;
    tempsame11=tempsame1.*(2*pi-acos(cosphi));
    tempsame22=tempsame2.*(acos(cosphi));
    psi_atemp=tempsame11+tempsame22;
    % if tempsame>0
    %     psi_atemp=2*pi-acos(cosphi);
    % elseif tempsame<=0
    %     psi_atemp=acos(cosphi);
    % end
    psi=psi_atemp;
    %psi_atemp=acos(cosphi);
    psi_btemp = psi_atemp+theta;
    % costemp=cos(psi_atemp+theta);
    costemp2=-b./(sqrt(x.^2+y.^2)*sqrt(w1^2+w2^2));


    zero1 = acos(costemp2);        
    zero2 = 2*pi - zero1;   
    
    resulttemp11=psi_btemp<=zero1;
    psi_atemp1=psi_atemp.*resulttemp11;
    psi_btemp1=psi_btemp.*resulttemp11;

    resulttemp21=psi_atemp>=zero2;
    psi_atemp2=psi_atemp.*resulttemp21;
    psi_btemp2=psi_btemp.*resulttemp21;

    resulttemp31=(psi_btemp<zero2)&(psi_btemp>zero1);
    resulttemp32=psi_atemp<=zero1;
    psi_atemp3=(resulttemp31.*resulttemp32).*psi_atemp;
    psi_btemp3=(resulttemp31.*resulttemp32).*zero1;
    resulttemp33=psi_atemp>zero1;
    psi_atemp4=(resulttemp31.*resulttemp33).*0;
    psi_btemp4=(resulttemp31.*resulttemp33).*0;

    resulttemp41=psi_btemp>zero2;
    resulttemp42=psi_atemp<zero2;
    psi_atemp5=(resulttemp41.*resulttemp42).*zero2;
    psi_btemp5=(resulttemp41.*resulttemp42).*psi_btemp;
   

    psi_a=psi_atemp1+psi_atemp2+psi_atemp3+psi_atemp4+psi_atemp5;
    psi_b=psi_btemp1+psi_btemp2+psi_btemp3+psi_btemp4+psi_btemp5;
    

    % 
    % if psi_btemp<=zero1
    %     psi_a=psi_atemp;
    %     psi_b=psi_btemp;
    % elseif psi_atemp>=zero2
    %     psi_a=psi_atemp;
    %     psi_b=psi_btemp;
    % elseif psi_btemp>zero1||psi_btemp<zero2
    %     if psi_atemp<=zero1
    %         psi_a=psi_atemp;
    %         psi_b=zero1;
    %     elseif psi_atemp>zero1
    %          psi_a=0;
    %          psi_b=0;
    %     end
    % elseif psi_btemp>zero2
    %      if psi_atemp<=zero2
    %         psi_a=zero2;
    %         psi_b=psi_btemp;
    %      elseif psi_atemp>zero2
    %          psi_a=psi_atemp;
    %          psi_b=psi_btemp;
    %      end
    % end
    R=sqrt(x.^2+y.^2)*sqrt(w1^2+w2^2);

end