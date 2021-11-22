disp('Give me a .jpg or a .png file to Laplacian edge detection to')
input('Press enter key to proceed')
disp('-------------------------------------------------------------------------------------------------------------')

img = uigetfile({'*.jpg';'*.png';'*tif'});
img = imread(img);
% gets the user's file and reads them into matlab

disp('Give me an alpha for the laplacian (default = 0.2) [0-1]')
disp('Alpha changes the shape of the laplacian mask')
alpha = input('');
disp('-------------------------------------------------------------------------------------------------------------')
% asks for the users density of choice

while alpha < 0 || alpha > 1
    disp('Give me an alpha for the laplacian (default = 0.2) [0-1]')
    disp('Alpha changes the shape of the laplacian mask')
    alpha = input('');
    disp('-------------------------------------------------------------------------------------------------------------')
end
% checks to make sure the alpha fits the parameters

mask = fspecial('laplacian',alpha);
imgLaplacian = imfilter(img, mask);

subplot(2,2,1)
imshow(img)
title('Original Image')

subplot(2,2,2)
imshow(imgLaplacian)
title('Image Laplacian Edge')

imwrite(imgLaplacian, 'imgLaplacian.jpg')


