---
layout: default
permalink: /projects/perfectly_normal_spaces/
---
[**Back**](../)

# [**Source Code**](https://github.com/ryanmaguire/perfectly_normal_spaces/)

# Perfectly Normal Spaces
A perfectly normal topological space is one where
disjoint closed sets can be precisely separated by
a continuous function. That is, there is a continuous
function from the topological space to the closed
unit interval such that the fiber of 0 is the first
closed set, and the fiber of 1 is the second closed set.

All metrizable spaces are perfectly normal, the
*dist* function provides a means of explicitly writing
down the separating function. So, in particular, the
Euclidean plane with the standard Euclidean metric is
perfectly normal.

Given two disjoint closed polygonal
figures we can apply the separating function to the
plane and get a visual as to what it may look like.
We do this by coloring a point *(x, y)* in the plane
a color between red and blue based on the value of the
function. The first closed polygonal figure is precisely
red, and the second closed polygonal figure is precisely
blue. The colors vary continuously across the plane, giving
a rainbow gradient.

Tools for generating rasterized images of this function
are provided for any collection of disjoint polygonal
figures.

Below is an example depicting two closed sets that are each the finite union
of closed polygonal regions. The characters spell out potato, or *tu dou*,
in simplified Chinese (a running joke from my topology course).

![Perfectly Normal Space](https://math.dartmouth.edu/~rmaguire/projects/perfectly_normal_spaces/potato.png "Perfectly Normal Space")
