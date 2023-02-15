class Triangle
  attr_reader :w, :y, :z
  def initialize(w, y, z)
    @w = w
    @y = y
    @z = z
  end

  def kind
    validate_triangle
    if w == y && y == z
      :equilateral
    elsif w == y || y == z || w == z
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(w + y > z), (w + z > y), (y + z > w)]
    [w, y, z].each do |side|
      real_triangle << false if side <= 0 
    raise TriangleError if real_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end

end
