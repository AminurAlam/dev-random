#import "snippets/note.typ": *
#show: template.with("Computer Graphics")

#let s1 = $sin theta_1$
#let s2 = $sin theta_2$
#let c1 = $cos theta_1$
#let c2 = $cos theta_2$

#pagebreak()

= Short Questions

== Frame Buffer

A frame buffer is a specialized region of computer memory, typically located on a
graphics card or RAM, that stores the complete data for a single frame of video. The
display hardware then reads this memory at a fixed rate to refresh the image seen by
the user on the screen. The higher the resolution and bit-depth, the bigger the size
of the frame buffer.

To maintain a smooth visual experience and prevent artifacts like screen tearing,
computers often employ multiple frame buffers. In a double-buffering setup, the GPU
draws the next frame into a back buffer while the display reads from the front
buffer. Once the drawing is complete, the two buffers swap roles. Triple buffering
adds an extra layer to further synchronize the output with the monitor's refresh
rate, ensuring that the display always has a complete frame ready to show even if the
rendering speed fluctuates during intensive tasks like gaming or video editing.

== Viewport

In computer graphics and 3D rendering, a viewport refers to the 2D rectangular area
on the screen where the final image is drawn. While a 3D scene exists in a virtual
world with its own coordinate system, the viewport defines how that world is mapped
onto the monitor's pixels. It determines the aspect ratio and the boundaries of the
visible scene. In software like 3D modeling or game engines, users often work with
multiple viewports (top, side, front, and perspective views) simultaneously to see
the same virtual object from different angles within the same window.

== Resolution

Resolution in computer graphics refers to the number of distinct pixels in each
dimension that can be displayed on a screen or stored in an image. It is typically
expressed as a width-by-height measurement, such as 1920x1080, where the first number
represents the horizontal pixels and the second represents the vertical pixels. The
total pixel count, found by multiplying these two numbers, determines the level of
detail, clarity, and sharpness the system can produce.

The resolution is also measured by pixel density, often referred to as pixels per
inch (PPI). A resolution like 1920x1080 will appear much sharper on a small
smartphone screen than on a massive television because the pixels are packed more
tightly together. High-resolution displays allow for finer textures, more legible
text, and smoother curves, which helps eliminate aliasing.

== Aspect Ratio
Aspect ratio is the proportional relationship between the width and the height of an
image, screen, or viewport. It is expressed as two numbers separated by a colon, such
as 16:9, where the first number represents the width and the second represents the
height. This ratio describes the shape of the display area rather than its physical
size or total pixel count.For instance, both 1920x1080 and 1280x720 resolutions share
a 16:9 aspect ratio, meaning they have the same shape even though one has more detail
than the other. For example, a 1:1 ratio creates a perfect square, while a 16:9 ratio
creates the wide rectangle common in modern televisions and computer monitors.

Different standards have evolved over time to suit different needs. Older computer
monitors and standard-definition televisions used a 4:3 aspect ratio, which is
relatively boxy. Most modern content is produced in 16:9, which is the standard for
high-definition video. In professional cinema even wider formats like 21:9 or 32:9
are used to provide a more immersive experience.

== PixMap

A pixmap, short for pixel map, is a data structure that represents a rectangular grid
of pixels. It is essentially a digital map where every entry corresponds to a single
point on a screen or in an image. Each of these entries contains numerical data that
defines the color and intensity of that specific pixel. While the term is often used
interchangeably with "bitmap," a pixmap specifically refers to a map that supports
multiple colors per pixel, whereas a traditional bitmap originally referred to images
with only one bit of data per pixel (black and white).

== Clipping

Clipping is the process in computer graphics of identifying and removing parts of an
image, line, or 3D object that fall outside a specific boundary, such as the edges of
a screen or a window. This is a fundamental step in the graphics pipeline because it
prevents the computer from wasting processing power and memory on drawing details
that the user cannot actually see.

In 2D graphics, clipping ensures that if you draw a line or a shape that extends past
the edges of your program window, the part that goes over the edge simply isn't
rendered on the monitor. The computer mathematically checks the coordinates of every
graphical element against the boundaries of the viewport. If an element is completely
outside, it is ignored entirely. If it is partially outside, the computer calculates
new endpoints exactly at the boundary so that the shape appears to cut off cleanly at
the edge of the screen.

== Joints

#figure(img("assets/joints.jpg", width: 85%))

#pagebreak()

