class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  class TriangleError < StandardError
  end

  def kind
    sides = [a,b,c]
    ineq = [a+b > c, a+c > b, b+c > a]

    if sides.min <= 0 || ineq.include?(false)
      raise TriangleError
    end

    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    elsif scalene?
      :scalene
    end
  end

  def equilateral?
    a == b && b == c
  end

  def isosceles?
    (a == b && b != c) || (b == c && c != a) || (a == c && c != b)
    # a == b || a == c || b == c this solution works too
  end

  def scalene?
    a != b && a != c && b != c
  end

end
