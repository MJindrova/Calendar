*-- Belguim - German language class
*
DEFINE CLASS _lngcal_debe AS _lngcal
   Name = "_lngcal_debe"

   PROCEDURE Init
       *
       * _lngcal_debe::Init
       *
       This.cFile = This.GetClasslibFolder()+"debe.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_debe::SetTooltip
      *
      LPARAM m.loObj 
      m.lcName = UPPER (m.loObj.Name) 
      DO CASE 
         CASE m.lcName = "CMDPREVW" 
              m.loObj.ToolTipText = "Weiter zur Vorschau Woche einstellen" 

         CASE m.lcName = "CMDNEXTW" 
              m.loObj.ToolTipText = "Weiter zur nächsten Woche gesetzt" 

         CASE m.lcName = "CMDPREVM" 
              m.loObj.ToolTipText = "Weiter zur Vorschau Monats" 

         CASE m.lcName = "CMDNEXTM" 
              m.loObj.ToolTipText = "Direkt zum nächsten Monat" 

         CASE m.lcName = "CMDPREVY" 
              m.loObj.ToolTipText = "Weiter zur Vorschau Jahres" 

         CASE m.lcName = "CMDNEXTY" 
              m.loObj.ToolTipText = "Direkt zum nächsten Jahr" 


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


*-- Belgium-French language class
*
DEFINE CLASS _lngcal_frbe AS _lngcal
   Name = "_lngcal_frbe"

   PROCEDURE Init
       *
       * _lngcal_frbe::Init
       *
       This.cFile = This.GetClasslibFolder()+"frbe.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_frbe::SetTooltip
      *
      LPARAM m.loObj 
      m.lcName = UPPER (m.loObj.Name) 
      DO CASE
         CASE m.lcName="CMDPREVW" 
              m.loObj.ToolTipText = "Passer "+CHR(224)+" la semaine aperçu set" 

         CASE m.lcName= "CMDNEXTW" 
              m.loObj.ToolTipText = "Aller "+CHR(224)+" la série la semaine prochaine" 

         CASE m.lcName= "CMDPREVM" 
              m.loObj.ToolTipText  = "Aller "+CHR(224)+" la prévisualisation" 

         CASE m.lcName= "CMDNEXTM" 
              m.loObj.ToolTipText = "Aller au mois prochain" 

         CASE m.lcName= "CMDPREVY" 
              m.loObj.ToolTipText = "Aller "+CHR(224)+" la prévisualisation" 

         CASE m.lcName= "CMDNEXTY" 
              m.loObj.ToolTipText = "Aller "+CHR(224)+" l'année prochaine" 


         CASE m.lcName= "TXTYEAR" 
              m.loObj.ToolTipText = "Année" 

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

*-- Belgium-Dutch language class
*
DEFINE CLASS _lngcal_nlbe AS _lngcal
   Name = "_lngcal_nlbe"

   PROCEDURE Init
       *
       * _lngcal_nlbe::Init
       *
       This.cFile = This.GetClasslibFolder()+"nlbe.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_nlbe::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText="Skip to preview week set"

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText="Skip to next week set"

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText="Skip to preview month"

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText="Skip to next month"

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText="Skip to preview year"

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText="Skip to next year"


         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="Year"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="Month"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("Week %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("Week %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("Week %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("Week %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("Week %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("Week %WEEK%.","%WEEK%",m.loObj.Value)

      ENDCASE
   ENDPROC


ENDDEFINE