= DISPLAYS // https://www.makingsoftware.com/chapters/how-a-screen-works

== CRT

#figure(img("assets/crt.png", width: 60%))

#grid(
  column-gutter: 10pt,
  columns: (54%, auto),
  [
    ADVANTAGES:
    - analog input
    - high refresh rates/response time
    - cheap

    DISADVANTAGES:
    - needs vacuum
    - heavy (thick glasses needed to create vacuum)
    - one pixel at a time (raster scan pattern)
    - curved screen
    - has minimum size (needed for changing path)
    - has maximum size (weight)
    - power hungry
  ],
  figure(img("assets/mag.png", width: auto)),
)

== Plasma Panel Display

Plasma Panel Displays, also called Gas-Discharge Displays, were an early type of
flat-panel display used before LCDs and OLEDs became popular. The name "Plasma" comes
from the fact that these displays use ionized gas (plasma) to produce light. Unlike
traditional CRT screens that rely on an electron beam, plasma displays use tiny
gas-filled cells that light up when electricity is applied. A Plasma Panel Display is
a self-emissive display that uses small gas-filled cells (pixels) to create an image.
When an electric current passes through these cells, the gas inside (usually neon or
xenon) gets ionized into plasma. This process emits light, which is used to form
images on the screen. Plasma panels do not need constant refreshing like CRTs because
once a pixel is lit, it stays on until deliberately erased. This makes them
flicker-free and stable.

ADVANTAGES:
- High Resolution
- Large Screen Size Possible
- Less Volume & Weight
- Flicker-Free Display

DISADVANTAGES:
- Poor Resolution in Early Models
- Complex Wiring & Addressing
- Difficult to Control Addressing

== LCD

LCD (Liquid Crystal Display) is one of the most common display technologies used in
devices like televisions, computer monitors, smartphones, and more. It's known for
its thin profile, good image quality, and energy efficiency. However, unlike LED
displays, LCDs don’t emit their own light—they rely on a backlight to illuminate the
display. An LCD (Liquid Crystal Display) uses liquid crystals to form images. These
liquid crystals don't emit light directly, but instead, they manipulate light from a
backlight source to produce images. The LCD screen’s "liquid crystal" doesn't mean
it’s a liquid like water; it’s a special substance that has properties of both
liquids and solids, allowing it to adjust its transparency when electricity is
applied.

#grid(
  column-gutter: 40pt,
  columns: 2,
  [
    ADVANTAGES:
    - cheap
    - bright
    - energy efficient
    - slim & lightweight
    - long lasting

    DISADVANTAGES:
    - viewing angles
    - low contrast
    - bad color accuracy
    - backlight bleeding
    - slow response time
  ],
  figure(img("assets/lcd.png", width: 65%)),
)

== OLED

LED displays are one of the most popular and widely used display technologies today.
They are known for their bright visuals, energy efficiency, and long lifespan. The
name "LED" (Light Emitting Diode) comes from the fact that these displays use small
diodes that emit light when electricity is passed through them. An LED display is a
flat-panel display that uses light-emitting diodes (LEDs) as the source of light.
Unlike older display technologies like CRT (Cathode Ray Tube) and Plasma, LED
displays are: Thinner, Brighter, More energy-efficient. LEDs are tiny semiconductor
devices that emit light when an electric current passes through them. These LEDs can
be arranged in a grid to form images, text, or videos. Even though we call them "LED
displays," many LED TVs today are actually LCD displays with LED backlighting rather
than pure LED panels.

#grid(
  column-gutter: 40pt,
  columns: 2,
  [
    ADVANTAGES:
    - color accuracy
    - bright & contrast
    - efficient
    - slim & light
    - eco friendly

    DISADVANTAGES:
    - expensive
    - burn in
    - dim
    - short lifespan
  ],
  figure(img("assets/oled.png", width: 72%)),
)

#pagebreak()

= DRAWING ALGORITHMS

== DDA Line

$
  "steps" & = cases(
              abs(dx) & ",  if " abs(dx) > abs(dy),
              abs(dy) & ",  if " abs(dy) > abs(dx)
            ) \
  x_(i+1) & = x_i + (dx) / "steps" \
  y_(i+1) & = y_i + (dy) / "steps" \
$

