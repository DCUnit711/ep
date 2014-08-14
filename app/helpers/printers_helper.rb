module PrintersHelper

  def nice_color(color)
    Printer::COLORS.fetch color.to_sym
  end
end
