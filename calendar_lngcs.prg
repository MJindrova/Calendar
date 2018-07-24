*-- Czech language class
*
DEFINE CLASS _lngcal_cs AS _lngcal
   Name = "_lngcal_cs"
   fontcharset = 238
   fdow = 2
   fweek = 1

   PROCEDURE Init
       *
       * _lngcal_cs::Init
       *
       This.cFile = This.GetClasslibFolder()+"cs.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_cs::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText="Zobrazí pøedchozí sadu týdnù"

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText="Zobrazí následující sadu týdnù"

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText="Zobrazí pøedchozí mìsíc"

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText="Zobrazí následující mìsíc"

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText="Zobrazí pøedchozí rok"

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText="Zobrazí následující rok"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("Týden %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("Týden %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("Týden %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("Týden %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("Týden %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("Týden %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="Rok"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="Mìsíc"

      ENDCASE
   ENDPROC


ENDDEFINE
