
*-- Portugal language class
*
DEFINE CLASS _lngcal_pt AS _lngcal
   Name = "_lngcal_pt"
   fdow = 1

   PROCEDURE Init
       *
       * _lngcal_pt::Init
       *
       This.cFile = This.GetClasslibFolder()+"pt.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_pt::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText=STRCONV("Ir para a semana de pré-visualização set",11,0,2)

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText=STRCONV("Ir para definir na próxima semana",11,0,2)

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText=STRCONV("Ir para o preview",11,0,2)

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText=STRCONV("Ir para o próximo mês",11,0,2)

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText=STRCONV("Ir para preview",11,0,2)

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText=STRCONV("Ir para o próximo ano",11,0,2)


         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="Ano"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText=STRCONV("Mês",11,0,2)

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
