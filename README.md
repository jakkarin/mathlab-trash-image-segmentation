# Mathlab: find segmentation method

## pipline

- v1_s1_color_space.m

  - split color space (rgb,hsv,yCbCr)

  - gaussian blur (sigma=5)

  - multi thresh

  - quantize (level=3)

- v1_s2_color_space_with_backgound.m

  - split color space (rgb,hsv,yCbCr)

  - gaussian blur (sigma=5)

  - backgound diff

  - multi thresh

  - quantize (level=3)

- v1_s3_edge_detection_with_backgound.m

  - gaussian blur (sigma=5)

  - backgound diff

  - egde detect (canny, sobel, prewitt, roberts)

- v1_s4_color_space_edge_detection.m

  - split color space (rgb,hsv,yCbCr)

  - gaussian blur (sigma=5)

  - multi thresh

  - quantize (level=3)

  - egde detect (canny, sobel, prewitt, roberts)

- v1_s5_color_space_edge_detection_with_backgound.m

  - split color space (rgb,hsv,yCbCr)

  - gaussian blur (sigma=5)

  - backgound diff

  - multi thresh

  - quantize (level=3)

  - egde detect (canny, sobel, prewitt, roberts)