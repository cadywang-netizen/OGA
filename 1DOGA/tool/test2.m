function result = test2(theta, psi_a, psi_b, R, b, k)


  temp1=R^2/2*(psi_a+sin(2*psi_a)/2)+2*b*R*sin(psi_a)+(b^2)*psi_a;
  temp2=R^2/2*(psi_b+sin(2*psi_b)/2)+2*b*R*sin(psi_b)+(b^2)*psi_b;

  temp1=R*sin(psi_a)+b*psi_a;
  temp2=R*sin(psi_b)+b*psi_b;

  result=(1/theta) *(temp2-temp1);
end