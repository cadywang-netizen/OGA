function result = computeIntegral(theta, psi_a, psi_b, R, b, k)
    % computeIntegral Computes the integral:
    % breveg_n = (1/theta) * integral from psi_a to psi_b of (R*cos(psi) + b)^k dpsi
    % 
    % Input:
    %   theta - Denominator of the factor outside the integral (a scalar)
    %   psi_a, psi_b - Limits of integration (scalars)
    %   R, b - Parameters in the function (scalars or symbolic)
    %   k - Exponent (non-negative integer)
    % Output:
    %   result - Value of the integral (symbolic or numeric)
    
    % Ensure symbolic calculation for parameters
    syms psis;
    if ~isa(R, 'sym')
        R = sym(R);
    end
    if ~isa(b, 'sym')
        b = sym(b);
    end
    
    % Define the function to integrate
    % f = (R.*cos(psis) + b).^k;
    % 
    % tic;  
    % for i = 1:length(psi_a)
    % % Compute the integral
    %   integral_value = int(f, psis, psi_a(i), psi_b(i));
    % end
    % elapsed_time = toc; 
    % disp(['Elapsed time for the loop is: ', num2str(elapsed_time), ' seconds']);
    f = (R*cos(psis) + b).^k;  
    integral_value = int(f, psis, psi_a, psi_b);

    
    % Apply the factor 1/theta
    result = (1/theta) * integral_value;
end
