ButtonField - a gadget that looks like a button and shows a value like a text field (Damien Guichard)

  Gadgets.Insert ButtonField.New      a button field at the caret

Value is the text it shows, Font its font (Oberon14b.Scn.Fnt gives large digits), Color the colour
of the button, Flat draws it without the 3D border, Rainbow colours the text by its last digit
(0 white, 1 black, 2 to 9 the colours 1 to 8). A middle click runs Cmd. Linked to a model, it
shows the model's Value, or the attribute of the model named in Field.

In LayLa (package gadgets-layla):

  LayLa.OpenAsDoc (HLIST Panel (border=8)
    (NEW ButtonField.New (w=60 h=60) (ATTR Value="5" Font="Oberon14b.Scn.Fnt" Rainbow=TRUE)))
