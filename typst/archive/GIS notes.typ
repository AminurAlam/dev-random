#import "snippets/note.typ": *
#show: template.with("GIS")

#pagebreak()

= 1.1 IMAGE CLASSIFICATION

The analysis of remote sensing imagery involves the identification of various targets
in an image, and those targets and assigning land cover classes to pixels. For
example, classes include water, urban, forest, agriculture, and grassland

Interpreters study remotely sensed data and attempt through logical processes in
detecting, identifying, classifying, measuring and evaluating the significance of
physical and cultural object, their patterns and spatial relationships.

TYPES OF CLASSIFICATIONS:

+ / Supervised image classification: In a supervised classification information
    classes are first identified, which are then used to determine the spectral
    classes and classify the image for land use/land cover.
+ / Unsupervised image classification: Unsupervised learning is a type of machine
    learning where the algorithm learns patterns from unlabeled data, and the image
    is classified based on the spectral variations.
+ / Deep learning object detection: sophisticated ML algo to distinguish objects

ELEMENTS OF VISUAL INTERPRETATION:

The most basic of these principles are the elements of image interpretation. Some of
these elements are interconnected and are classified into three orders:
+ / First order or Basic: Color, Tone
+ / Second order: Texture, shape, size, pattern
+ / Third order: Location, Association, Shadow and Height

/ Tone: relative brightness or colour of objects in an image
/ Shape: general form, structure, or outline of individual objects. Shape can be a
  very distinctive clue for interpretation
/ Pattern: spatial arrangement of visibly discernible objects. a repetition of
  similar tones and textures will produce a distinctive and ultimately recognizable
  pattern
/ Texture: arrangement and frequency of tonal variation in particular areas of an
  image. in rough textures the grey levels change abruptly in a small area, whereas
  smooth textures have very little tonal variation. Smooth textures are most often
  the result of fields, roads, or grasslands. A rough surface is often a forest or
  mountain ranges
/ Shadow: is also helpful as it may provide an idea of the profile and relative
  height of a target which may make identification easier. Shadow is also useful for
  enhancing or identifying topography and landforms, particularly in radar imagery
/ Association: takes into account the relationship between other recognizable objects
  or features in proximity to the target of interest. The identification of features
  that one would expect to associate with other features may provide information to
  facilitate identification. residential areas would be associated with schools,
  playgrounds, and sports fields.

#table(
  columns: 2,

  [COLOR], [TONE],
  img("assets/colvar.png", width: auto), img("assets/tonevar.png", width: auto),
)

#table(
  columns: 2,

  [SHAPE], [SIZE],
  img("assets/shapevis.png", width: auto), img("assets/sizevis.png", width: auto),

  [TEXTURE], [PATTERN],
  img("assets/texture.png", width: auto), img("assets/pattern.png", width: auto),
)

= 1.2 DATA VISUALIZATION [TODO]

#pagebreak()

= 1.3 REMOTE SENSING

Remote sensing is the detecting, monitoring and acquisition of information about an
area without making physical contact with the object, in contrast to on-site
observation. This is usually done by measuring its reflected and emitted radiation.
The term is usually applied to acquiring information about Earth and other planets.

Remote sensing is used in numerous fields, including geophysics, geography, land
surveying and most Earth science disciplines like ecology, meteorology, geology. It
also has military, intelligence, commercial, economic, planning, and humanitarian
applications, among others.

In current usage, the term remote sensing generally refers to the use of satellite-
or airborne-based sensor technologies to detect and classify objects on Earth. It
includes the surface and the atmosphere and oceans, based on propagated signals (e.g.
electromagnetic radiation). It may be split into "active" remote sensing (when a
signal is emitted by a sensor mounted on a satellite or aircraft to the object and
its reflection is detected by the sensor) and "passive" remote sensing (when the
reflection of sunlight is detected by the sensor)

APPLICATIONS:
- agriculture
  - Crop Health Monitoring
  - Soil Moisture Mapping
- environment/whether
  - Deforestation Tracking
  - Air Quality Monitoring
  - meteorological data
  - measure the concentration of various chemicals in the atmosphere
  - Vegetation remote sensing
- urban planning
  - zoning laws
  - infrastructure planning
  - Traffic Management
- misc
  - air traffic control
  - cartography
  - make topographic maps
  - produce precise digital elevation models of large scale terrain
  - weapon ranging, homing of projectiles
- Before Disaster
  - Avoiding prone areas
  - Monitoring
  - Forecasting
  - Risk Modeling
