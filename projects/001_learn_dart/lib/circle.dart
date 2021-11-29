import 'dart:math' as math;

class Circle {
  double radius;
  Circle(this.radius);
  double get area => math.pi * math.pow(this.radius, 2);
}
