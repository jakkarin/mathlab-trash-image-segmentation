close all; clear; clc;

% 1280x720
bg = imread('data/bg.jpg');
% resize 0.5
bg = imresize(bg, [360, 640]);

% 1280x720
im = imread('data/1_aluminium.jpg');
% resize 0.5
im = imresize(im, [360, 640]);

figure, imshow(im), title("Original Image");

bg_gray = rgb2gray(bg);
im_gray = rgb2gray(im);

bg_gray = imgaussfilt(bg_gray, 5);
im_gray = imgaussfilt(im_gray, 5);

im_gray = imabsdiff(im_gray, bg_gray);

im_bw_canny = edge(im_gray,'canny');
im_bw_sobel = edge(im_gray,'sobel');
im_bw_prewitt = edge(im_gray,'prewitt');
im_bw_roberts = edge(im_gray,'roberts');

figure, imshow(im_bw_canny), title("Canny");
figure, imshow(im_bw_sobel), title("Sobel");
figure, imshow(im_bw_prewitt), title("Prewitt");
figure, imshow(im_bw_roberts), title("Roberts");

selection = im_bw_roberts;

stuct_element = strel('disk', 20);
selection = imdilate(selection, stuct_element);
stuct_element = strel('disk', 24);
selection = imerode(selection, stuct_element);

selection = imfill(selection, 'holes');

figure, imshow(selection), title("Selection");

polys = bwboundaries(selection, 'noholes');