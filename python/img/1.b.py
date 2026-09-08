import cv2
import matplotlib.pyplot as plt

im = cv2.imread("assets/hana_conv.jpg", cv2.IMREAD_GRAYSCALE)
plt.imshow(im, cmap="gray")
plt.axis("off")
plt.savefig("1.b.gray.png", bbox_inches="tight")