- After Disaster
  - Damage Assessment
  - Preparing response plan
  - Search and rescue operation
- Mining and Mineral Exploration
  - identifying specific mineral signatures on the Earth's surface.

= 1.4 DATA ACQUISITION?

#pagebreak()

= 2.1 THERMAL SENSORS

Thermal sensors are powerful tools in the world of Geographic Information Systems
(GIS) and Remote Sensing. While our eyes see the world using visible light from the
sun, these technologies allow us to see the world through heat. This capability is
critical for studying the environment, as it reveals information that is completely
invisible to the naked eye.

Thermal sensors are specialized instruments designed to detect infrared radiation,
which we experience as heat. They are like thermometers that works from a distance
without ever touching the object it is measuring. Unlike a standard camera that
captures light bouncing off an object, a thermal sensor captures the energy that an
object naturally emits. These sensors are mounted on various platforms, such as
satellites in space, airplanes, drones, or even handheld devices. Inside the sensor,
special detectors react to incoming heat energy and convert it into electrical
signals that computers can understand.

THERMAL SENSING

Thermal sensing is a "passive" system. This means the sensor does not send out a
signal like a radar or flash, it simply waits and "listens" or collects the energy
that is naturally naturally coming from the Earth. This allows thermal sensing to
work just as well in pitch-black darkness as it does in bright sunlight. There are
two distinct advantages to this process in Remote Sensing:
/ Nighttime Capability: Since thermal sensors do not need sunlight to work, they can
  capture images in total darkness. The Earth still radiates the heat it absorbed
  during the day even after the sun goes down.
/ Seeing Through Smoke: Visible light is often blocked by thick smoke. Thermal
  energy, however, can pass through smoke more easily. This allows scientists to see
  exactly where a forest fire is burning on the ground, even if the area is covered
  in a cloud of smoke.

THERMAL IMAGING

Once the sensors collect the data, it is processed into a visual format known as a
thermal image or thermogram. Since humans cannot see infrared heat, computer software
assigns false colors to the different temperature values to create a picture we can
understand. Usually, cool areas might be colored blue or purple, while warmer areas
appear yellow, orange, or red. This creates a map where color equals temperature. For
example, in a thermal image of a forest at night, the trees might look blue (cool),
while a person walking underneath them would glow bright orange (warm).

APPLICATIONS IN GIS AND REMOTE SENSING

In a GIS environment, thermal images become data layers. We can stack a thermal map
on top of a street map or a vegetation map to solve real-world problems. Here are the
most common uses:

/ Urban Heat Islands: Planners use thermal imaging to see which parts of a city are
  trapping dangerous amounts of heat. Concrete and asphalt glow "hot" in these
  images, helping cities decide where to plant more trees to cool neighborhoods down.
/ Agriculture: Farmers use thermal sensing to check crop health. Plants cool
  themselves by releasing water vapor (transpiring). If a plant is dehydrated or
  sick, it stops releasing water and its temperature rises. A thermal sensor can
  detect this rise in crop temperature even before the leaves start to visibly wither
  out, allowing farmers to water only the stressed areas.
/ Disaster Management: during forest fires, smoke often blocks the view for normal
  cameras. Thermal sensors can see right through the smoke to locate the hottest
  active fire lines, helping firefighters direct their efforts safely.
/ Water Quality: Factories or power plants sometimes dump warm water into rivers.
  This creates "thermal pollution" which can kill fish. Satellites can detect these
  plumes of warm water in a river or ocean, helping environmental agencies enforce
  laws.
/ Geology and Mineral Exploration: Geologists use thermal bands to identify what
  types of rocks are on the ground. Different rocks absorb and release heat
  differently (this is called "thermal inertia"). Silica-rich rocks (like quartz)
  might look different thermally than iron-rich rocks. This helps create geological
  maps that identify potential mining sites or areas prone to landslides without
  needing to physically walk over every square mile.

By using thermal technologies, scientists and analysts can gather crucial data about
the Earth's physical properties. Whether it is monitoring active volcanoes, detecting
water pollution (which often has a different temperature than the surrounding river),
or checking the insulation on a building, thermal sensing and imaging provide a
unique "heat-vision" layer to our understanding of the planet.

#pagebreak()

= 2.2 MULTISPECTRAL & HYPERSPECTRAL IMAGES

