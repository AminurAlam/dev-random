import cv2

im = cv2.imread("assets/hana_conv.jpg", cv2.IMREAD_GRAYSCALE)
for i in range(8):
    cv2.imwrite(f"1.c.bit{i}.png", ((im >> i) & 1) * 255)
