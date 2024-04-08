---
layout: default
permalink: /projects/newton_fractals/
---
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
[**Back**](../)

# [**Source Code**](https://github.com/ryanmaguire/newton_fractals/)

## **Table of Contents**
1. [Newton Fractals](#nf)

## **Newton Fractals** <a name="nf"></a>
This project renders Newton fractals. Given a complex polynomial
$$p:\mathbb{C}\rightarrow\mathbb{C}$$ and a point $$z_{0}\in\mathbb{C}$$
you can apply Newton's method to this point and see if it converges to a root.
Newton's method is iterative. It defines:
\begin{equation}
    z_{n+1}=z_{n}-\frac{p(z_{n})}{p'(z_{n})}
\end{equation}
You may then ask *if this converges, to which root does it converge?* If there
are $$N$$ distinct roots, you can choose $$N$$ colors corresponding to each
and color $$z_{0}$$ based on which point Newton's method converges to. (If it
didn't converge, color it black. This is the Julia set of the Newton fractal).

The Newton fractal for $$p(z)=z^{3}-1$$ is given below.

![Newton Fractal](https://math.dartmouth.edu/~rmaguire/projects/newton_fractals/newton_fractal_z_cubed_minus_one.png "Newton Fractal")
