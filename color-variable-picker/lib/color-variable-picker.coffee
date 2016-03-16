{CompositeDisposable} = require 'atom'
ColorVariablePickerView = require './color-variable-picker-view'
ColorConverter = require './color-variable-picker-converter'

module.exports = ColorVariablePicker =
  colorVariablePickerView: null
  rightPanel: null
  subscriptions: null

  activate: (state) ->
    @colorVariablePickerView = new ColorVariablePickerView(state.colorVariablePickerViewState)
    @rightPanel = atom.workspace.addRightPanel(item: @colorVariablePickerView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'color-variable-picker:toggle': => @toggle()

  deactivate: ->
    @rightPanel.destroy()
    @subscriptions.dispose()
    @colorVariablePickerView.destroy()

  serialize: ->
    colorVariablePickerViewState: @colorVariablePickerView.serialize()

  toggle: ->
    editor = atom.workspace.getActiveTextEditor()
    colorText = editor.getSelectedText()
    isColor = ColorConverter.isColor colorText
    selection = editor.getLastSelection()
    if isColor
      @colorVariablePickerView.colorPickerInfo.selectedColorText = colorText
      if @rightPanel.isVisible()
        if @colorVariablePickerView.colorPickerInfo.isNew
          newText = @colorVariablePickerView.colorPickerInfo.newColor
          selections = editor.getSelections()
          editor.transact =>
          colorText.insertText newText for colorText in selections
        @rightPanel.hide()
      else
        @rightPanel.show()
    else
      null
