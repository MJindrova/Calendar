*-- Austria language class
DEFINE CLASS _lngcal_deat AS _lngcal
   Name = "_lngcal_deat"
   FontCharset = 1
   FDOW = 2
   FWEEK = 1

   PROCEDURE Init
       *
       * _lngcal_deat::Init
       *
       This.cFile = This.GetClasslibFolder()+"deat.xml"
       DODEFAULT()
   ENDPROC


   PROCEDURE SetTooltip
      *
      * _lngcal_at::SetTooltip
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
