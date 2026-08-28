import cv2 as cv
import matplotlib.pyplot as plt

im = cv.imread("assets/text.jpg", cv.IMREAD_GRAYSCALE)
_, im_bin = cv.threshold(im, 150, 255, cv.THRESH_BINARY)

for i, img in enumerate([im, im_bin]):
    plt.subplot(2, 1, i + 1)
    plt.imshow(img, cmap="gray")
    plt.xticks([])
    plt.yticks([])
plt.show()
