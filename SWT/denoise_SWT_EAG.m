function [y,d_den,d]=denoise_SWT_EAG(a,d,int,filtros,j)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Denoise the detail coefficients and compute the inverse stationary wavelet coefficients using quadrature 
% mirror filter banks.
% Input arguments:
%   a: approximation coefficients
%   d: detail coefficients
%   j: lower level considered for reconstruction
%   wav: name of the mother wavelet used in the decomposition.
%        Options ara as follows
%           'Haar': Haar wavelet
% Output arguments:
%   y    : reconstructed signal
%   d    : denoised detailed coefficients, including those zeroed
%   d_den: denoised detailed coefficients

% Created by Erik Alonso González 25/10/2019
% Last update 12/03/2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sLen=size(d,2);
n=size(d,1);
% a=zeros(1,sLen);
% a=a(end,:);
if a==0
    a=zeros(1,sLen);
else
    a=a(n,:);
end

% Denoising by soft thresholding using universal threshold level dependent
% % % % % levels=j:n;
% % % % % sigma=median(abs(d(levels,int)-median(d(levels,int),2)),2)/0.6745;
% % % % % th=sqrt(2*log(length(int))).*sigma;
% % % % % th2=sqrt(2*log(length(int)/2))*sigma./(log(levels+1)');
% % % % % pt=1;
% % % % % for cc=j:n
% % % % %     x=d(cc,int);temp=zeros(1,length(x));
% % % % %     pos1=abs(x)>=th(pt);
% % % % %     zeinuak=sign(x(pos1));zeinuak(zeinuak==0)=-1;
% % % % %     temp(pos1)=zeinuak.*(abs(x(pos1))-th(pt));
% % % % %     den(cc,:)=temp;
% % % % %     pt=pt+1;
% % % % % end
% % % % % d(:,int) = den;
% % % % % d_den = d;

% Denoising by soft thresholding using universal threshold
% % % levels=j:n;
% level=1;
% sigma=median(abs(d(level,int)-median(d(level,int))))/0.6745;
% th=sqrt(2*log(length(d(level,int)))).*sigma;
% 
% for cc=1:n
%     x=d(cc,int);temp=zeros(1,length(x));
% %     sigma=median(abs(x-median(x)))/0.6745;
% %     th(cc)=sqrt(2*log(length(x)))*sigma/log(cc+1);
%     pos1=abs(x)>=th;
%     zeinuak=sign(x(pos1));zeinuak(zeinuak==0)=-1;
%     temp(pos1)=zeinuak.*(abs(x(pos1))-th);
%     den(cc,:)=temp;
% end
% d(:,int) = den;
d_den = d;

% Denoising by soft thresholding using the modified unified threshold
% proposed by Liu S. A novel thresholding method in removing noises of
% electrocardiogram based on wavelet transform. J Inf Comput Sci. 2013;10:5031–41.
% % % % % for cc=1:n
% % % % %     x=d(cc,int);temp=zeros(1,length(x));
% % % % %     sigma=median(abs(x-median(x)))/0.6745;
% % % % %     th(cc)=sqrt(2*log(length(x)))*sigma/log(cc+1);
% % % % %     pos1=abs(x)>=th(cc);
% % % % %     zeinuak=sign(x(pos1));zeinuak(zeinuak==0)=-1;
% % % % %     temp(pos1)=zeinuak.*(abs(x(pos1))-th(cc));
% % % % %     den(cc,:)=temp;
% % % % % end
% % % % % d(:,int)=den;

% Denoising by soft thresholding using the modified unified threshold
% proposed by Liu S. A novel thresholding method in removing noises of
% electrocardiogram based on wavelet transform. J Inf Comput Sci. 2013;10:5031–41.
% % % % % for cc=1:n
% % % % %     x=d(cc,int);temp=zeros(1,length(x));
% % % % %     sigma=median(abs(x-median(x)))/0.6745;
% % % % %     th(cc)=sqrt(2*log(length(x)))*sigma/log(cc+1);
% % % % %     pos1=abs(x)>=th(cc);
% % % % %     zeinuak=sign(x(pos1));zeinuak(zeinuak==0)=-1;
% % % % %     temp(pos1)=zeinuak.*(abs(x(pos1))-th(cc));
% % % % %     den(cc,:)=temp;
% % % % % end
% % % % % d(:,int)=den;


for k = n:-1:1
    
    if k<j
        d(k,:)=zeros(1,sLen);
    end
    % Filters
    LO=filtros(k).lor;
    HI=filtros(k).hir;
    
    % Reconstruct
    a=wkeep1(wconv1(a,LO),sLen,length(LO)/2+2^(k-1))+wkeep1(wconv1(d(k,:),HI),sLen,length(HI)/2+2^(k-1)); % CAMBIAR
    a=a/2;

end

y=a;