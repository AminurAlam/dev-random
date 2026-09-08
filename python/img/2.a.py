import cv2

im = cv2.imread("assets/hana_conv.jpg", cv2.IMREAD_GRAYSCALE)
cv2.imwrite("2.a.neg.png", 255 - im)
