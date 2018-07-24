
*-- Hungarian language class
*
DEFINE CLASS _lngcal_hu AS _lngcal
   Name = "_lngcal_hu"

   PROCEDURE Init
       *
       * _lngcal_hu::Init
       *
       This.cFile = This.GetClasslibFolder()+"hu.xml"
       DODEFAULT()
   ENDPROC


   PROCEDURE SetTooltip
      *
      * _lngcal_hu::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText=STRCONV("Ugrás a sajtóbemutató héten meg",11,238,2)

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText=STRCONV("Ugrás a sajtóbemutató héten meg",11,238,2)

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText=STRCONV("Ugrás a sajtóbemutató hónap",11,238,2)

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText=STRCONV("Ugrás a következő hónapra",11,238,2)

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText=STRCONV("Ugrás a sajtóbemutató év",11,238,2)

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText=STRCONV("Ugrás a következő évre",11,238,2)


         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="�v"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="H�nap"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("H�t %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("H�t %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("H�t %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("H�t %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("H�t %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("H�t %WEEK%.","%WEEK%",m.loObj.Value)

      ENDCASE
   ENDPROC


ENDDEFINE
