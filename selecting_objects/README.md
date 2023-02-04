# Selecting objects

## Topic

Selecting objects in a color image

## Aim

Implement an image binarization algorithm with a choice of a threshold by
distance in the RGB color space, evaluate the operation of the algorithm for
selecting areas of objects of interest in the image.

## Instructions:

1. Upload an image of vegetables (vegetables.jpg ), select a small area
belonging to the red pepper image on it and find for this area the average
values for each RGB color channel $R_0$, $G_0$, $B_0$;
2. Calculate the distance in the color space for each pixel of the image
RGB to the found average value $\sqrt{(R-R_0)^2 + (G-G_0)^2 + (B-B_0)^2}$
3. Convert the image to binary, while selecting the threshold for the distance d
so that red vegetables are optimally highlighted in the image
4. Display the result as a color image: pixels belonging
to objects of interest (i.e. red vegetables) should retain the original color, and
all other pixels should be painted black