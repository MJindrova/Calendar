
*-- Italien language class
*
DEFINE CLASS _lngcal_it AS _lngcal
   Name = "_lngcal_it"
   fontcharset = 1
   fdow = 2
   fweek = 1

   PROCEDURE Init
       *
       * _lngcal_it::Init
       *
       This.cFile = This.GetClasslibFolder()+"it.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_it::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText="Salta alla settimana anteprima set"

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText="Salta per impostare la prossima settimana"

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText="Passa in anteprima mese"

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText="Passa al mese successivo"

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText="Passa in anteprima anni"

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText="Passa al prossimo anno"


         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="Anno"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="Mese"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("Settimana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("Settimana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("Settimana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("Settimana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("Settimana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("Settimana %WEEK%.","%WEEK%",m.loObj.Value)

      ENDCASE
   ENDPROC


ENDDEFINE
