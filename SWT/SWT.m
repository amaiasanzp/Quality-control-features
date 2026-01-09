function oxy_den = SWT(w_oxy)
% SWT Performs signal denoising using the Stationary Wavelet Transform (SWT)
%
% INPUT:
%   w_oxy : Input signal
%
% OUTPUT:
%   oxy_den : Denoised signal obtained via SWT-based filtering

x = w_oxy;
n=3;wav='coif3';

% To avoid transients due to filtering
luz=length(x);
s=[x(1)*ones(1,luz) x(1:luz) x(luz)*ones(1,luz)];   
ni=luz+1;nf=length(s)-luz;int=ni:nf;

[~,swd,filtros]=SWT_EAG(s,n,wav);
[y,~,~]=denoise_SWT_EAG(0,swd,int,filtros,2);
oxy_den=y(int);

end