#figure(
  caption: [EXAMPLE: (20, 10) #sym.arrow (10, 30)],
  table(
    columns: (10%, 10%, 15%),
    [i], [x], [y],
    [0], [20], [10],
    [1], [21], [$10.8 approx 11$],
    [2], [22], [$11.6 approx 12$],
    [3], [23], [$12.2 approx 12$],
    [$dots$], [$dots$], [$dots$],
    [10], [30], [$17.6 approx 18$],
  ),
)

ADVANTAGES:
- simple
- fast
- we cannot use the multiplication method in Digital Differential Analyzer
- it tells us about the overflow of the point when the point changes its location

DISADVANTAGES:
- floating-point arithmetic
- round-off is also time-consuming
- sometimes the point position is not accurate

== Bresenham Line

initial decision parameter $P_0 & = 2 dy - dx$

if $P_i >= 0$ \
$"     "y_(i+1) = y_i + 1$ \
$"     "P_(i+1) = P_i +$ #text(red)[$2 (dy - dx)$] \
if $P_i < 0$ \
$"     "P_(i+1) = P_i +$ #text(green)[$2 dy$] \

#figure(
  caption: [EXAMPLE: (1, 1) #sym.arrow (5, 3)],
  table(
    columns: (10%, 10%, 10%, 10%),
    [i], [$x_i$], [$y_i$], [$P_i$],
    [0], [1], [1], [0],
    [1], [2], [2], [-4],
    [2], [3], [2], [0],
    [3], [4], [3], [-4],
    [4], [5], [3], [0],
  ),
)

ADVANTAGES:
- simple to implement because it only contains integers
- quick and incremental
- fast to apply but not faster than the DDA algorithm
- The point accuracy is higher than the DDA algorithm

DISADVANTAGES:
- only helps to draw the basic line
- line is not smooth

== Mid Point Circle Drawing Algorithm

initial decision parameter $P_0 & = (5/4 - r) "or" (1 - r)$

if $P_i >= 0$ \
$"     "y_(i+1) = y_i - 1$ \
$"     "P_(i+1) = P_i +$ #text(red)[$2(x_i - y_i) + 5$] \
if $P_i < 0$ \
$"     "P_(i+1) = P_i +$ #text(green)[$2x_i + 3$] \

== Bresenham Circle

initial decision parameter $P_0 & = 3 - (2 r)$

if $P_i >= 0$ \
$"   "y_(i+1) = y_i - 1$ \
$"   "P_(i+1) = P_i +$ #text(red)[$4(x_i - y_i) + 10$] \
if $P_i < 0$ \
$"   "P_(i+1) = P_i +$ #text(green)[$4x_i + 6$] \

#pagebreak()

= CLIPPING ALGORITHMS

== Point Clipping

If a point satisfies all four boundary conditions, it is considered inside the
window. Otherwise, it is outside. Let the point be P(x, y). The conditions are:
$
  x_"min" <= x <= x_"max" "  " and "  " y_"min" <= y <= y_"max"
$

#figure(img("assets/pointclip.svg", width: 50%))

== Line Clipping (Cohen–Sutherland)
#grid(
  columns: 2,
  figure(img("assets/lc1.svg", width: auto)),
  figure(img("assets/lc2.svg", width: auto)),

  figure(img("assets/lc3.svg", width: auto)),
  figure(img("assets/lc4.svg", width: auto)),

  figure(img("assets/lc5.svg", width: auto)),
  figure(img("assets/lc6.svg", width: auto)),
)

To find intersect coordinate where line is cutoff
$
   m & = (y_2 - y_1) / (x_2 - x_1) = (y' - y_1) / (x' - x_1) \
   m & = (y' - y_1) / (x_"min" - x_1) \
  y' & = m dot (x_"min" - x_1) + y_1 \
$

ALGORITHM:

1. Assign the region codes to both endpoints.
2. Perform OR operation on both of these endpoints.
3.
  - if `x | 0000 = 0000` and `y | 0000 = 0000`, \
    then it is completely visible (inside the window).
  - else if `x & 0000 = 0000` and `y & 0000 = 0000`, \
    then the line is invisible and not inside the window. Also, it can't be
    considered for clipping.
  - otherwise the line is partially inside the window and considered for clipping.
4. After confirming that the line is partially inside the window, then we find the
  intersection with the boundary of the window.
  $ x' = m dot (y' - y) + x "    OR    " y' = m dot (x' - x) + y $
5. Now, overwrite the endpoints with a new one and update it.
6. Repeat the 4th step till your line doesn't get completely clipped

== Polygon Clipping (Sutherland-Hodgman)

