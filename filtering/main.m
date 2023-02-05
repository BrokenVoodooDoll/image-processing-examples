clear
close all
clc
format compact

%loading an image
im = im2double(imread('dog.jpg'));

%making image spectrum for graphics
imf_r = mat2gray(log(abs(fftshift(fft2(im(:,:,1))))+1));
imf_g = mat2gray(log(abs(fftshift(fft2(im(:,:,2))))+1));
imf_b = mat2gray(log(abs(fftshift(fft2(im(:,:,3))))+1));
imf = cat(3, imf_r, imf_g, imf_b);

%graphics
figure
subplot(1,2,1); imshow(im)
title('Original image')
subplot(1,2,2); imshow(imf,[])
title('Image spectrum (log)')

%dimensions of the image
[r,c,colors] = size(im);

%making gaussian low-pass filter mask
s = 0.1; %sigma in 1/pix
sigma = 0.1*min([r c]);

h = fspecial('gaussian',[r c],sigma); %gaussian mask
f = linspace(-0.5,0.5,c); %frequency grid

%graphics
figure
norm = max(max(h(r/2,:)))^-1; %normalizing coefficient
plot(f,norm*h(r/2,:),'b')
line([s s], [0 1], 'Color', 'r', 'LineWidth', 1)
line(-[s s], [0 1], 'Color', 'r', 'LineWidth', 1)
grid
title(['Gaussian filter with \sigma = ',num2str(s),' pix^{-1}'])
xlabel('frequency, pix^{-1}')

%graphics
figure
imshow(log(abs(h)+1),[])
title('Gaussian mask in frequency domain')

%applying LP filter to channels spectra
im1f_r = fftshift(fft2(im(:,:,1))).*h;
im1f_g = fftshift(fft2(im(:,:,2))).*h;
im1f_b = fftshift(fft2(im(:,:,3))).*h;

%getting image from spectra
im1_r = mat2gray(abs(ifft2(ifftshift(im1f_r))));
im1_g = mat2gray(abs(ifft2(ifftshift(im1f_g))));
im1_b = mat2gray(abs(ifft2(ifftshift(im1f_b))));
im1 = cat(3,im1_r,im1_g,im1_b);

%making image spectrum for graphics
imf1_r = mat2gray(log(abs(fftshift(fft2(im1(:,:,1))))+1));
imf1_g = mat2gray(log(abs(fftshift(fft2(im1(:,:,2))))+1));
imf1_b = mat2gray(log(abs(fftshift(fft2(im1(:,:,3))))+1));
imf1 = cat(3, imf1_r, imf1_g, imf1_b);

%graphics
figure
subplot(1,2,1); imshow(im1,[])
title('Filtered image')
subplot(1,2,2); imshow(imf1,[])
title('Filtered image spectrum (log)')

%Fourier transform of gaussian mask
hs = ifftshift(ifft2(h));

%graphics
figure
imshow(log(abs(hs)+1),[])
title('Gaussian mask in spatial domain')

uncut = 11; %size of spatial domain mask
cut = floor(11/2); %half-size of spatial domain mask

hs_cut = hs((r/2-cut+1):(r/2+cut+1),(c/2-cut+1):(c/2+cut+1)); %cut mask
H = sum(sum(abs(hs_cut)))^-1*abs(hs_cut); %normalized mask

%grapahics
figure
plot(H(cut+1,:))
grid
title({['Cut Gaussian mask of size ', num2str(uncut) ,'x'...
    num2str(uncut)],[' in spatial domain']})

%applying mask to image
im2 = imfilter(im, H); 

%making image spectrum for graphics
imf2_r = mat2gray(log(abs(fftshift(fft2(im2(:,:,1))))+1));
imf2_g = mat2gray(log(abs(fftshift(fft2(im2(:,:,2))))+1));
imf2_b = mat2gray(log(abs(fftshift(fft2(im2(:,:,3))))+1));
imf2 = cat(3, imf2_r, imf2_g, imf2_b);

%graphics
figurep
subplot(1,2,1); imshow(im2,[])
title('Filtered image')
subplot(1,2,2); imshow(imf2,[])
title('Filtered image spectrum (log)')

im3 = imfilter(im, H, 'circular'); % periodic boundary option

%graphics
figure
subplot(1,3,1); imshow(im1(1:50,1:50,:),[])
title('Frequency processed image')
subplot(1,3,2); imshow(im2(1:50,1:50,:),[])
title({['Spatially processed image'],['Zero boundary option']})
subplot(1,3,3); imshow(im3(1:50,1:50,:),[])
title({['Spatially processed image'],['Periodic boundary option']})