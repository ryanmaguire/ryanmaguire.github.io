---
layout: default
---
Hello! My name is Ryan Maguire, I am a Ph.D. student at Dartmouth college
studying mathematics. My current interests are topology, geometry,
and set theory. My topological interests include knot theory, manifolds,
and continua theory (the study of compact connected metric spaces).
In particular I've recently developed a fascination with problems in planar
topology and the pathologies therein
(the [pseudo-arc](https://en.wikipedia.org/wiki/Pseudo-arc) and
[lakes of Wada](https://en.wikipedia.org/wiki/Lakes_of_Wada) are exotic
examples). In geometry I study Lorentzian manifolds and their
applications to general relativity. Apart from that I have a personal interest
in ZFC set theory and attempting to rigorously build mathematics from these
foundations.
<br /><br />
In the past I studied mathematics and physics at the University of
Massachusetts, Lowell, obtaining a B.S. in mathematics and physics and an M.S.
in mathematics. I primarily studied analysis, Euclidean geometry, and
convex geometry. While there I spent five years working at the center
for atmospheric research (CAR), later renamed the Lowell center for science and
space technology (LoCSST). Here I worked on DWEL, a botanical experiment
involving LIDAR, and HiT&MIS, a spectrograph which was deployed in Kiruna,
Sweden to study the aurora. I also participated in the analysis of data from the
SPINR sounding rocket mission and performed daily laboratory tasks such as
changing out oxygen tanks. My main contribution being HiT&MIS,
and both of the instruments we built are quite special to me.
<br /><br />
After Lowell I worked at the Whitin observatory at Wellesley College for two
years with NASA's radio science team for the Cassini mission. I studied more
analysis, including Fourier analysis, numerical methods, mathematical physics,
and iterative methods of solving Fredholm integral equations. These efforts
culminated in `rss_ringoccs` which is a free and open source suite of code
written in C and Python for processing the occultation data obtained from
Cassini. Here I learned a lot about computer science and the C programming
language and also began to obsess over visualizing mathematics.
<br /><br />
After departing from Wellesley I entered into a Ph.D. program at Dartmouth, and
that's where I am now. My current goals involve programming projects I've
been working on. There are two main ones.
<br /><br />
[libtmpl](https://github.com/ryanmaguire/libtmpl) is an open source
library of code for mathematicians and physicists in a variety of situations.
It features a (nearly complete) cross-platform implementation of the current
standard of `libm`, the C standard library for mathematical functions, with
functions available for 32-bit float, 64-bit double, 80-bit extended precision,
128-bit quadruple, and 128-bit double-double
(as mentioned it has cross-platform support). It is very portable, compiling
with GCC, LLVM's Clang, TCC, PCC, and Microsoft's MSVC, supporting all major
operating systems (GNU/Linux, FreeBSD, macOS, Microsoft Windows, Haiku OS, etc.)
and architectures (x86, x64, arm64, mips, powerpc, and more). This project
started with `rss_ringoccs` but grew far beyond the scope of astonomy. It
contains a cross-platform implementation of complex numbers, 2D and 3D geometry,
Fourier transforms, and much more. You'll find the performance of the algorithms
rival other libraries. All functions have tests, when possible, against other
implementations (like Boost, glibc, openlibm, etc.).
<br /><br />
[Mathematics-and-Physics](https://github.com/ryanmaguire/Mathematics-and-Physics)
is another library I've been working on since around 2017.
It is a repository of notes on
many areas of mathematics and physics that are ordered in an attempt at being
consistent. The aim is to mimic the styling of Euclid's elements which is
*theorem, definition, proof*, but also add a lot of discussion and images so
that one may easily learn from it. This project is very much still in it's
infancy, but already has 1000+ pages and several hundred figures. The codes for
these figures are written in C, asymptote, and tikz
(though I intend to start phasing out the tikz code for the more powerful
asymptote methods). This repository also contains my class notes, presentations,
and *mini-projects* that are usually devoted to raytracing, rendering fractals,
and visualizing mathematics. All of it is freely available under the GPLv3.
<br /><br />
Here's me at the top of Mount Mansfield in Vermont.
![Me](https://ryanmaguire.github.io/assets/ryan.jpg "Me")
