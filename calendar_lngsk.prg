
*-- Slovak language class
*
DEFINE CLASS _lngcal_sk AS _lngcal
   Name = "_lngcal_sk"
   fontcharset = 238
   fdow = 2
   fweek = 1

   PROCEDURE Init
       *
       * _lngcal_sk::Init
       *
       This.cFile = This.GetClasslibFolder()+"sk.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_sk::SetTooltip
      *
      LPARAM m.loObj 
      m.lcName = UPPER (m.loObj.Name) 
      DO CASE 
         CASE m.lcName = "CMDPREVW" 
              m.loObj.ToolTipText = "Zobrazí predchádzajúci sadu týždòov" 

         CASE m.lcName = "CMDNEXTW" 
              m.loObj.ToolTipText = "Zobrazí nasledujúcu sadu týždòov" 

         CASE m.lcName = "CMDPREVM" 
              m.loObj.ToolTipText = "Zobrazí predchádzajúci mesiac" 

         CASE m.lcName = "CMDNEXTM" 
              m.loObj.ToolTipText = "Zobrazí nasledujúci mesiac" 

         CASE m.lcName = "CMDPREVY" 
              m.loObj.ToolTipText = "Zobrazí predchádzajúci rok" 

         CASE m.lcName = "CMDNEXTY" 
              m.loObj.ToolTipText = "Zobrazí nasledujúci rok" 

         CASE m.lcName = "CNTW1" 
              m.loObj.ToolTipText = STRTRAN ("Týždeò %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW2" 
              m.loObj.ToolTipText = STRTRAN ("Týždeò %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW3" 
              m.loObj.ToolTipText = STRTRAN ("Týždeò %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW4" 
              m.loObj.ToolTipText = STRTRAN ("Týždeò %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW5" 
              m.loObj.ToolTipText = STRTRAN ("Týždeò %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW6" 
              m.loObj.ToolTipText = STRTRAN ("Týždeò %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "TXTYEAR" 
              m.loObj.ToolTipText = "Rok" 

         CASE m.lcName = "CBOMONTH" 
              m.loObj.ToolTipText = "Mesiac" 

      ENDCASE
   ENDPROC


ENDDEFINE
