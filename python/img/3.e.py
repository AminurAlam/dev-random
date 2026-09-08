import cv2
import numpy as np

im = cv2.imread("assets/grain2.jpg", cv2.IMREAD_GRAYSCALE)
im_sharp = cv2.filter2D(im, -1, np.array([[0, -1, 0], [-1, 5, -1], [0, -1, 0]]))
cv2.imwrite("3.e.sharp.png", im_sharp)