#figure(img("assets/pc1.svg", width: auto))

After understanding the concept of line clipping and its algorithms, we can now
extend the concept of line clipping to polygon clipping, because polygon is a surface
enclosed by several lines. Thus, by considering the polygon as a set of line we can
divide the problem to line clipping and hence, the problem of polygon clipping is
simplified. But it is to be noted that, clipping each edge separately by using a line
clipping algorithm will certainly not produce a truncated polygon as one would
expect. Rather, it would produce a set of unconnected line segments as the polygon is
exploded. Herein lies the need to use a different clipping algorithm to output
truncated but yet bounded regions from a polygon input. Sutherland-Hodgman algorithm
is one of the standard methods used for clipping arbitrary shaped polygons with a
rectangular clipping window. It uses divide and conquer technique for clipping the
polygon.

#table(
  inset: 10pt,
  columns: (15%, 15%, 15%),
  align: center,
  [$x$], [$y$], [Output],
  [Inside], [Inside], $(x, y)$,
  [Inside], [Outside], $(x, y')$,
  [Outside], [Inside], $(x', y)$,
  [Outside], [Outside], [none],
)

#pagebreak()

= COLORING ALGORITHMS

== Flood Fill

```py
def flood(x, y, from, to):
    cur = getPixel(x, y)
    if cur != from: return # we dont want to change this
    if cur == to: return # already changed

    setPixel(x, y, to);
    flood(x+1, y, from, to)
    flood(x-1, y, from, to)
    flood(x, y+1, from, to)
    flood(x, y-1, from, to)
```
== Boundary Fill

```py
def bound(x, y, to, boundary):
    cur = getPixel(x, y)
    if (cur == boundary || cur == to): return

    setPixel(x, y, to)
    bound(x+1, y, to, boundary)
    bound(x-1, y, to, boundary)
    bound(x, y+1, to, boundary)
    bound(x, y-1, to, boundary)
```

== RGB to Grayscale

$
  G & = (R+G+B)/3               &     "(average)" \
  G & = 0.3 R + 0.58 G + 0.12 B & "   (weighted)" \
$

#pagebreak()

= TRANSFORMATIONS // https://pravin-hub-rgb.github.io/BCA/resources/sem6/cg/unit4/index.html

#figure(img("assets/trans.svg"))

== 2D

#set math.mat(gap: 0.5em)

#grid(
  columns: 3,
  gutter: 20pt,
  column-gutter: 50pt,
  [TRANSLATION \ $mat(x'; y') = mat(x; y) + mat(t_x; t_y)$],
  [SCALING \ $mat(x'; y') = mat(S_x, 0; 0, S_y) mat(x; y)$],
  [ROTATION \
    $mat(x'; y') = mat(cos theta, -sin theta; sin theta, cos theta) mat(x; y)$ \ \
  ],

  [REFLECTION ON X-AXIS \ $mat(x'; y') = mat(1, 0; 0, -1) mat(x; y)$],
  [REFLECTION ON Y-AXIS \ $mat(x'; y') = mat(-1, 0; 0, 1) mat(x; y)$ \ \ ],
  [],

  [SHEER X \ $mat(x'; y') = mat(1, S_x; 0, 1) mat(x; y)$],
  [SHEER Y \ $mat(x'; y') = mat(1, S_y; 0, 1) mat(x; y)$],
)

== 2D (homogeneous coordinates)

#grid(
  columns: 3,
  gutter: 20pt,
  column-gutter: 38pt,
  [TRANSLATION \
    $mat(x'; y'; 1) = mat(1, 0, t_x; 0, 1, t_y; 0, 0, 1) mat(x; y; 1)$],
  [SCALING \ $mat(x'; y'; 1) = mat(S_x, 0, 0; 0, S_y, 0; 0, 0, 1) mat(x; y; 1)$],
  [ROTATION \
    $mat(x'; y'; 1) = mat(cos theta, -sin theta, 0; sin theta, cos theta, 0; 0, 0, 1) mat(x; y; 1)$],
)

== 3D (homogeneous coordinates)

