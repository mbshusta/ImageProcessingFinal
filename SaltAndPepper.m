disp('Give me a .jpg or a .png file to add and remove salt and pepper noise from')
input('Press enter key to proceed')
disp('-------------------------------------------------------------------------------------------------------------')

img = uigetfile({'*.jpg';'*.png';'*tif'});
img = imread(img);
% gets the user's file and reads them into matlab

disp('Give me a percentage of pixels to be affected by salt and pepper noise [0-10%]')
disp('This value controls the percentage of pixels affected by salt and pepper noise')
density = input('');
disp('-------------------------------------------------------------------------------------------------------------')
% asks for the users density of choice

while density < 0 || density > 10
    disp('Error --- Value must be between 0 and 10')
    disp('Give me a percentage of pixels to be affected by salt and pepper noise [0-10%]')
    disp('This value controls the percentage of pixels affected by salt and pepper noise')
    density = input('');
    disp('-------------------------------------------------------------------------------------------------------------')
end
% checks to make sure the density fits the parameters

density = density/100;
% converts denisty to percent, more digestable by the function

imgsnp = imnoise(img, 'salt & pepper', density);
filtimgsnp = medfilt2(imgsnp,[3,3]);

subplot(2,2,1)
imshow(img)
title('Original Image')

subplot(2,2,2)
imshow(imgsnp)
title('Image Salt and Pepper Noise')

subplot(2,2,3)
imshow(filtimgsnp)
title('Image Salt and Pepper Noise Removed')

imwrite(imgsnp, 'imgsnp.jpg')
imwrite(filtimgsnp, 'imgsnpfilt.jpg')


