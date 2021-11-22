disp('Give me a .jpg or a .png file to add motion blur to')
input('Press enter key to proceed')
disp('-------------------------------------------------------------------------------------------------------------')

img = uigetfile({'*.jpg';'*.png';'*tif'});
img = imread(img);
% gets the user's file and reads them into matlab

disp('Give me a pixel length of the motion blur [0-30]')
disp('This value specifies the length of pixels in motion blur')
length = input('');
disp('-------------------------------------------------------------------------------------------------------------')
% asks for the users density of choice

while length < 0 || length > 30
    disp('Error --- Value must be between 0 and 30')
    disp('Give me a pixel length of the motion blur [0-30]')
    disp('This value specifies the length of pixels in motion blur')
    length = input('');
    disp('-------------------------------------------------------------------------------------------------------------')
end
% checks to make sure the length fits the parameters

disp('Give me an angle of the motion blur [0-90]')
disp('This value specifies the angle of the motion blur (default is horizontal)')
theta = input('');
disp('-------------------------------------------------------------------------------------------------------------')
% asks for the users density of choice

while length < 0 || length > 30
    disp('Error --- Value must be between 0 and 90')
    disp('Give me an angle of the motion blur [0-90]')
    disp('This value specifies the angle of the motion blur (default is horizontal)')
    theta = input('');
    disp('-------------------------------------------------------------------------------------------------------------')
end
% checks to make sure the length fits the parameters

mask = fspecial('motion', length, theta);
imgMotionBlur = imfilter(img, mask);

subplot(2,2,1)
imshow(img)
title('Original Image')

subplot(2,2,2)
imshow(imgMotionBlur)
title('Image Motion Blurred')

imwrite(imgMotionBlur, 'imgMotionBlur.jpg')


