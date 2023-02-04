# Filtering

## Topic

Applying linear filters to an image in the spatial domain and in the frequency
domain

## Aim

Implement an algorithm for linear filtering of an image in the frequency domain,
set the transfer function of a low-frequency filter with the specified properties,
find the appropriate filter mask in the spatial domain and apply it, compare the
results of applying filters to the image in the frequency and spatial domain.

## Instructions:

1. Upload a color image (dog.jpg), find its spectrum by applying a two-dimensional
discrete Fourier transform (DFT), show the image and its spectrum on the screen
2. Set the transfer function of the low-pass Gaussian filter for the cutoff frequency
of 0.1 1/pixel, show a graph of the transfer function (the abscissa axis should be graded to 1/pixel),
mark the cutoff frequency on the graph
3. Apply the transfer function to the image spectrum, show the image spectrum after
filtering, find the inverse DFT, show the resulting image
4. Calculate the inverse DFT of the transfer function, get a filter mask in the spatial
domain and crop it to size 11×11 so that the mask is symmetrical with respect
to the central element, show a graph of the resulting filter mask
5. Perform convolution of the image with the filter mask in the spatial area, using
the addition of zeros at the edges of the image, show the result of filtering on the screen
6. Compare the results obtained in paragraphs 3 and 5, visually, show those areas of the image where
the results are noticeably different, explain the reason for the difference and how the result will change if
you use a periodic continuation of the image along the edges when performing convolution in
the spatial domain
7. Make a conclusion about the correspondence of the use of a linear filter in the spatial and frequency
domain.