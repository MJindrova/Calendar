
*-- United Kingdom language class
*
DEFINE CLASS _lngcal_engb AS _lngcal
   Name = "_lngcal_engb"
   fdow = 2

   PROCEDURE Init
       *
       * _lngcal_engb::Init
       *
       This.cFile = This.GetClasslibFolder()+"engb.xml"
       DODEFAULT()
   ENDPROC

ENDDEFINE
