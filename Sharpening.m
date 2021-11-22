disp('Give me a .jpg or a .png file to sharpen')
input('Press enter key to proceed')
disp('-------------------------------------------------------------------------------------------------------------')
%prompt the user

img = uigetfile({'*.jpg';'*.png';'*tif'});
img = im2double(imread(img));
% gets the user's file and reads them into matlab

disp('Give me a radius value for sharpening [0-10]')
disp('This value controls the size of the region around the edge pixels affected by sharpening')
disp('A larger value sharpens a larger area around the edges, a smaller value sharpens a smaller region')
radius = input('');
disp('-------------------------------------------------------------------------------------------------------------')
% asks for the users radius of choice

while radius < 0 || radius > 10
    disp('Error --- Value must be between 0 and 10')
    disp('Give me a radius value for sharpening [0-10]')
    disp('This value controls the size of the region around the edge pixels affected by sharpening')
    disp('A larger value sharpens a larger around the edges, a smaller value sharpens a smaller region')
    radius = input('');
    disp('-------------------------------------------------------------------------------------------------------------')
end
% checks to make sure the radius fits the parameters
   
disp('Give me a strength value for sharpening [0-10]')
disp('This value controls the contrast of the sharpened pixels')
disp('A larger value leads to a larger contrast of the sharpened pixels')
amount = input('');
disp('-------------------------------------------------------------------------------------------------------------')
% asks for the users strength of choice

while amount < 0 || amount > 10
    disp('Error --- Value must be between 0 and 10')
    disp('Give me a strength value for sharpening [0-10]')
    disp('This value controls the contrast of the sharpened pixels')
    disp('A larger value leads to a larger contrast of the sharpened pixels')
    amount = input('');
    disp('-------------------------------------------------------------------------------------------------------------')
end
amount = amount/5;
%checks amount value and divides by 5 afterwards

disp('Give me a threshold value for sharpening [0-10]')
disp('This value controls the minimum contrast required for a pixel to be considered an edge pixel')
disp('Larger value only allows for sharpening in high contrast areas, while low contrast areas are unaffected')
threshold = input('');
disp('-------------------------------------------------------------------------------------------------------------')
% asks for the users threshold of choice

while threshold < 0 || threshold > 10
    disp('Error --- Value must be between 0 and 10')
    disp('Give me a threshold value for sharpening [0-10]')
    disp('This value controls the minimum contrast required for a pixel to be considered an edge pixel')
    disp('Larger value only allows for sharpening in high contrast areas, while low contrast areas are unaffected')
    threshold = input('');
    disp('-------------------------------------------------------------------------------------------------------------')
end
% checks to make sure the threshold fits the parameters
threshold = threshold/10;

sharpenedImage = imsharpen(img, 'Radius', radius, 'Amount', amount, 'Threshold', threshold); 

subplot(2,1,1);
imshow(img)
title('Original image')
%formating and displaying for original image

subplot(2,1,2);
imshow(sharpenedImage)
title('Sharpened image')
%formating and display for blurred image

imwrite(sharpenedImage, 'imageSharpened.jpg')