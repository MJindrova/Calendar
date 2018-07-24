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
              m.loObj.ToolTipText="Zobraz� p�edchoz� sadu t�dn�"

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText="Zobraz� n�sleduj�c� sadu t�dn�"

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText="Zobraz� p�edchoz� m�s�c"

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText="Zobraz� n�sleduj�c� m�s�c"

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText="Zobraz� p�edchoz� rok"

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText="Zobraz� n�sleduj�c� rok"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("T�den %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("T�den %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("T�den %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("T�den %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("T�den %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("T�den %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="Rok"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="M�s�c"

      ENDCASE
   ENDPROC


ENDDEFINE