#grid(
  columns: 2,
  gutter: 20pt,
  column-gutter: 38pt,
  [TRANSLATION \
    $mat(x'; y'; z'; 1) = mat(1, 0, 0, t_x; 0, 1, 0, t_y; 0, 0, 1, 0; 0, 0, 0, 1) mat(x; y; z; 1)$],
  [SCALING \
    $mat(x'; y'; z'; 1) = mat(S_x, 0, 0, 0; 0, S_y, 0, 0; 0, 0, S_z, 0; 0, 0, 0, 1) mat(x; y; z; 1)$
    \ \
  ],
)

#grid(
  columns: 3,
  column-gutter: 38pt,
  [ROTATION X-AXIS \ $mat(
      1, 0, 0, 0;
      0, ct, -st, 0;
      0, st, ct, 0;
      0, 0, 0, 1
    )$],
  [ROTATION Y-AXIS \ $mat(
      ct, 0, st, 0;
      0, 1, 0, 0;
      - st, 0, cos theta, 0;
      0, 0, 0, 1
    )$],
  [ROTATION Z-AXIS \ $mat(
      ct, -st, 0, 0;
      st, ct, 0, 0;
      0, 0, 1, 0;
      0, 0, 0, 1
    )$],
)

#pagebreak()

= COMPOSITE TRANSFORMATIONS

/ NOTE: When combining transformations, it is very important to remember that matrix
  multiplication is not commutative. So the order of transforms does matter. The
  transforms are applied from the right side first.

EXAMPLE: rotate then scale

$S(S_x, S_y) dot R(theta)$

== Scaling at a particular point

$
  mat(x'; y') = (mat(S_x, 0; 0, S_y) times mat(x - u; y - v)) + mat(u; v)
$

== Rotations are additive

#set math.mat(column-gap: 1.2em)

$
  R(theta_1) & = mat(c1, s1; - s1, c1) \
  R(theta_2) & = mat(c2, s2; - s2, c2) \
$
$
  R(theta_1) times R(theta_2) & = mat(c1, s1; - s1, c1) times mat(c2, s2; - s2, c2) \
                              & = mat(
                                  c1 dot c2 plus s1 dot (- s2), c1 dot s2 plus s1 dot c2;
                                  - s1 dot c2 plus c1 dot (- s2), - s1 dot s2 plus c1 dot c2;
                                ) \
                              & = mat(
                                  cos(theta_1 + theta_2), sin(theta_1 + theta_2);
                                  - sin(theta_1 + theta_2), cos(theta_1 + theta_2)
                                ) \
                              & = R(theta_1 + theta_2) \
$
#set math.mat(column-gap: 1em, align: center)


== Scaling are multiplicative

$
                    S(x_1, y_1) & = mat(x_1, 0; 0, y_1) \
                    S(x_2, y_2) & = mat(x_2, 0; 0, y_2) \
  S(x_1, y_1) times S(x_2, y_2) & = mat(x_1, 0; 0, y_1) times mat(x_2, 0; 0, y_2) \
                                & = mat(x_1 dot x_2, 0; 0, y_1 dot y_2;) \
                                & = S(x_1 dot x_2, y_1 dot y_2) \
$


== Are Rotation and Scaling commutative?

$
  R(theta) times S(x, y) & = mat(cos theta, - sin theta; sin theta, cos theta) times mat(x, 0; 0, y) \
  & = mat(x cos theta, - y sin theta; x sin theta, y cos theta) \
  S(x, y) times R(theta) & = mat(x, 0; 0, y) times mat(cos theta, - sin theta; sin theta, cos theta) \
  & = mat(x cos theta, - x sin theta; y sin theta, y cos theta) \
$
\
$
  therefore R(theta) times S(x, y) & != S(x, y) times R(theta) \
$

#pagebreak()

= DIFFERENCES

== DDA vs Bresenham Line Algorithm

#table(
  columns: (50%, 50%),
  inset: 10pt,
  align: center,
  [DDA], [BRESENHAM],
  [DDA stands for Digital Differential Analyzer.], [While it has no full form.],
  [less efficient], [more efficient],
  [Slower calculation speed], [Faster calculation speed],
  [expensive], [costlier],
  [less precision or accuracy.], [more precision or accuracy.],
  [calculation is more complex.], [calculation is simple.],
  [optimization is not provided.], [optimization is provided.],
)

== Parallel Projection vs. Perspective Projection

Parallel projection and perspective projection are two different techniques used in
computer graphics to represent three-dimensional objects on a two-dimensional plane.
Parallel projection is a method where all the projection lines are parallel,
resulting in a uniform scaling of the object. This technique is commonly used in
technical drawings and architectural plans, as it accurately represents the object's
shape and size. On the other hand, perspective projection mimics the way human vision
perceives objects in the real world. It uses converging projection lines to create a
sense of depth and distance, making objects appear smaller as they move away from the
viewer. This technique is widely used in video games, movies, and virtual reality
applications to create a more realistic and immersive experience.

