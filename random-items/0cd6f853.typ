#import "@preview/physica:0.9.7": *

$x^2 - x y + x z - 2x - 3y^2 - 3y z +2y - z^2 - 3z = 0$

Point: $(2,2,2)$

For $pdv(z, x)$:
$
                         x^2 - x y + x z - 2x - 3y^2 - 3y z +2y - z^2 - 3z & = 0 \
              pdv(, x) (x^2 - x y + x z - 2x - 3y^2 - 3y z +2y - z^2 - 3z) & = 0 \
  2x - y + z + x pdv(z, x) - 2 - 3y pdv(z, x) - 2z pdv(z, x) - 3 pdv(z, x) & = 0 \
                                               (x - 3y - 2z - 3) pdv(z, x) & = -2x + y - z + 2 \
                                               (3y + 2z + 3 - x) pdv(z, x) & = 2x - y + z - 2 \
                                                                 pdv(z, x) & = (2x - y + z - 2) / (3y + 2z + 3 - x) \
$

At point (2,2,2):
$ pdv(z, x) = (4 - 2 + 2 - 2) / (6 + 4 + 3 - 2) = 2/11 $

For $pdv(z, y)$:
$
                           x^2 - x y + x z - 2x - 3y^2 - 3y z +2y - z^2 - 3z & = 0 \
                pdv(, y) (x^2 - x y + x z - 2x - 3y^2 - 3y z +2y - z^2 - 3z) & = 0 \
  -x + x pdv(z, y) - 6y - 3z - 3y pdv(z, y) + 2 - 2z pdv(z, y) - 3 pdv(z, y) & = 0 \
                                               - pdv(z, y) (3y + 2z + 3 - x) & = x + 6y + 3z - 2 \
                                                                   pdv(z, y) & = - (x + 6y + 3z - 2) / (3y + 2z + 3 - x) \
$

At point (2,2,2):
$ pdv(z, y) = - (2 + 12 + 6 - 2) / (6 + 4 + 3 - 2) = - 18/11 $
