clear
close all
clc
format compact

%Loading 1st image
im = imread('rice.tif');
t = graythresh(im); %threshold for binarize

[m, n] = imhist(im); %we need 'm' for threshold marker on the histogram

figure
subplot(1,2,1); imshow(im)
title('Original image')
subplot(1,2,2); imhist(im)
line([round(255*t), round(255*t)], [0, max(m)], 'Color', 'r', 'LineWidth', 1) %threshold marker
title({'Image histogram', ['Red line - threshold (', num2str(t * 255, 3),')']})

%binarizing image
im_bin = imbinarize(im, t);
figure
subplot(1,2,1); imshow(im_bin)
title('Whole image binarization')

%amount of blocks
vert = 1; %vertical amount
hor = 10; %horizontal amount

%binarizing using blocks
im_bin_block = binarizer(im, vert, hor);
subplot(1,2,2); imshow(im_bin_block)
title({['Block binarization: '], [num2str(vert),' x ',num2str(hor),' blocks']})

%loading 2nd image

%amount of blocks
vert = 10; %vertical amount
hor = 1; %horizontal amount

im2 = imread('figure.png');
t = graythresh(im2); %threshold for binarize
im2_bin = imbinarize(im2, t);
im2_bin_block = binarizer(im2, vert, hor);

[m, ~] = imhist(im2); %we need 'm' for threshold marker on the histogram

figure
subplot(1,2,1); imshow(im2)
title('Original image')
subplot(1,2,2); imhist(im2)
line([round(255*t), round(255*t)], [0, max(m)], 'Color', 'r', 'LineWidth',...
1)
title({'Image histogram', ['Red line - threshold (',num2str(t*255, 3),')']})

figure
subplot(1,2,1); imshow(im2_bin)
title('Whole image binarization')
subplot(1,2,2); imshow(im2_bin_block)
title({['Block binarization: '],[num2str(vert),' x ',num2str(hor),' blocks']})

%trying to increase contrast
im3 = imadjust(im2,[],[],0.5);
t = graythresh(im3); %threshold for binarize
im3_bin = imbinarize(im3, t);
im3_bin_block = binarizer(im3, 10, 10);

[m,n] = imhist(im3); %we need 'm' for threshold marker on the histogram

figure
subplot(1,2,1); imshow(im3)
title('Increased contrast')
subplot(1,2,2); imhist(im3)
line([round(255*t), round(255*t)], [0, max(m)], 'Color', 'r', 'LineWidth',...
1)
title({'Image histogram', ['Red line - threshold (', num2str(round(255*t)),')']})

figure
subplot(1,2,1); imshow(im3_bin)
title('Whole image binarization')
subplot(1,2,2); imshow(im3_bin_block)
title({['Block binarization: '],[num2str(vert),' x ',num2str(hor),' blocks']})