A multispectral image is a type of digital imagery that captures light data at
specific frequencies across the electromagnetic spectrum. Unlike a standard
photograph, which only records visible light in the red, green, and blue (RGB)
wavelengths, multispectral sensors detect energy in both visible and invisible
regions, such as infrared, and thermal infrared. By capturing these discrete bands of
light, the image provides much more information about the physical properties of the
objects being observed than the human eye can perceive.

For example, healthy vegetation reflects a high amount of near-infrared light while
absorbing most visible red light for photosynthesis. By comparing the intensity of
light captured in these different bands, experts can identify land cover types,
monitor crop health, and detect environmental changes that are invisible to the naked
eye.

/ Spectral Bands: Most multispectral sensors capture between 3 and 15 distinct bands.
  Common bands include Red, Green, Blue, Near-Infrared (NIR), and Short-Wave Infrared
  (SWIR).
/ Spectral Resolution: This refers to the width and number of the spectral bands.
  Finer spectral resolution allows for better differentiation between similar
  materials.
/ False-Color Composites: Since humans cannot see infrared light, multispectral data
  is often visualized by mapping invisible bands (like NIR) to visible colors (like
  Red) to create "false-color" images that highlight specific features like
  vegetation or water.
/ Data Structure: Each pixel in a multispectral image contains a stack of values, one
  for each band, creating a multi-layered data cube that can be processed using
  mathematical algorithms.

USAGE: see THERMAL SENSOR > APPLICATIONS for details

#figure(img("assets/multi.png", width: auto))

A hyperspectral image is a highly detailed form of digital imagery that captures
light data across hundreds of narrow spectral bands. While a multispectral sensor
captures a handful of wider bands, a hyperspectral sensor records a nearly complete,
unbroken spectrum for every single pixel in the image.

Hyperspectral imaging can detect "spectral signatures" that act as a fingerprint for
different things. Because the bands are so narrow and numerous (100-500), the sensor
can capture subtle spectral variations that are completely invisible to other
sensors. While a multispectral image might identify an area as "green vegetation", a
hyperspectral image can distinguish between specific tree species or even identify
the specific mineral composition of the soil.

/ Continuous Bands: Unlike multispectral sensors that have gaps between bands,
  hyperspectral sensors capture a continuous range of wavelengths, ensuring no data
  is lost between measured frequencies.
/ High Spectral Resolution: Bands are typically very narrow, often less than 10 nm
  wide, which allows for extremely fine distinction between similar materials.
/ Material Identification: Because it captures a full spectrum, it is used for
  "unmixing" pixels calculating the exact percentage of different materials (like
  water, minerals, or vegetation) contained within a single pixel.

Hyperspectral imaging is used in highly specialized fields where precise material
classification is critical:
/ Geology: Mapping specific ore deposits.
/ Agriculture: Detecting the exact chemical concentrations in leaves, and identifying
  specific pest infestations before symptoms are visible to the eye.
/ Environment: Monitoring water quality by identifying specific algae types,
  measuring chemical pollutants, and tracking the health of coral reefs.
/ Pollution: Analyzing chemicals in atmosphere.

Despite its capabilities, hyperspectral imaging is significantly more complex than
multispectral imaging. The massive volume of data generated (often gigabytes or
terabytes for a single flight) requires specialized software, high-performance
computing, and expert knowledge to process and interpret. Because of these demands
and the high cost of the sensors, hyperspectral data is typically used for targeted
scientific research and high-stakes industrial applications rather than
general-purpose mapping.

#figure(img("assets/hyper.png", width: auto))

#pagebreak()

= 2.3 OVERLAY SPECTRUM/FUNCTIONS?
Mapping overlays is the process of layering different maps on top of each other to
analyze how different types of geographic data relate to each other.

Mapping overlays in GIS work like stacking layers on top of each other. Each layer
represents a different data type, such as roads, rivers, or population. By placing
these layers together, we can see how different features interact in the same space.
For example, overlaying a pollution layer with a population layer shows where health
risks might be higher. Overlays can also show changes over time. So, they’re helpful
ways to analyze geographic data and improve decision-making.

#table(
  columns: 2,
  align: bottom,
  gutter: 0pt,
  figure(img("assets/Intersect-Tool.png", width: auto), caption: [intersection]),
  figure(img("assets/Merge-Tool.png", width: auto), caption: [merge]),

  figure(img("assets/Erase-Tool.jpg", width: auto), caption: [erase]),
  figure(img("assets/Clip-Tool.png", width: auto), caption: [clip]),

  figure(img("assets/Union-Tool.jpg", width: auto), caption: [union]),
  figure(img("assets/Dissolve-Tool.png", width: auto), caption: [dissolve]),
)

