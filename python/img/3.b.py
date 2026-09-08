import cv2
import numpy as np

im = cv2.imread("assets/grain2.jpg", cv2.IMREAD_GRAYSCALE)
kernel = np.ones((5, 5), np.uint8)
cv2.imwrite("3.b.min.png", cv2.dilate(im, kernel))
cv2.imwrite("3.b.max.png", cv2.erode(im, kernel))
