#ColorPickerObject
  #color regex for matching
  REGEX_ARRAY =[

    # RGBA regex match
    # rgba(0, 99, 199, 0.3)
    { format: 'rgba', regex: /(rgba\(((([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\s*,\s*([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\s*,\s*([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])))\s*,\s*(0|1|0*\.\d+)\))/ig }

    # RBG regex match
    # rgb(0, 99, 199)
    { format: 'rgb', regex: /(rgb\(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\s*,\s*([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\s*,\s*([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\))/ig }

    # hex regex match
    # eg. #000 and #ffffff
    {format: 'hex', regex: /(\#[a-f0-9]{6}|\#[a-f0-9]{3})/ig }

  ]

  #Public Functions
  module.exports =
    view: null

    activate: ->
      #activate colorpicker here

    open: ->
      #open color picker for selected color
