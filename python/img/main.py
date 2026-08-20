import cv2
import matplotlib.pyplot as plt
import os

# import numpy as np

for file in os.listdir("img"):
    print(f"=== {file}")
    fig, ax = plt.subplots(2, 2)

    img = cv2.cvtColor(cv2.imread("img/" + file), cv2.COLOR_BGR2RGB)
    img_gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)

    h, w, ch = img.shape

    fig.suptitle(f"h: {h} w: {w} ch: {ch}")

    ax[0, 0].imshow(img)
    ax[0, 1].imshow(img_gray, cmap="gray")
    ax[1, 0].hist(img.ravel(), 256, [0, 255])

    color = ("r", "g", "b")
    for i, col in enumerate(color):
        histr = cv2.calcHist([img], [i], None, [256], [0, 255])
        ax[1, 1].plot(histr, color=col)

    plt.show()
