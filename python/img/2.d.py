import cv2
import matplotlib.pyplot as plt

im = cv2.imread("assets/hana_conv.jpg", cv2.IMREAD_GRAYSCALE)
im_eq = cv2.equalizeHist(im)
cv2.imwrite("2.d.hist.png", im_eq)

fig, ax = plt.subplots(2, 1)
ax[0].hist(im.ravel(), 127, range=(0, 255))
ax[1].hist(im_eq.ravel(), 127, range=(0, 255))
plt.savefig("2.d.hist.svg", bbox_inches="tight")
