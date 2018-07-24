*-- Spain language class
*
DEFINE CLASS _lngcal_es AS _lngcal
   Name = "_lngcal_es"
   fontcharset = 1
   fdow = 2
   fweek = 1

   PROCEDURE Init
       *
       * _lngcal_es::Init
       *
       This.cFile = This.GetClasslibFolder()+"es.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_es::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText="Ir a semana vista previa de ajuste"

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText="Ir al conjunto de la prA3xima semana"

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText="Cambiar a vista previa de mes"

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText="Ir al mes que viene"

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText="Cambiar a vista previa de aA±o"

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText="Ir al prA3ximo aA±o"


         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="AA±o"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="Mes"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("Semana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("Semana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("Semana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("Semana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("Semana %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("Semana %WEEK%.","%WEEK%",m.loObj.Value)

      ENDCASE
   ENDPROC


ENDDEFINE
