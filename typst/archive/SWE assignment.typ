#import "@preview/oxdraw:0.1.0": *
#import "@preview/meander:0.3.0"
#import "@preview/zebraw:0.5.5": *
#import "snippets/frontpage.typ": index, starter

#starter[software engineering]
#set text(size: 1.2em)
#set par(justify: true)
#set heading(numbering: "1.1")
#set align(center)
#outline()
#set terms(separator: ":  ")
#set page(margin: auto, numbering: "1", columns: 1)
#set align(left)

#let img(path, ..args) = context {
  let path-label = label(path)
  let first-time = query((context {}).func()).len() == 0
  if first-time or query(path-label).len() > 0 {
    [#image(path, ..args)#path-label]
  } else {
    rect(width: 50%, height: 5em, fill: luma(235), stroke: 1pt)[
      #set align(center + horizon)
      Could not find #raw(path)
    ]
  }
}

= Model Selection

The choice of a software development model significantly impacts the success and
maintainability of an open-source navigation project. The two primary models to
consider are Waterfall and Agile.

== The Waterfall Model

The Waterfall model is a traditional, linear, and sequential approach where the
entire development process is divided into distinct, non-overlapping phases
(Requirements, Design, Implementation, Verification, Maintenance). Each phase must be
completed and signed off before the next phase can begin.

#figure(img("assets/waterfall.svg", width: auto), caption: [Waterfall Model])

Pros:
- / Simplicity and Structure: It is easy to understand, manage, and define clear
    milestones, making it suitable for projects with stable, clearly defined
    requirements and a predictable timeline.
- / Strong Documentation: Since all requirements and design decisions are finalized
    upfront, it enforces comprehensive documentation at the beginning of the project,
    which can be valuable for long-term knowledge transfer.
- / Predictable Budget: The fixed scope and sequence allow for more accurate upfront
    estimation of costs and deadlines.

Cons:
- / Lack of Flexibility: The model is highly rigid. Once a phase is completed, it is
    extremely difficult and costly to go back and modify requirements or designs,
    making it unsuitable for projects where user needs or technology are likely to
    evolve a certainty in navigation software.
- / Late Feedback: Users only see the final, fully built product late in the
    development cycle, which risks discovering major flaws or misinterpretations of
    the initial requirements too late to easily fix.
- / High Upfront Investment: A significant amount of time and resources must be spent
    defining everything at the start, potentially delaying the first usable release.

== The Agile Model

The Agile model is an iterative and incremental approach that focuses on flexibility,
collaboration, and the delivery of working software in short cycles (sprints). It
prioritizes customer (user/community) feedback and welcomes changes throughout the
development lifecycle.

#figure(img("assets/agile.svg", width: 80%), caption: [Agile Model])

Pros:
- / Adaptability and Flexibility: Agile embraces change and evolving requirements. It
    is perfectly suited for dynamic projects like open-source navigation, which need
    to constantly adapt to new map data, user needs, and routing algorithms.
- / Continuous Feedback and Integration: Working software is delivered frequently,
    allowing the user community to test and provide immediate feedback that can be
    incorporated into the very next iteration. This drastically reduces the risk of
    building the wrong product.
- / Community Alignment: The transparency and emphasis on collaboration in Agile
    strongly align with the decentralized, community-driven nature of open-source
    development, encouraging continuous contributions from a wide range of
    developers.
- / Faster Time to Market: Functioning, though incomplete, versions of the software
    are released quickly, providing early value to users and attracting further
    contributions.

Cons:
- / Less Predictable: The flexible nature can make defining a final scope and
    predicting the overall timeline and cost more challenging than in the Waterfall
    model.
- / Requires Active Collaboration: Agile demands constant communication and a high
    level of involvement from the project maintainers and core community, which can
    be difficult to manage in a purely volunteer-based open-source setting.
- / Documentation Risk: If not strictly managed, the focus on working software over
    comprehensive documentation can lead to a knowledge gap over time, particularly
    for volunteer developers who may join and leave the project.

== Conclusion

