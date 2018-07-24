
*-- Philippines language class
*
DEFINE CLASS _lngcal_tl AS _lngcal
   Name = "_lngcal_tl"

   PROCEDURE Init
       *
       * _lngcal_tl::Init
       *
       This.cFile = This.GetClasslibFolder()+"tl.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_tl::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText="Laktawan sa dati linggo itakda ang"

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText="Laktawan sa susunod na linggo itakda ang"

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText="Laktawan sa dati buwan"

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText="Laktawan sa susunod na buwan"

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText="Laktawan sa dati taon"

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText="Laktawan sa susunod na taon"

         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="Taon"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="Buwan"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("Linggo %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("Linggo %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("Linggo %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("Linggo %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("Linggo %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("Linggo %WEEK%.","%WEEK%",m.loObj.Value)

      ENDCASE
   ENDPROC


ENDDEFINE
