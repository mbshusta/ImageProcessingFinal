disp('Give me a .jpg or a .png file to blur')
input('Press enter key to proceed')
%prompt the user

img = uigetfile({'*.jpg';'*.png';'*tif'});
img = imread(img);
% gets the user's file and reads them into matlab

img = im2double(img);
%converts image to a double precision 
blur = 3*input('On a scale of 1-10 how blurry would you like the processed image to be?(1 being little blur - 10 being very blurred)');
mask = ones(blur) / blur^2;

subplot(2,1,1);
imshow(img)
title('Original Image')
%formating and displaying for original image

imageBlurred = imfilter(img, mask, 'conv');
%takes the image (img) and performs convolution with the mask 

subplot(2,1,2);
imshow(imageBlurred)
title('Blurred Image')
%formating and display for blurred image
imwrite(imageBlurred, 'imageblurred.jpg')