#pagebreak()

= DIGITAL IMAGE PROCESSING SYSTEM STEPS

#figure(img("assets/imgproc.png", width: auto))

/ Image Acquisition: In this step, the image is captured by a sensor (such as a
  monochrome or color camera) and digitized, if the output of the camera or sensor is
  not already in digital form using an analog-to-digital converter (ADC) to digitizes
  it. sensor can be:
  - single imaging sensor
  - line sensor
  - array sensor

/ Preprocessing: It deals with improving the appearance of an image. It is the
  process of manipulating an image so that the result is more suitable than the
  original for specific applications. Enhancement techniques are so varied, and use
  many different image processing approaches. includes:
  - noise removal
  - cropping
  - color correction

/ Image Compression: It deals with techniques reducing the storage required to save
  an image, or the bandwidth required to transmit it over the network. It has to
  major approaches:
  + Lossless Compression
  + Lossy Compression

/ Morphological Processing: Morphological Processing are the tools for extracting
  image components that are useful in the representation and description of shape.

/ Image Segmentation: Segmentation procedures partition an image into its constituent
  parts or objects. Computer tries to separate objects from the image background. It
  is one of the most difficult tasks in DIP. Segmentation kinds:
  - Autonomous Segmentation.
  - Rugged Segmentation (long process to get successful solution).
  - Erratic Segmentation.

/ Representation: Make a decision whether the data should be represented as a
  boundary or as a complete region. It is almost always follows the output of a
  segmentation stage. Choosing a representation is only part of the solution for
  transforming raw data into a form suitable for subsequent computer processing
  (mainly recognition).
  / Boundary Representation: Focus on external shape characteristics, such as corners
    and inflections.
  / Region Representation: Focus on internal properties, such as texture or skeleton
    shape.

/ Description: also called, feature selection, deals with extracting attributes that
  result in some information of interest.

/ Recognition: It is a process of classification or trying to distinguish an object
  by its characteristics or patterns which are familiar on the image. It preceded the
  process of detection. Sometimes it is also termed as photo reading e.g. vegetation,
  water bodies, built-up land etc.

/ Knowledge Base: Knowledge about a problem domain is coded into an image processing
  system in the form of a knowledge database.

  Knowledge about a problem domain is coded into an image processing system in the
  form of a knowledge base. This knowledge may be as simple as detailing regions of
  an image where the information of the interest in known to be located. Thus
  limiting search that has to be conducted in seeking the information.

  The knowledge base also can be quite complex such interrelated list of all major
  possible defects in a materials inspection problems or an image database containing
  high resolution satellite images of a region in connection with change detection
  application

#pagebreak()

= DRAWING METHODS

== Raster

// definition
The raster data model, often referred to as bitmap, is composed of a regular grid of
cells in specific sequence known as pixels. Each cell within a grid contains specific
color information, and when these tiny squares are arranged closely together, they
form a cohesive image.

The conventional sequence is row by row which may start from the top left corner. In
this model, basic building block is the cell. The representation of the geographic
feature in this model is used by coordinate, and every location corresponds to a
cell. Each cell contains a single value and is independently addressed with the value
of an attribute. A raster image comprises a collection of grid cells rather like a
scanned map or photo.

// scaling images
One of the defining characteristics of raster images is that they are
resolution-dependent. This means they are created with a fixed number of pixels per
inch (PPI). Because the image is essentially a static map of colored squares, raster
images do not scale up well. If you attempt to enlarge a raster image significantly
beyond its original size, the software must create new pixels based on guesswork,
resulting in a phenomenon called pixelation. This causes the image to appear blocky,
jagged, or blurry, losing the sharp definition found in the original size.
Consequently, raster images are best used at the specific size for which they were
created or smaller.

Raster images are better for continuous-tone images, such as photographs. The
pixel-based grid allows for subtle gradations of color and complex shading that
vector images struggle to replicate. Because each pixel can be a different shade,
raster formats can display millions of colors, making them ideal for rendering the
real world. This is why all digital cameras and scanners capture data in raster
formats.