For building an open-source navigation software, the Agile Model is overwhelmingly
the most suitable choice. The inherent need for continuous updates (due to map
changes), constant feature requests, and reliance on decentralized community feedback
makes the rigid, sequential Waterfall model unworkable. The iterative, flexible
nature of Agile is essential for attracting and retaining an active contributor base
and ensuring the navigation software can rapidly evolve and remain relevant in a
dynamic technological environment.

= Maintainability of the Product

The long-term maintainability of a navigation software is fundamentally tied to its
architectural clarity and community engagement. Since the project relies on external,
constantly evolving data (OpenStreetMap) and external services (OSRM),
maintainability requires a modular design that isolates the map display, the routing
service interaction, and the user interface. Using established, well-documented
technologies like Leaflet and OSRM reduces the burden on maintainers, as they are
backed by large communities. Furthermore, consistent code quality, comprehensive
inline documentation, and an organized contribution process are crucial. A
maintainable project is one where new volunteers can quickly understand the codebase,
identify where to fix bugs, and seamlessly integrate new features without breaking
existing functionality, thereby ensuring the software's longevity.

== Building tools

Selecting the right tools is crucial for efficiency, performance, and community
growth. For an open-source navigation project, the ideal tools should be robust, have
strong community support. The initial choice of Leaflet, OSRM, and OpenStreetMap is
excellent because they represent industry standards in the open-source mapping space.
Beyond these core components, the technology stack should favor lightweight,
well-documented libraries that have a low learning curve to maximize the pool of
potential contributors. Decisions should prioritize technologies that offer the best
balance between high performance for real-time routing and ease of integration with
the existing open-source ecosystem.

= Feasiblity Study

The main focus of this stage is to determine whether it would be financially and
technically feasible to develop the software. The feasibility study involves carrying
out several activities such as collection of basic information relating to the
software such as the different data items that would be input to the system, the
processing required to be carried out on these data, the output data required to be
produced by the system, as well as various constraints on the development.

The proposed project is the development of a software application designed to
calculate and visualize the optimal route between two geographic locations. This
study assesses the technical, operational, and financial viability of the project.
For the project we are building we will need the following:

- / Map Data: Road networks, Nodes, Edges, Speed limits
- / Map Tiles: For visual interaction
- / Geocoding: Converting text addresses into geographic coordinates
- / Pathfinding Algorithms: Implementation of graph traversal algorithms to determine
    the route
- / Heuristic Calculation: Adjusting the route based on weights such as speed limits
    and live traffic delays
- / ETA Calculation: Estimating arrival time based on distance and average
    speed/traffic flow
- / Turn-by-Turn Instructions: Text or voice commands

The project is Technically Feasible but might carry high financial risk due to API
costs and market saturation unless a specific niche like trucking, hiking, or indoor
navigation is targeted.

== Understanding the problem

It is necessary to first develop an overall understanding of what the customer
requires to be developed. For this, only the important requirements of the customer
need to be understood and the details of various requirements such as the screen
layouts required in the graphical user interface, specific formulas or algorithms
required for producing the required results, and the databases schema to be used are
ignored.

== Formulation of various possible strategies for solving the problem

In this activity, various possible high-level solution schemes to the problem are
determined. For example, solution in a client-server framework and a standalone
application framework may be explored.

== Evaluation of the different solution strategies

The different identified solution schemes are analysed to evaluate their benefits and
shortcomings. Such evaluation often requires making approximate estimates of the
resources required, cost of development, and development time required. The different
solutions are compared based on the estimations that have been worked out. Once the
best solution is identified, all activities in the later phases are carried out as
per this solution. At this stage, it may also be determined that none of the
solutions is feasible due to high cost, resource constraints, or some technical
reasons. This scenario would, of course, require the project to be abandoned.

For our Map Tiles, OpenStreetMap serves as the foundational data source for the
entire application. It is a community-driven, global map that provides the raw
geographic information, including the road network, points of interest, and map
features, which is essential for both rendering the map tiles and calculating
accurate routes. The map tiles are often sourced directly from the standard
OpenStreetMap tile servers or from a third-party tile provider that uses OSM data

