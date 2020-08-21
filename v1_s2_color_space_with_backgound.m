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

bg_hsv = rgb2hsv(bg);
bg_y_cb_cr = rgb2ycbcr(bg);

im_hsv = rgb2hsv(im);
im_y_cb_cr = rgb2ycbcr(im);

[rgb_r, rgb_g, rgb_b] = segment_utils.multi_binarize_color_space_with_backgound_diff(im, bg);
[hsv_h, hsv_s, hsv_v] = segment_utils.multi_binarize_color_space_with_backgound_diff(im_hsv, bg_hsv);
[ycbcr_y, ycbcr_cb, ycbcr_cr] = segment_utils.multi_binarize_color_space_with_backgound_diff(im_y_cb_cr, bg_y_cb_cr);

figure, imagesc(rgb_r), title("RGB (R)");
figure, imagesc(rgb_g), title("RGB (G)");
figure, imagesc(rgb_b), title("RGB (B)");

figure, imagesc(hsv_h), title("HSV (H)");
figure, imagesc(hsv_s), title("HSV (S)");
figure, imagesc(hsv_v), title("HSV (V)");

figure, imagesc(ycbcr_y), title("yCbCr (y)");
figure, imagesc(ycbcr_cb), title("yCbCr (Cb)");
figure, imagesc(ycbcr_cr), title("yCbCr (Cr)");