Parallel projection, particularly orthographic projection, is widely used in
technical fields such as engineering, architecture, and design. Its ability to
maintain accurate measurements and proportions makes it ideal for creating precise
plans and blueprints. Oblique projection, on the other hand, finds its applications
in artistic illustrations, video games, and animations where a sense of depth and
perspective is desired without the complexity of true perspective projection.

Perspective projection, with its ability to create realistic and immersive scenes, is
extensively used in art, photography, cinematography, and virtual reality. It allows
artists and photographers to capture the depth and three-dimensionality of the real
world, while cinematographers can use it to create visually stunning and dynamic
shots. Perspective projection is also essential in virtual reality applications,
where the goal is to create an immersive and realistic virtual environment.


#figure(
  table(
    columns: (16%, auto, auto),
    align: left,
    table.header([ATTRIBUTE], [PARALLEL PROJECTION], [PERSPECTIVE PROJECTION]),
    [Definition],
    [all projection lines are parallel to each other],
    [projection lines converge to a single point (vanishing point)],

    [Realism], [Less realistic], [More realistic],
    [Accuracy], [accurate view of object], [not accurate view of object],
    [Center of Projection], [at infinity], [at finite point],
    [Convergence], [No convergence], [Convergence towards vanishing point],
    [Distortion],
    [No distortion, all lines remain parallel],
    [Distortion, towards the edges of the projection],

    [Field of View],
    [Uniform field of view, as all objects are projected with the same scale],
    [Varied field of view, as objects closer to the viewer appear larger],

    [Application],
    [technical drawings, engineering, and computer graphics],
    [realistic artwork, photography, and virtual reality],

    [Types],
    [
      + Orthographic (proj is normal to screen)
      + Oblique (proj is not normal to screen)
    ],
    [
      + One Point
      + Two Point
      + Three Point
    ],
  ),
)

#figure(img("assets/projection.jpg", width: 90%))

== Raster Scan vs Random Scan

#table(
  columns: (16%, auto, auto),
  [PROPERTY], [RASTER SCAN], [RANDOM SCAN],

  [Resolution], [lower], [higher],
  [Speed], [Slower], [Faster],
  [Cost], [cheaper], [expensive],
  [Frame Buffer?], [Yes], [No],

  [Motion of Electron Beam],
  [top to bottom and one row at a time],
  [line start to line end],

  [Picture Definition],
  [It stores picture definition as a set of intensity values of the pixels in the
    frame buffer.],
  [It stores picture definition as a set of line commands in the Refresh buffer.],

  [Refresh Rate],
  [Refresh rate is 60 to 80 frames per second and is independent of picture
    complexity.],
  [Refresh rate depends on the number of lines to be displayed i.e. 30 to 60 times
    per second.],

  [Image Type],
  [Best suited for detailed and complex images such as photographs, videos, and
    realistic graphics],
  [Works well for simple line drawings and geometric shapes],

  [Example],
  [TVs, computer monitors, and multimedia displays],
  [Pen Plotter, CAD (Computer-Aided Design) systems, oscilloscopes, and radar],

  // [Modification],
  // [While in raster scan, any alteration is not easy.],
  // [In random scan, any alteration is easy in comparison of raster scan.],
  //
  // [Line Drawings],
  // [While in which, for image or picture rendering, raster scan uses pixels. It is
  //   suitable for creating realistic scenes.],
  // [In random scan, mathematical function is used for image or picture rendering. It
  //   is suitable for applications requiring polygon drawings.],
)

== Raster vs Vector

#text(1em)[
  #table(
    columns: (50%, 50%),
    align: center,
    inset: 10pt,
    [RASTER], [VECTOR],
    [data is stored as a grid of pixels], [data is stored as paths],
    [Simple structure], [Complex structure],
    [Requires large storage], [Requires small storage],
    [Ideal for continuous data], [Better suited for continuous smooth lines],
    [cannot be scaled without quality loss], [can be scaled],
    // [Scan conversion is required], [Scan Conversion is not required],
    [Requires high computer processing power to access and manipulate the data.],
    [Does not require as much high-level processing power.],

    [.png, .jpg, .bmp, .tif], [.svg, .pdf],
  )
]
