# Color Pickers View Class
# {View} = require 'atom'
convert = require './color-variable-picker-converter'
{View, $} = require 'atom-space-pen-views'
onecolor = require 'onecolor'
SimpleColorPicker = require 'simple-color-picker'

colorPicker = undefined
huePicker = undefined
alphaPicker = undefined
saturationPicker = undefined


module.exports =
class ColorVariablePickerView extends View


  constructor: (serializedState) ->
    # (atom.workspaceView.find '.vertical').append this
    ColorPicker = require './color-variable-picker'
    @element = document.createElement('div')
    @element.classList.add('colorpickmenu')
    @element.setAttribute 'id', 'colorpickmenu'

    @cPicker = new SimpleColorPicker {color: @colorPickerInfo.selectedColorText, width: 200, height: 200}
    @cPicker.appendTo(@element)

    @cPicker.onChange (hexString) =>
      colorFromPicker = hexString
      if colorFromPicker isnt @colorPickerInfo.newColor
        @colorPickerInfo.newColor = hexString
        @colorPickerInfo.isNew = true

    # @buttons = document.createElement('div')
    # @confirmBtn = document.createElement('button')
    # @confirmBtn.classList.add('btn-success')
    # @confirmBtn.classList.add('btn')
    # @confirmBtn.setAttribute 'id', 'confirm'
    # @confirmBtn.setAttribute 'click', 'confirmClose'
    #
    #
    # @cancelBtn = document.createElement('bubtton')
    # @cancelBtn.classList.add('btn-error')
    # @cancelBtn.classList.add('btn')
    # @cancelBtn.setAttribute 'id', 'cancel'
    # @cancelBtn.setAttribute 'click', 'close'

    #
    # # create + rend Hue element
    # @hueElement = document.createElement('div')
    # @hueElement.classList.add('cvp-huePickerElement')
    # @hueElement.setAttribute 'id', 'cvp-huePickerElement'
    #
    #
    # @hueChoiceEl = document.createElement('div')
    # @hueChoiceEl.classList.add('cvp-hueChoice')
    # @hueChoiceEl.setAttribute 'id', 'cvp-hueChoice'
    # @hueElement.appendChild(@hueChoiceEl)
    #
    #
    # #Create and render the canvas
    # @huePickerCanvas = document.createElement('canvas')
    # @huePickerCanvas.classList.add('cvp-huePicker')
    # @huePickerCanvas.setAttribute 'id', 'cvp-huePicker'
    # hueCanvasContext = @huePickerCanvas.getContext '2d'
    # gradientHue = hueCanvasContext.createLinearGradient 0, 0, 1, 200
    # gradientHue.addColorStop 0, 'rgb(255,   0,   0)'
    # gradientHue.addColorStop 0.15, 'rgb(255,   0, 255)'
    # gradientHue.addColorStop 0.33, 'rgb(0,     0, 255)'
    # gradientHue.addColorStop 0.49, 'rgb(0,   255, 255)'
    # gradientHue.addColorStop 0.67, 'rgb(0,   255,   0)'
    # gradientHue.addColorStop 0.84, 'rgb(255, 255,   0)'
    # gradientHue.addColorStop 1, 'rgb(255,   0,   0)'
    # hueCanvasContext.fillStyle = gradientHue
    # hueCanvasContext.fillRect 0, 0, 200, 200
    # @hueElement.appendChild(@huePickerCanvas)
    #
    # @element.appendChild(@hueElement)
    #
    # @huePickerCanvas.addEventListener "mousedown", (e) => @getColor('down', e)


  destroy: ->
    @element.remove()

  getElement: ->
    @element

  callBackFunc: ->
    colorFromPicker = @cPicker.getHexString()
    if colorFromPicker isnt @colorPickerInfo.newColor
      @colorPickerInfo.newColor = @cPicker.getHexString()
      @colorPickerInfo.isNew = true

  # cancel: ->
  #   @cPicker.remove()
  #
  # confirmClose: ->
  #   @colorPickerInfo.newColor = @cPicker.getColorRGB()
  #   @colorPickerInfo.isNew = true
  #   @cPicker.remove()


  # getColor: (action, e) ->
  #   if e.which == 3 # filter out right-clicks
  #     return
  #   else
  #     canvas = document.getElementById("cvp-huePicker")
  #     xCoord = e.clientX - canvas.offsetLeft
  #     yCoord = e.clientY - canvas.offSetTop
  #     context = canvas.getContext '2d'
  #     p = context.getImageData(xCoord, yCoord, 1, 1).data
  #     @colorPickerInfo.newColor = Convert.onecolor(p[0], p[1], p[2]).toString()
  #     return


  # open: ->
  #   colorPickerInfo.colorObject = convert.colorObject colorPickerInfo.selectedColorText
  #
  #
  # close: ->
  #
  # bind: ->
  #
  #
  colorPickerInfo: {
    selectedColorText: null
    isNew: false
    newColor: null
    }
