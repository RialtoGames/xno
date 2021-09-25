module P
  def self.draw_lines *points
    faces = points.each_slice(2).to_a
    last_face = []
    faces.each.with_index do |face, index|
      if index != 0
        Gosu.draw_line last_face[0], last_face[1], Gosu::Color.new(40, 240, 140),
          face[0], face[1], Gosu::Color.new(200, 250, 200), 2
      end
      last_face = face
    end
  end

  def self.draw_solid x, y, width, height, color
    Gosu.draw_rect x, y, width, height, color, 1
  end
end
