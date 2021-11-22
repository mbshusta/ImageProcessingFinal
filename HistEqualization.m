disp('Give me a .jpg or a .png file to perform a histogram equalization on')
input('Press enter key to proceed')
disp('-------------------------------------------------------------------------------------------------------------')

img = uigetfile({'*.jpg';'*.png';'*tif'});
img = imread(img);
% gets the user's file and reads them into matlab

imgEq = histeq(img);
imgHistEq = imhist(imgEq);


subplot(2,2,1)
imshow(img)
title('Original Image')

subplot(2,2,2)
imhist(img)
title('Original Histogram')


subplot(2,2,3)
imshow(imgEq)
title('Histogram Equalization Image')


subplot(2,2,4)
imhist(imgEq)
title('Histogram Equalization')

imwrite(imgEq, 'imgEq.jpg')



