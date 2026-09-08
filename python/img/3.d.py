import cv2

im = cv2.imread("assets/grain2.jpg", cv2.IMREAD_GRAYSCALE)
im_lap = cv2.Laplacian(cv2.GaussianBlur(im, (1, 1), 0), cv2.CV_8U)
cv2.imwrite("3.d.lap.png", im_lap)
