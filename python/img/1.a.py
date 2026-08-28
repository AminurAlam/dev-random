import cv2 as cv
import matplotlib.pyplot as plt

im = cv.imread("assets/hana_conv.jpg", cv.IMREAD_COLOR_RGB)

for i, c in enumerate(["Reds", "Greens", "Blues"]):
    plt.subplot(3, 1, i + 1)
    plt.imshow(im[:, :, i], cmap=c)
    plt.xticks([])
    plt.yticks([])
plt.show()
