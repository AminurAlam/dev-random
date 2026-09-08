import cv2
import numpy as np
import matplotlib.pyplot as plt

im = cv2.imread("assets/hana_conv.jpg", cv2.IMREAD_GRAYSCALE)

c = 255 / np.log(1 + np.max(im))
im_log = c * np.log(im + 1)

cv2.imwrite("2.b.log.png", im_log)

fig, ax = plt.subplots(2)
ax[0].hist(im.ravel(), 50, [0, 256])
ax[1].hist(im_log.ravel(), 50, [0, 256])
plt.savefig("2.b.log.plot.svg", bbox_inches="tight")
