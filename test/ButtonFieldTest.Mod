MODULE ButtonFieldTest;  (** ButtonFieldTest.Run: a button field made, its attributes, a copy, stored in a library and loaded; needs the desktop's display *)

IMPORT Files, Objects, Display, Gadgets, Attributes, Out;

CONST Lib = "zq_buttonfield.Lib";

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Same(obj: Objects.Object): BOOLEAN;
VAR s: ARRAY 64 OF CHAR; col: LONGINT; flat, rain: BOOLEAN;
BEGIN
  Attributes.GetString(obj, "Value", s); Attributes.GetInt(obj, "Color", col);
  Attributes.GetBool(obj, "Flat", flat); Attributes.GetBool(obj, "Rainbow", rain);
  RETURN (s = "42") & (col = 3) & flat & rain
END Same;

PROCEDURE Run*;
VAR obj, copy, loaded: Objects.Object; s: ARRAY 64 OF CHAR; C: Objects.CopyMsg; B: Objects.BindMsg;
  lib: Objects.Library; ref: INTEGER; res: INTEGER;
BEGIN
  fails := 0; checks := 0;
  obj := Gadgets.CreateObject("ButtonField.New");
  Check("ButtonField.New", (obj # NIL) & (obj IS Display.Frame));
  IF obj # NIL THEN
    Attributes.GetString(obj, "Gen", s); Check("Gen", s = "ButtonField.New");
    Attributes.GetString(obj, "Value", s); Check("first value", s = "Button Field");
    Attributes.SetString(obj, "Value", "42"); Attributes.SetInt(obj, "Color", 3);
    Attributes.SetBool(obj, "Flat", TRUE); Attributes.SetBool(obj, "Rainbow", TRUE);
    Check("attributes set", Same(obj));
    C.id := Objects.deep; C.obj := NIL; Objects.Stamp(C); obj.handle(obj, C); copy := C.obj;
    Check("a copy", (copy # NIL) & (copy # obj) & Same(copy));
    Files.Delete(Lib, res);
    lib := Objects.ThisLibrary(Lib); lib.GenRef(lib, ref); lib.PutObj(lib, ref, obj);
    Objects.PutName(lib.dict, ref, "Field"); B.lib := lib; obj.handle(obj, B); lib.Store(lib);
    Objects.FreeLibrary(Lib);
    loaded := Gadgets.FindPublicObj("zq_buttonfield.Field");
    Check("stored and loaded", (loaded # NIL) & (loaded # obj) & Same(loaded));
    Objects.FreeLibrary(Lib); Files.Delete(Lib, res)
  END;
  Out.String("ButtonFieldTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END ButtonFieldTest.
