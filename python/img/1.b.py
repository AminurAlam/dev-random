import cv2
import matplotlib.pyplot as plt

im = cv2.imread("assets/rgb.jpg", cv2.IMREAD_COLOR_RGB)
im_gray = cv2.cvtColor(im, cv2.COLOR_RGB2GRAY)

for i, c in enumerate([im, im_gray]):
    plt.subplot(1, 2, i + 1)
    plt.imshow(c, cmap=("gray" if i else None))
    plt.xticks([])
    plt.yticks([])
plt.show()
