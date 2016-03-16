onecolor = require 'onecolor'


module.exports =

  isColor: (string) ->
    newColor = onecolor(string)
    if newColor not instanceof onecolor.RGB and
       newColor not instanceof onecolor.HSL and
       newColor not instanceof onecolor.HSV
        return false
    else
      return true


  colorObject: (string) ->
    return onecolor(string)

  # hex to rgb
  hexToRgb: (color) ->
    color = onecolor(hex)
    return color.rgb()

  # hex to hsl
  hexToHsl: (hex) ->
    color = onecolor(hex)
    return color.hsl()


  # rgb to hex
  rgbToHex: (rgb) ->
    color = onecolor(rgb)
    return color.hexString()

  # rgb to hsl
  rgbToHsl: (rgb) ->
    color = onecolor(rgb)
    return color.hsl()


  # rgb to hsv
  rgbToHsv: (rgb) ->
    color = onecolor(rgb)
    return color.hsv

  strToHex: (str) ->
    color = onecolor(str)
    return color.hexString()
