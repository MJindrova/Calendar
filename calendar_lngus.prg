*-- US language class
*
DEFINE CLASS _lngcal_enus AS _lngcal
   Name = "_lngcal_enus"
   FDOW = 1

   PROCEDURE Init
       *
       * _lngcal_enus::Init
       *
       This.cFile = This.GetClasslibFolder()+"enus.xml"
       DODEFAULT()
   ENDPROC

ENDDEFINE

