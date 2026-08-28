import cv2 as cv
import matplotlib.pyplot as plt

im = cv.imread("assets/hana_conv.jpg", cv.IMREAD_COLOR_RGB)

plt.imshow(255 - im)
plt.xticks([])
plt.yticks([])
plt.show()
