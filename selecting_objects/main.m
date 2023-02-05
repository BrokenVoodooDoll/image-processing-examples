clc
clear
close all

im = double(imread('vegetables.jpg'));
ref = im(250:280,50:100,:);

figure;
subplot(1,2,1)
imshow(uint8(im))
title('Original image');
subplot(1,2,2)
imshow(uint8(ref))
title('Reference piece');

im1R = mean2(ref(:,:,1));
im1G = mean2(ref(:,:,2));
im1B = mean2(ref(:,:,3));

d0 = mean2(sqrt(((ref(:,:,1)-im1R).^2)+((ref(:,:,2)-im1G).^2)+((ref(:,:,3)-im1B).^2)));

d = sqrt(((im(:,:,1)-im1R).^2)+((im(:,:,2)-im1G).^2)+((im(:,:,3)-im1B).^2));

d(d<d0) = 0;
d(d>d0) = 255;
figure;
subplot(1,2,1)
imshow(uint8(im))
title('Original image');
subplot(1,2,2)
d = imadjust(uint8(d),[0 1],[1 0]);
imshow(uint8(d))
title('Binarized image');