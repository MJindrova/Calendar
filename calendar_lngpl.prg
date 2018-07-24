
*-- Polish language class
*
DEFINE CLASS _lngcal_pl AS _lngcal
   Name = "_lngcal_pl"
   fontcharset = 238
   fdow = 2
   fweek = 1

   PROCEDURE Init
       *
       * _lngcal_pl::Init
       *
       This.cFile = This.GetClasslibFolder()+"pl.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_pl::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText="Wyœwietla poprzedni zestaw tygodni"

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText="Wyœwietl nastêpnych tygodni"

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText="Wyœwietla poprzedni miesi¹c"

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText="Poka¿ w przysz³ym miesi¹cu"

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText="Wyœwietla poprzedni rok"

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText="Poka¿ na nastêpny rok"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("Tydzieñ %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("Tydzieñ %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("Tydzieñ %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("Tydzieñ %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("Tydzieñ %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("Tydzieñ %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="Rok"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="Miesi¹c"

      ENDCASE
   ENDPROC


ENDDEFINE