= Requirement Analysis

The aim of the requirements analysis and specification phase is to understand the
exact requirements of the customer and to document them properly. This phase consists
of two distinct activities, namely requirements gathering, and requirements
specification.

== Requirements gathering

The goal of the requirements gathering activity is to collect all relevant
information regarding the software to be developed from the customer with a view to
clearly understand the requirements. For this, first requirements are gathered from
the customer and then the gathered requirements are analysed. The goal of the
requirements analysis activity is to weed out the incompleteness and inconsistencies
in these gathered requirements. Note that an inconsistent requirement is one in which
some part of the requirement contradicts some other part. On the other hand, an
incomplete requirement is one in which some parts of the actual requirements have
been omitted.

== Software Requirements specification (SRS)

After the requirement gathering and analysis activities are complete, the identified
requirements are documented. This document is called a software requirements
specification (SRS) document. The SRS document is written using end-user terminology.
This makes the SRS document understandable to the customer. Therefore,
understandability of the SRS document is an important issue. The SRS document
normally serves as a contract between the development team and the customer. Any
future dispute between the customer and the developers can be settled by examining
the SRS document. The SRS document is therefore an important document which must be
thoroughly understood by the development team, and reviewed jointly with the
customer. The SRS document not only forms the basis for carrying out all the
development activities, but several documents such as users’ manuals, system test
plan, etc. are prepared directly based on it. In Chapter 4, we examine the
requirements analysis activity and various issues involved in developing a good SRS
document in more detail.

= Routing Data

#figure(img("assets/data.svg"), caption: [data processing pipeline])

== Extraction process

The map data is updated everyday with a version of the planet file from the latest
OpenStreetMap data and is split into a number of pre-defined regions. This is done
using the Osmosis and osmium programs (Osmosis to download updates, Osmium to apply
them and split).

Polygonal boundaries are used for the splitting boundaries that are sometiems derived
and simplified from OSM data, sometimes just hand-drawn. The boundaries usually
follow country borders. The Osmium extract function keeps ways and multipolygon
relations that cross an extract border complete

== Polygon files

The .poly files that you can download reflect the exact clipping boundary that we use
in generating the extract, and can be used with programs like Osmosis, Osmium, or
Osmconvert to generate the extract from a larger file. The KML files are the same
data, just in different format.

== PBF files

The .osm.pbf data format is the common format for the exchange of raw OpenStreetMap
data. It is fast to read and write and can be directly processed by most programs
dealing with OSM data. Our .osm.pbf file is original OSM data and contains all data
and metadata available in OSM for the region; the only thing they don't contain is
history. The .osh.pbf format is for history files.

== Shape files

The .shp.zip files contain a number of shape layers. In contrast to the pbf files,
the shape files are not complete. The shape files have the same structure as shape
files we make to order, but the free files contain fewer layers, and are only
available for smaller areas. Whenever getting a new exctract for a region, we also
use the difference between the new extract and the previous one, so that users can
continuously update their own regional data instead of having to download the full
file.

= Backend architecture

The backend architecture is best designed such that the heavy lifting of pathfinding
is isolated from the application logic. The core consists of two primary services:
the OSRM Routing Engine and the Application API Layer. The OSRM engine is a
high-performance C++ service that holds the road network graph in memory and exposes
a raw HTTP endpoint for routing queries. It does not handle user authentication,
database storage, or business logic. This server accepts requests from client
applications on the website, validates coordinates, and then internally queries the
OSRM engine. This separation ensures that the routing engine remains purely focused
on calculating directions, while the application layer handles the of the user
interaction.

Before the routing engine can accept requests, raw map data must be processed into a
routable graph. Berlin was chosen here because of its small size and high
information. Setting up the server begins by downloading the raw OpenStreetMap (OSM)
data for Berlin. A reliable source is Geofabrik, which provides region-specific
extracts. This gives us berlin-latest.osm.pbf file, which is a compressed binary
protocol buffer format containing all nodes, ways, and relations for the city. OSRM
uses `profiles` (Lua scripts) to determine which ways are routable. For a standard
car routing app, the `car.lua` profile was used. This script defines speeds for
different road types and restrictions.