== Vector
Vector data model comprises discrete features. Features can be discrete locations or
events (points), lines, or areas (polygons). This model uses the geometric objects of
point, line and polygon. In vector model, the point is the fundamental object. Point
represents anything that can be described as a discrete x,y location (e.g. hospital,
temple, well). Line or polyline (sequence of lines) is created by connecting the
sequence of points. End points are usually called as nodes and the intermediate
points are termed as vertices. If we know the start and end node coordinates of each
line or polyline we can compute the length of line or polyline. These are used to
represent features that are linear in nature (e.g. stream, rail, road). Polygon is
defined in this model by a closed set of lines or polylines. Areas are often referred
to as polygons. A polygon can be represented by a sequence of nodes where the last
node is equal to the first node. Polygons or areas identified as closed set of lines
are used to define features such as rock type, land use, administration boundaries,
etc.

Vector data are also called shapefiles

== Raster vs Vector

#table(
  columns: 2,
  align(center)[RASTER], align(center)[VECTOR],

  [Simple structure; data is stored as a grid of pixels or cells, where each cell
    represents a digital value. It is difficult to represent topological
    relationships (how features connect).],
  [Complex structure; data is stored as points/lines/polygons and is often
    relational.],

  [Requires a relatively large amount of storage space because every cell in the grid
    must hold a value.],
  [Requires relatively small storage space as it only stores the coordinates of
    specific features.],

  [The process of converting data is generally slow.],
  [The process of converting data is generally fast.],

  [Requires high computer processing power to access and manipulate the data.],
  [Does not require as much high-level processing power.],

  [Ideal for continuous data (like elevation, temperature, soil type) and simple
    multi-layer combinations. It is faster for simple analyses.],
  [Better suited for complex spatial analysis, particularly for networks (like road
    routing, boundaries) and complex overlays.],

  [Accuracy depends on cell size. Since location is represented by the center of a
    cell, it cannot accurately show more than one feature within a single cell.
    However, it represents high spatial variability (like elevation changes) well.],
  [Provides high spatial accuracy because features are represented discretely.
    Representation of features remains accurate even at a large scale.],

  [Excellent for displaying images (like satellite photos), but poor for representing
    discrete data, networks, or smooth, precise boundaries.],
  [Excellent for producing various kinds of traditional maps, but poor for
    representing continuous data.],
)

#pagebreak()

= IMAGE

== Images (Binary, Colour & Grayscale) [TODO]
== Images (Electro-Magnetic Spectrum) [TODO]

== Image Resolution [TODO]

== Spatial Resolution // https://engineerfix.com/what-is-spatial-resolution-and-how-is-it-measured/

spatial resolution refers to distance between independent measurements, or the
physical dimension that represents a pixel of the image.

Spatial resolution is defined as a measure of the smallest object that can be
resolved by a sensor or the linear dimension on the ground corresponding to each
pixel

For displays and printed media, spatial resolution is commonly quantified using
pixels per inch (PPI) or dots per inch (DPI). PPI refers to the density of individual
light-emitting elements on a screen, determining how smoothly curves and fine lines
appear to the viewer. DPI is a measure specific to printers, indicating the number of
discrete ink dots a device can place within a linear inch on paper. Higher values for
both metrics translate directly to a visually sharper and more detailed output,
particularly when viewed at close range.

When dealing with remote sensing, such as imagery captured by satellites or aerial
drones, the concept of Ground Sample Distance (GSD) becomes the standard metric. GSD
defines the physical distance on the ground that is represented by a single pixel in
the captured image. It is a direct measurement of the sensor’s footprint on the
Earth’s surface, usually measured in centimeters or meters.

Spatial resolution represents a system's capacity to differentiate between small
objects or features in a captured image or sensed data. This characteristic directly
influences the clarity and fidelity of the resulting output.

#pagebreak()

= PIXEL RELATIONSHIPS [TODO] // https://www.uomustansiriyah.edu.iq/media/lectures/5/5_2024_11_20!07_58_11_PM.pdf

== Neighbors

#let n4 = [N#sub[4]\(p\)]
#let nd = [N#sub[D]\(p\)]
#let n8 = [N#sub[8]\(p\)]

+ / 4-neighborhood: #n4 = (x+1, y), (x-1, y), (x, y+1) (x, y-1)
+ / 4-Diagonal-neighborhood: #nd = (x+1, y+1), (x+1, y-1), (x-1, y+1) (x-1, y-1)
+ / 8-neighborhood: #n8 = #n4 $union$ #nd

== Adjacency

Let V be the set of intensity values,Two pixels p and q with values from V are
m-adjacent if:
+ q is in #n4, or
+ q is in #nd and the set #n4 $inter$ N#sub[4]\(q\) has no pixels whose values are
  from V.

