class Convert
  def create_map_to_roman(one, five, ten)
    {'0' => '', '1' => one, '2' => one + one, '3' => one + one + one, '4' => one + five, '5' => five, '6' => five + one,
     '7' => five + one + one, '8' => five + one + one + one, '9' => one + ten}
  end

  def create_map_to_arab(one, five, ten)
    create_map_to_roman(one, five, ten).invert
  end
end