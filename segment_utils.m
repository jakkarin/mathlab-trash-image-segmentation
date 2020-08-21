classdef segment_utils
    methods (Static)
        function [o_c1, o_c2, o_c3] = multi_binarize_color_space(im)
            o_c1 = segment_utils.multi_binarize(im(:,:,1));
            o_c2 = segment_utils.multi_binarize(im(:,:,2));
            o_c3 = segment_utils.multi_binarize(im(:,:,3));
        end

        function [o_c1, o_c2, o_c3] = multi_binarize_color_space_with_backgound_diff(im, bg)
            o_c1 = segment_utils.multi_binarize_with_backgound_diff(im(:,:,1), bg(:,:,1));
            o_c2 = segment_utils.multi_binarize_with_backgound_diff(im(:,:,2), bg(:,:,2));
            o_c3 = segment_utils.multi_binarize_with_backgound_diff(im(:,:,3), bg(:,:,3));
        end

        function output = multi_binarize(im, opt_gauss_sigma, opt_level)
            arguments
                im
                opt_gauss_sigma = 5;
                opt_level = 3;
            end
            im_blur = imgaussfilt(im, opt_gauss_sigma);
            level = multithresh(im_blur, opt_level);
            output = imquantize(im_blur, level);
        end

        function output = multi_binarize_with_backgound_diff(im, bg, opt_gauss_sigma, opt_level)
            arguments
                im
                bg
                opt_gauss_sigma = 5;
                opt_level = 3;
            end
            bg_blur = imgaussfilt(bg, opt_gauss_sigma);
            im_blur = imgaussfilt(im, opt_gauss_sigma);
            im_blur = imabsdiff(im_blur, bg_blur);
            level = multithresh(im_blur, opt_level);
            output = imquantize(im_blur, level);
        end

        function [c1, c2, c3] = multi_edge_detection(opt_method, c1, c2, c3)
            c1 = edge(c1, opt_method);
            c2 = edge(c2, opt_method);
            c3 = edge(c3, opt_method);
        end
    end
end