Next we run these three commands:

- / osrm-extract: Parses the .osm.pbf file using the `car.lua` profile to create a
    preliminary graph.
- / osrm-partition: recursively partitions the graph into cells to speed up the
    search algorithm.
- / osrm-customize: calculates the weights (travel times) for each cell. This process
    results in a set of .osrm files that the engine loads into RAM.

Once the data is prepared, the OSRM backend is deployed as a Docker container to
ensure consistency and ease of deployment. The container mounts the directory
containing the processed Berlin graph files. Executing the osrm-routed command,
specifying the algorithm (MLD) and the path to the graph data. By default, this
service listens on port 5000. Once running, this service provides endpoints like
/route, /nearest, and /table, but it is intended for internal network access rather
than public exposure.

== Setup script
#zebraw(
  lang: false,
  numbering-separator: true,
  raw(
    read("assets/start-backend.fish", encoding: "utf8").slice(0, -1),
    lang: "fish",
    block: true,
    tab-size: 2,
  ),
)

This fish shell script is an automated workflow written to launch a Dockerized Open
Source Routing Machine (OSRM) server specifically for the Berlin region. It manages
by first creating a working directory and checking for the presence of the raw Berlin
OpenStreetMap data, downloading it from Geofabrik via aria2c only if necessary. The
script then executes the OSRM data processing pipeline (extract, partition, and
customize) using the Multi-Level Dijkstra (MLD) algorithm and the standard car
profile, while employing conditional checks to skip these resource-intensive steps if
the generated graph files already exist. Finally, it mounts the processed data and
starts the osrm-routed HTTP server on localhost port 5000, effectively rendering the
Berlin map data ready for routing queries.

#figure(img("assets/server start.png"), caption: [logs of server starting up])

== Response
OSRM returns a JSON object containing waypoints (snapped to the nearest road) and
routes. The routes array contains the geometry and legs, which detail the specific
turn-by-turn maneuvers. The backend transforms this raw data into a clean JSON format
required by the frontend, adding estimated arrival times (ETA) before sending it back
to the client.

= Frontend

#figure(img("assets/frontend.svg", width: 85%), caption: [application structure])

#pagebreak()

== HTML

// #zebraw(
//   lang: false,
//   numbering-separator: true,
//   raw(
//     read("assets/index.html", encoding: "utf8").slice(0, -1),
//     lang: "html",
//     block: true,
//     tab-size: 2,
//   ),
// )

This HTML document serves as the frontend presentation layer or canvas for the
navigation application. The file includes viewport configuration so the map renders
correctly across different device sizes, particularly on mobile screens. The body of
the page is minimal, consisting almost entirely of a single division element
(`<div id="map"></div>`). This container is where the mapping library will put the
interactive map tiles, routes, and controls, effectively turning the entire web page
into a full-screen navigation interface.

The functionality of the application relies on two external libraries. Leaflet is
imported to provide the fundamental open-source mapping engine, which handles tile
rendering and user interaction like panning and zooming. Second, Leaflet Routing
Machine is included; this is the specific plugin that draws the route lines on the
map and generates the turn-by-turn text instructions, acting as the interface for the
OSRM backend. The document loads a local JavaScript file named `routing.js`. This is
the main part of the application. After loading the libraries, it is inside
`routing.js` that the map is actually initialized, the OSRM server endpoint is
configured, and the routing control is done.

== JavaScript

// #zebraw(
//   lang: false,
//   numbering-separator: true,
//   raw(
//     read("assets/routing.js", encoding: "utf8").slice(0, -1),
//     lang: "js",
//     block: true,
//     tab-size: 2,
//   ),
// )

This JavaScript code utilizes Leaflet, a popular open-source library for interactive
maps, to initialize a web-based mapping interface specifically tailored for a routing
and navigation context. The code sets up the initial map view, defines various map
styles called tile layers, distinguishes between background maps and data overlays,
and creates a user interface control that allows the user to toggle between these
different views.

