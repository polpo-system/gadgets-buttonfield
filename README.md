# gadgets-buttonfield

ButtonField for the gadgets of [polpo](https://github.com/polpo-system/polpo): a gadget that looks
like a button and shows a value like a text field, in any font. Games use it for tiles with large
digits.

```
portia.Install gadgets-buttonfield
```

    Gadgets.Insert ButtonField.New      a button field at the caret

Value is the text it shows, Font its font, Color the colour of the button; Flat draws it without
the 3D border, Rainbow colours the text by its last digit. A middle click runs Cmd. Linked to a
model, it shows the model's Value, or the attribute of the model named in Field. `tools/ButtonField.Tool`
has the details and an example in LayLa.

## What is here

    src/ButtonField.Mod
    tools/ButtonField.Tool
    test/ButtonFieldTest.Mod

ButtonField is by Damien Guichard (1998); it came with his FiveToOne (Contrib/FiveToOne of the
ETH Oberon archive). This copy comes from the documentation of ETH Native Oberon 2.3.7, where
André Fischer's games Afi521Big and PuzzleXY use it. The first commit has the file as it is there,
the second the source as plain text. It compiles unchanged with all eight of polpo's compilers.

## Tests

    ButtonFieldTest.Run   6 checks: a button field made, its attributes set and read, a copy, and
                          one stored in a library and loaded again; it needs the desktop's display

The license is GPL-3 (`LICENSE`); ETH distributed ButtonField with ETH Oberon, whose license is in
`LICENSE.ETH`.
