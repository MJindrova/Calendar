
*-- Switzerland - German language class
*
DEFINE CLASS _lngcal_dech AS _lngcal
   Name = "_lngcal_dech"

   PROCEDURE Init
       *
       * _lngcal_dech::Init
       *
       This.cFile = This.GetClasslibFolder()+"dech.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_dech::SetTooltip
      *
      LPARAM m.loObj 
      m.lcName = UPPER (m.loObj.Name) 
      DO CASE 
         CASE m.lcName = "CMDPREVW" 
              m.loObj.ToolTipText = "Weiter zur Vorschau Woche einstellen" 

         CASE m.lcName = "CMDNEXTW" 
              m.loObj.ToolTipText = "Weiter zur n�chsten Woche gesetzt" 

         CASE m.lcName = "CMDPREVM" 
              m.loObj.ToolTipText = "Weiter zur Vorschau Monats" 

         CASE m.lcName = "CMDNEXTM" 
              m.loObj.ToolTipText = "Direkt zum n�chsten Monat" 

         CASE m.lcName = "CMDPREVY" 
              m.loObj.ToolTipText = "Weiter zur Vorschau Jahres" 

         CASE m.lcName = "CMDNEXTY" 
              m.loObj.ToolTipText = "Direkt zum n�chsten Jahr" 


         CASE m.lcName = "TXTYEAR" 
              m.loObj.ToolTipText = "Jahr" 

         CASE m.lcName = "CBOMONTH" 
              m.loObj.ToolTipText = "Monat" 

         CASE m.lcName = "CNTW1" 
              m.loObj.ToolTipText = STRTRAN ("Woche %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW2" 
              m.loObj.ToolTipText = STRTRAN ("Woche %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW3" 
              m.loObj.ToolTipText = STRTRAN ("Woche %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW4" 
              m.loObj.ToolTipText = STRTRAN ("Woche %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW5" 
              m.loObj.ToolTipText = STRTRAN ("Woche %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW6" 
              m.loObj.ToolTipText = STRTRAN ("Woche %WEEK%.","%WEEK%", m.loObj.Value) 

      ENDCASE
   ENDPROC


ENDDEFINE

*-- Switzerland - French language class
*
DEFINE CLASS _lngcal_frch AS _lngcal
   Name = "_lngcal_frch"

   PROCEDURE Init
       *
       * _lngcal_frch::Init
       *
       This.cFile = This.GetClasslibFolder()+"frch.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_frch::SetTooltip
      *
      LPARAM m.loObj 
      m.lcName = UPPER (m.loObj.Name) 
      DO CASE
         CASE m.lcName="CMDPREVW" 
              m.loObj.ToolTipText = "Passer "+CHR(224)+" la semaine aper�u set" 

         CASE m.lcName= "CMDNEXTW" 
              m.loObj.ToolTipText = "Aller "+CHR(224)+" la s�rie la semaine prochaine" 

         CASE m.lcName= "CMDPREVM" 
              m.loObj.ToolTipText  = "Aller "+CHR(224)+" la pr�visualisation" 

         CASE m.lcName= "CMDNEXTM" 
              m.loObj.ToolTipText = "Aller au mois prochain" 

         CASE m.lcName= "CMDPREVY" 
              m.loObj.ToolTipText = "Aller "+CHR(224)+" la pr�visualisation" 

         CASE m.lcName= "CMDNEXTY" 
              m.loObj.ToolTipText = "Aller "+CHR(224)+" l'ann�e prochaine" 


         CASE m.lcName= "TXTYEAR" 
              m.loObj.ToolTipText = "Ann�e" 

         CASE m.lcName= "CBOMONTH" 
              m.loObj.ToolTipText = "Mois" 

         CASE m.lcName= "CNTW1" 
              m.loObj.ToolTipText = STRTRAN ("Semaine %WEEK%","%WEEK%", m.loObj.Value) 

         CASE m.lcName= "CNTW2" 
              m.loObj.ToolTipText = STRTRAN ("Semaine %WEEK%","%WEEK%", m.loObj.Value) 

         CASE m.lcName= "CNTW3" 
              m.loObj.ToolTipText = STRTRAN ("Semaine %WEEK%","%WEEK%", m.loObj.Value) 

         CASE m.lcName= "CNTW4" 
              m.loObj.ToolTipText = STRTRAN ("Semaine %WEEK%","%WEEK%", m.loObj.Value) 

         CASE m.lcName= "CNTW5" 
              m.loObj.ToolTipText = STRTRAN ("Semaine %WEEK%","%WEEK%", m.loObj.Value) 

         CASE m.lcName= "CNTW6" 
              m.loObj.ToolTipText = STRTRAN ("Semaine %WEEK%","%WEEK%", m.loObj.Value) 

      ENDCASE
   ENDPROC


ENDDEFINE


*-- Switzerland - Italian language class
*
DEFINE CLASS _lngcal_itch AS _lngcal
   Name = "_lngcal_itch"

   PROCEDURE Init
       *
       * _lngcal_itch::Init
       *
       This.cFile = This.GetClasslibFolder()+"itch.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_itch::SetTooltip
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
