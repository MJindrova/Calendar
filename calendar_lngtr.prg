
*-- Turkish language class
*
DEFINE CLASS _lngcal_tr AS _lngcal
   Name = "_lngcal_tr"

   PROCEDURE Init
       *
       * _lngcal_tr::Init
       *
       This.cFile = This.GetClasslibFolder()+"tr.xml"
       DODEFAULT()
   ENDPROC


   PROCEDURE SetTooltip
      *
      * _lngcal_tr::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText="Geç önceki hafta set"

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText="Geç önümüzdeki hafta ayarlamak için"

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText="Geç önizleme için ay"

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText="Geç önümüzdeki ay"

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText="Skip önizleme yil"

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText="Geç gelecek yil"


         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="Yil"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="Ay"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("Hafta %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("Hafta %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("Hafta %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("Hafta %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("Hafta %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("Hafta %WEEK%.","%WEEK%",m.loObj.Value)

      ENDCASE
   ENDPROC


ENDDEFINE
