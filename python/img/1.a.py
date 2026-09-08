import cv2
import matplotlib.pyplot as plt

plt.tight_layout()

im = cv2.imread("assets/hana_conv.jpg", cv2.IMREAD_COLOR_RGB)

for i, c in enumerate(["Reds", "Greens", "Blues"]):
    plt.imshow(im[:, :, i], cmap=c)
    plt.axis("off")
    plt.savefig(f"1.a.{c}.png", bbox_inches="tight")
