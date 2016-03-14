#ColorPicker-Converter
# used to convert colors to different formats

module.exports =

  #convert hex to rgb
  hexToRgb: (hexNum) ->
    hexNum = hexNum.replace /#/, ''
    if hexNum.length is 3
      return [
        parseInt(hexNum.slice(0,1) + hexNum.slice(0, 1), 16),
        parseInt(hexNum.slice(1,2) + hexNum.slice(1, 1), 16),
        parseInt(hexNum.slice(2,3) + hexNum.slice(2, 1), 16)
      ]
    else if hexNum.length is 6
     return  [
        parseInt(hexNum.slice(0,2), 16),
        parseInt(hexNum.slice(2,4), 16),
        parseInt(hexNum.slice(4,6), 16),
      ]


  #convert rbh to hex
  rgbToHex: (rgb) ->
    hexColor = '#'
    hexColor += Math.floor(rgb[0]).toString(16)
    hexColor += Math.floor(rgb[1]).toString(16)
    hexColor += Math.floor(rgb[2]).toString(16)
    return hexColor