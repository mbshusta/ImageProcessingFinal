disp('Give me a .jpg or a .png file to perform Prewitt Edge detection on')
input('Press enter key to proceed')
disp('-------------------------------------------------------------------------------------------------------------')

img = uigetfile({'*.jpg';'*.png';'*tif'});
img = imread(img);
% gets the user's file and reads them into matlab

mask = fspecial('prewitt');
vertmask = transpose(mask);

imgvert = imfilter(img, mask);
imghor = imfilter(img, vertmask);

subplot(2,2,1)
imshow(img)
title('Original Image')

subplot(2,2,2)
imshow(imgvert)
title('Image Horizontal Edges')

subplot(2,2,3)
imshow(imghor)
title('Image Vertical Edges')

imwrite(imgvert, 'prewittVert.jpg')
imwrite(imghor, 'prewittHor.jpg')



