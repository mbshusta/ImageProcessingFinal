% dir = input("give me a image file directory");
% img = imread(dir);
% imshow(img)

file = uigetfile({'*.jpg';'*.png'});
imread(file)
imshow(file)