The code begins by creating a map instance linked to an HTML element with the ID
`map`. The `.setView` method immediately centers the map on specific coordinates
`[52.517389, 13.395131]`, which corresponds to Berlin, Germany, at a zoom level
of 13. This zoom level is close enough to see street layouts and neighborhoods, which
is ideal for starting a navigation.

The core of the visualization relies on Tile Layers sets of images loaded from a
server to form the map background. The code defines four distinct base layers:
- / OSM: The default OpenStreetMap layer, useful for general orientation.
- / OSM Humanitarian: OSM tiles following Humanitarian OpenStreetMap style.
- / Stadia Smooth: A visually simplified map provided by Stadia Maps.
- / Berlin Satellite: It pulls high-resolution aerial imagery specifically for
    Berlin.

#grid(
  columns: 2,
  gutter: 10pt,
  figure(img("assets/map osm.png"), caption: [OSM]),
  figure(img("assets/map hot.png"), caption: [OSM Humanitarian]),

  figure(img("assets/map sat.png"), caption: [Satellite]),
  figure(img("assets/map stadia.png"), caption: [Stadia Smooth]),
)

The `L.Routing.control` introduces the actual engine of the application. While the
previous code set up the visual map, this snippet activates the routing logic,
allowing the application to calculate paths between coordinates, display turn-by-turn
instructions, and interactively modify the journey. The code creates an instance of
`L.Routing.control`, which is the core interface for navigation. Upon initialization,
it is immediately assigned two Waypoints: a starting point (`52.51, 13.395`) and a
destination (`52.52, 13.396`). These coordinates are hardcoded to initialize the map
with a pre-calculated route visible immediately when the page loads, ensuring the
user doesn't see an empty interface. This control also automatically generates a
text-based container, usually a box in the top-right corner listing the distance,
time, and specific turns required to travel between these points.

A critical configuration line here is `serviceUrl: document.baseURI + "route/v1"`. By
default, Leaflet Routing Machine connects to a public demo server to fetch data.
However, this line overrides that behavior to point to a local or custom-hosted
routing service we are running. `document.baseURI` fetches the current address of the
website, it then appends `"route/v1"`, which implies that the application is talking
to its own backend API to get directions. This suggests the application is
self-contained, likely running its own instance of the OSRM (Open Source Routing
Machine) engine, giving the developers control over the routing algorithm like
customizing it specifically for bike paths or restricted service roads.

The settings `routeWhileDragging: true` and `routeDragInterval: 100` are designed to
make the map feel responsive and modern. `routeWhileDragging` Allows the user to grab
the blue path line or a marker on the map and drag it to a different road. As they
drag, the route recalculates visually in real-time, rather than waiting for them to
drop the pin. `routeDragInterval` is a performance optimization. It creates a
"debounce" effect, ensuring the application only requests a new route calculation
every 100 milliseconds during a drag action. This prevents the browser and the server
from crashing due to thousands of requests being fired instantly while the user moves
the mouse.

The final block, `map.on("click", ...)` adds an event listener that changes how the
user interacts with the destination.
- When the user clicks anywhere on the map, the function executes
  `control.spliceWaypoints`.
- It targets the last waypoint in the list (`length - 1`).
- It removes 1 item (the current destination).
- It inserts `e.latlng` (the coordinates of the mouse click).
- The Result is that instead of adding a new stop to a multi-stop journey, this logic
  updates the destination.
- If the user clicks a new spot on the map, the route automatically recalculates from
  the original start point to this new clicked location.

= Features

#figure(img("assets/map feat range.png"), caption: [Long distance routing])

#grid(
  columns: 2,
  figure(img("assets/map phone hot.png", width: 75%), caption: [Running on phone 1]),
  figure(img("assets/map phone stadia.png", width: 75%), caption: [Running on phone
    2]),
)

#figure(img("assets/map feat 1 waypoint.png"), caption: [Navigating through another
  point])
#figure(img("assets/map feat 5 waypoint.png"), caption: [Navigating through multiple
  points])