== Connectivity
== Paths
== Regions and boundaries

#pagebreak()

= ELECTRO MAGNETIC SPECTRUM [TODO]
/ visible range: $0.4 mu m - 0.7 mu m$

MAJOR USES:
- / Gamma-ray imaging: nuclear medicine and astronomical observations
- / X-rays: medical diagnostics, industry, and astronomy, etc.
- / Ultraviolet: lithography, industrial inspection, microscopy, lasers, biological
    imaging, and astronomical observations
- / Visible and infrared bands: light microscopy, astronomy, remote sensing,
    industry, and law enforcement
- / Microwave band: radar
- / Radio band: medicine (such as MRI) and astronomy

#pagebreak()

= SATELLITES / RS PLATFORMS

Remote sensing platforms are the vehicles that carry remote sensors, allowing them to
collect data from a distance. There are three main types of platforms in remote
sensing, each with its unique characteristics and capabilities. In this article,
we’ll take a closer look at these three types of platforms and their applications.

Remote sensing platforms include ground-based (tripods and towers), aerial (manned
aircraft and unmanned aerial vehicles), and satellite platforms, which facilitate
data collection from Earth’s surface, atmosphere, and oceans.

Remote sensing is a powerful tool used to acquire information about the Earth’s
surface, atmosphere, and oceans without direct physical contact. This process relies
on various carriers, known as platforms, sensors to capture and record data from a
distance.

/ 1. Airborne Platforms: Airborne platforms are remote sensing vehicles that operate
  in the Earth’s atmosphere. These include airplanes, helicopters, and drones.
  Airborne platforms are ideal for capturing high-resolution images and data over
  small areas. They are commonly used for aerial photography, surveying, and mapping.
  / Manned Aircraft: Manned platforms are piloted aircraft that require a human
    operator. They are used for capturing high-quality imagery and data over large
    areas. Manned platforms are ideal for capturing aerial photographs for mapping
    purposes. They are also used for surveillance and reconnaissance.
  / Unmanned Aerial Vehicles (UAVs): Unmanned aerial vehicles (UAVs), also known as
    drones, are becoming increasingly popular for remote sensing applications. UAVs
    can be used to capture high-resolution images and data at low altitudes, making
    them useful for a wide range of applications. UAVs are particularly useful for
    applications that require frequent monitoring or that involve hazardous or
    difficult-to-reach areas.

/ 2. Ground Borne Platforms: Ground platforms are remote sensing vehicles that
  operate on the Earth’s surface. These include vehicles such as trucks, boats, and
  buoys. Ground platforms are used for capturing data from close proximity to the
  Earth’s surface. They are commonly used for monitoring soil moisture, ocean
  currents, and vegetation growth.
  / Ground-Based Laser Scanning (LiDAR): Ground-based laser scanning, also known as
    LiDAR, is a remote sensing technique that uses laser pulses to measure distances
    between the sensor and the Earth’s surface. LiDAR can be used to create highly
    accurate 3D models of the Earth’s surface.
  / Terrestrial Photogrammetry: Terrestrial photogrammetry is a remote sensing
    technique that uses photographs taken from the ground to create 3D models of the
    Earth’s surface. Terrestrial photogrammetry can be used to create highly accurate
    models of the Earth’s surface, and can be used for a wide range of applications,
    including land surveying, construction, and urban planning.

/ 3. Space Borne Platforms: Space platforms are remote sensing vehicles that operate
  in space. These include satellites, which are the most commonly used space
  platforms for remote sensing. Satellites are used for capturing data from a global
  perspective, allowing us to monitor changes in the Earth’s atmosphere, oceans, and
  land. They are also used for disaster management and national security.
  / Low-Earth Orbit Platforms: Low-Earth orbit platforms are satellites that orbit
    the Earth at an altitude of less than 2000 km. They are used for capturing
    high-resolution imagery and data over small areas. Low-Earth orbit platforms are
    commonly used for monitoring weather patterns, tracking wildfires, and studying
    the Earth’s surface.
  / Geostationary Orbit Platforms: Geostationary orbit platforms are satellites that
    orbit the Earth at an altitude of approximately 36,000 km. They are used for
    capturing data from a global perspective, allowing us to monitor changes in the
    Earth’s atmosphere, oceans, and land. Geostationary orbit platforms are commonly
    used for weather forecasting and climate monitoring.
