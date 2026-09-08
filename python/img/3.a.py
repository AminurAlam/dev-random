import cv2

im = cv2.imread("assets/grain2.jpg", cv2.IMREAD_GRAYSCALE)
im_med = cv2.medianBlur(im, 9)
cv2.imwrite("3.a.med.png", im_med)