= Conclusion

The development of this open-source navigation software demonstrates that building a
high-performance, cost-effective, and user-friendly routing alternative is not only
feasible but achievable through the strategic integration of existing
community-driven technologies. By conducting a thorough feasibility study and
requirement analysis, the project successfully transitioned from a theoretical
concept to a functional prototype capable of handling real-world routing scenarios
within the Berlin region.

An important factor in the success of this project was the adoption of the Agile
development model. Given the dynamic nature of mapping data and the necessity for
continuous iteration in open-source software, the rigid structure of the Waterfall
model would have proven detrimental. Agile allowed for a flexible development
lifecycle where user feedback and evolving technical constraints such as data
processing needs could be addressed in real-time. This approach ensured that the
software remained adaptable to changes in the OpenStreetMap ecosystem, facilitating a
development environment that encourages ongoing community contribution and
maintenance.

Technically, the project validates the efficacy of a decoupled architecture. By
isolating the backend "heavy lifting" from the frontend user interface, the system
achieves both high performance and maintainability.

- / The Backend: The implementation of the Open Source Routing Machine within a
    Dockerized environment proved to be a robust solution for pathfinding. By
    automating the data pipeline extracting, partitioning, and customizing raw
    `.osm.pbf` data the system efficiently transforms massive geographic datasets
    into routable graphs. This self-hosted approach mitigates the financial risks
    associated with expensive third-party routing APIs while maintaining full control
    over the routing algorithms and profiles.

- / The Frontend: The utilization of Leaflet.js and the Leaflet Routing Machine
    provided a responsive and intuitive user interface. The integration of features
    such as "route-while-dragging," mobile responsiveness, and multi-point navigation
    ensures that the user experience rivals that of proprietary navigation services.
    The modular code structure allows for easy switching between map tiles
    (Satellite, OSM, Stadia), catering to different user preferences.

Ultimately, this project serves as a basis for scalable open-source navigation. It
addresses the critical challenges of maintainability by relying on industry-standard
tools and clear documentation. The result is a self-contained application that not
only solves the immediate problem of calculating optimal routes between coordinates
but also empowers a decentralized community of developers to expand its capabilities.
Whether for expanding into new geographic regions, optimizing for different travel
modes like cycling or hiking, or integrating complex traffic data, the architecture
established here provides the stability and flexibility required for future
innovation. The software stands as a proof of the power of open data and modular
software design in solving complex geospatial problems.

#pagebreak()

// #heading(numbering: none)[References]
= References

#v(20pt)

#let indent = 20pt
#let bibs = (
  (
    name: "OSRM",
    url: "https://project-osrm.org/",
    desc: "Modern C++ routing engine for shortest paths in road networks.",
  ),
  (
    name: "Leaflet",
    url: "https://leafletjs.com/",
    desc: "Leaflet is the open-source JavaScript library for interactive maps.",
  ),
  (
    name: "Leaflet Routing Machine",
    url: "https://www.liedman.net/leaflet-routing-machine/",
    desc: "Leaflet Routing Machine is an easy, flexible and extensible way to add routing to a Leaflet map.",
  ),
  (
    name: "OpenStreetMap",
    url: "https://www.openstreetmap.org/about",
    desc: "OpenStreetMap is built by a community of mappers that contribute and maintain data about roads, trails, cafés, railway stations, and much more, all over the world.",
  ),
  (
    name: "OpenStreetMap Wiki",
    url: "https://wiki.openstreetmap.org/wiki/Main_Page",
    desc: "The OpenStreetMap Wiki is a place for help documentation, technical documentation and promotional material on everything related to the OpenStreetMap project.",
  ),
  (
    name: "Geofabrik",
    url: "https://www.geofabrik.de/",
    desc: "Free, community-maintained map data like that produced by the OpenStreetMap project.",
  ),
)

#for (i, bib) in bibs.enumerate(start: 1) [
  [#i] *#bib.name*, #bib.url \
  #par(first-line-indent: indent, hanging-indent: indent, bib.desc) \
]
