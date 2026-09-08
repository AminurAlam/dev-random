import cv2

im = cv2.imread("assets/hana_conv.jpg", cv2.IMREAD_GRAYSCALE)
_, im_bin = cv2.threshold(im, 110, 255, cv2.THRESH_BINARY)
cv2.imwrite("2.c.bin.png", im_bin)
