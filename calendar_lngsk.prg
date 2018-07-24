
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
              m.loObj.ToolTipText = "Zobraz� predch�dzaj�ci sadu t��d�ov" 

         CASE m.lcName = "CMDNEXTW" 
              m.loObj.ToolTipText = "Zobraz� nasleduj�cu sadu t��d�ov" 

         CASE m.lcName = "CMDPREVM" 
              m.loObj.ToolTipText = "Zobraz� predch�dzaj�ci mesiac" 

         CASE m.lcName = "CMDNEXTM" 
              m.loObj.ToolTipText = "Zobraz� nasleduj�ci mesiac" 

         CASE m.lcName = "CMDPREVY" 
              m.loObj.ToolTipText = "Zobraz� predch�dzaj�ci rok" 

         CASE m.lcName = "CMDNEXTY" 
              m.loObj.ToolTipText = "Zobraz� nasleduj�ci rok" 

         CASE m.lcName = "CNTW1" 
              m.loObj.ToolTipText = STRTRAN ("T��de� %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW2" 
              m.loObj.ToolTipText = STRTRAN ("T��de� %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW3" 
              m.loObj.ToolTipText = STRTRAN ("T��de� %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW4" 
              m.loObj.ToolTipText = STRTRAN ("T��de� %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW5" 
              m.loObj.ToolTipText = STRTRAN ("T��de� %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "CNTW6" 
              m.loObj.ToolTipText = STRTRAN ("T��de� %WEEK%.","%WEEK%", m.loObj.Value) 

         CASE m.lcName = "TXTYEAR" 
              m.loObj.ToolTipText = "Rok" 

         CASE m.lcName = "CBOMONTH" 
              m.loObj.ToolTipText = "Mesiac" 

      ENDCASE
   ENDPROC


ENDDEFINE
