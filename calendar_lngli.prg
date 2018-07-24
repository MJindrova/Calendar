
*-- Liechtenstein language class
*
DEFINE CLASS _lngcal_deli AS _lngcal
   Name = "_lngcal_deli"
   fontcharset = 1
   fdow = 2
   fweek = 1

   PROCEDURE Init
       *
       * _lngcal_deli::Init
       *
       This.cFile = This.GetClasslibFolder()+"deli.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_deli::SetTooltip
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
