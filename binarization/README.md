# Binarization

## Topic

Separation of objects and background in an image with a changing level of light.

## Aim

Implement an algorithm for block binarization of an image with the choice of
a separate threshold for each block, evaluate the operation of the algorithm on
images with varying light levels.

## Instructions

1. Upload an image with rice grains (rice.tif), find
the optimal threshold for it using the
[Otsu](https://en.wikipedia.org/wiki/Otsu%27s_method) method, which will
separate the images of rice grains from the background, build a histogram of the
image and mark the threshold found on it
2. Convert the original image to binary with this threshold, display it on
the screen
3. Split the original image into 100 blocks (10 vertically, 10 horizontally),
find the optimal threshold for each block using the Otsu method, block by block
convert the image to binary, applying its own threshold for each block
4. Display the resulting binary image on the screen, compare the results
5. Repeat steps 1-4 for the image of a geometric figure on the background
(figure.png)
6. Make a conclusion about the effect of changes in the illumination level on
the result of selecting objects against the background during binarization with
a global threshold, as well as about the possibilities of the block binarization
method for solving a similar problem, if necessary, provide histograms for
individual image blocks