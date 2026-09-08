import cv2

im = cv2.imread("assets/grain2.jpg", cv2.IMREAD_GRAYSCALE)
cv2.imwrite("3.c.smo.png", cv2.blur(im, (5, 5), 0))
