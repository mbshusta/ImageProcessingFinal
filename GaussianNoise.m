disp('Give me a .jpg or a .png file to add gaussian noise to')
input('Press enter key to proceed')
disp('-------------------------------------------------------------------------------------------------------------')

img = uigetfile({'*.jpg';'*.png';'*tif'});
img = imread(img);
% gets the user's file and reads them into matlab

disp('Give me a standard deviation of the gaussian noise [0-4]')
sd = input('');
disp('-------------------------------------------------------------------------------------------------------------')
% asks for the users density of choice

while sd < 0 || sd > 4
    disp('Error --- Value must be between 0 and 4')
    disp('Give me a standard deviation of the gaussian noise [0-4]')
    sd = input('');
    disp('-------------------------------------------------------------------------------------------------------------')
end
% checks to make sure the length fits the parameters

imgGaussianNoise = imgaussfilt(img,sd);

subplot(2,2,1)
imshow(img)
title('Original Image')

subplot(2,2,2)
imshow(imgGaussianNoise)
title('Image Gaussian Noise')

imwrite(imgGaussianNoise, 'imgGaussianNoise.jpg')


