class Triangle
  def initialize(a, b ,c)
    @a = a
    @b = b
    @c = c
  end

  def triangle?
    raise ArgumentError, 'Sides can be only numeric' unless [@a, @b, @c].all? { |s| s.is_a?(Numeric)}
    raise ArgumentError, 'Sides can be only positive' unless [@a, @b, @c].all? { |s| s > 0}
    (sides[0] + sides[1] > sides[2]) && sides[0].positive?
  rescue ArgumentError => e
    e.message
  end

  def height
    raise StandardError, 'It is not a triangle' unless triangle?

    p = 0.5 * (@a + @b + @c)
    ((2 * Math.sqrt(p*(p - @a) * (p - @b) * (p - @c))) / @a).round(1)
  rescue StandardError => e
    e.message
  end

  def square
    raise StandardError, 'It is not a triangle' unless triangle?

     @a * height * 0.5
  rescue StandardError => e
    e.message
  end

  def triangle_type
    raise StandardError, 'It is not a triangle' unless triangle?

    if sides.sum == sides[0] * (2 + Math.sqrt(2))
      'Equilateral and Right'
    elsif sides.uniq.size == 1
      'Equilateral'
    elsif sides.uniq.size < 3
      'Isosceles'
    elsif sides[2]**2 == sides[0]**2 + sides[1]**2
      'Right'
    elsif sides.uniq.size > 2
      'Scalene'
    end

  rescue StandardError => e
    e.message
  end

  private

  def sides
    [@a, @b, @c].sort
  end
end