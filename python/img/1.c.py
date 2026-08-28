import cv2 as cv
import matplotlib.pyplot as plt

im = cv.imread("assets/hana_conv.jpg", cv.IMREAD_GRAYSCALE)

for i in range(8):
    plt.subplot(4, 2, i + 1)
    plt.imshow((im >> i) & 1, cmap="gray")
    plt.title(f"bit {i}")
    plt.xticks([])
    plt.yticks([])
plt.show()
