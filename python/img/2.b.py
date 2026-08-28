import cv2 as cv
import numpy as np
import matplotlib.pyplot as plt

im = cv.imread("assets/hana_conv.jpg", cv.IMREAD_GRAYSCALE)

# log_image = np.array(log_image, dtype=np.uint8)
c = 255 / np.log(1 + np.max(im))
img_log = c * np.log(im + 1)

fig, ax = plt.subplots(2)
ax[0].imshow(im, cmap="gray")
ax[1].imshow(img_log, cmap="gray")
plt.show()


fig, ax = plt.subplots(2)
ax[0].hist(im.ravel(), 50, [0, 256])
ax[1].hist(img_log.ravel(), 50, [0, 256])
plt.show()

plt.plot(c * np.log(np.arange(1, 256)))
plt.show()
