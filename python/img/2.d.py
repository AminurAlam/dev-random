import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

im = cv.imread("assets/hana_conv.jpg", cv.IMREAD_GRAYSCALE)
im_eq = cv.equalizeHist(im)

plt.subplot(2, 1, 1)
plt.imshow(im, cmap="gray")
plt.xticks([])
plt.yticks([])

plt.subplot(2, 1, 2)
plt.imshow(im_eq, cmap="gray")
plt.xticks([])
plt.yticks([])

plt.show()

plt.subplot(2, 1, 1)
plt.hist(im.ravel(), 255, range=(0, 255))
plt.subplot(2, 1, 2)
plt.hist(im_eq.ravel(), 255, range=(0, 255))

# plt.imshow([range(256) for _ in range(10)], cmap="gray")
# plt.xticks([])
# plt.yticks([])
# plt.subplot(3, 1, 3)

# plt.colorbar(cax=plt.axes((0.93, 0.1, 0.045, 0.8)))
# plt.subplots_adjust(hspace=0)
# plt.tight_layout()

plt.show()
