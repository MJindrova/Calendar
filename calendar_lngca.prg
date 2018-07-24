*-- Canada - English language class
*
DEFINE CLASS _lngcal_enca AS _lngcal
   Name = "_lngcal_enca"
   fdow = 1

   PROCEDURE Init
       *
       * _lngcal_enca::Init
       *
       This.cFile = This.GetClasslibFolder()+"enca.xml"
       DODEFAULT()
   ENDPROC

   PROCEDURE SetTooltip
      *
      * _lngcal_enca::SetTooltip
      *
      LPARAM m.loObj
      _lngCal::SetTooltip(m.loObj)
   ENDPROC


ENDDEFINE


*-- Canada - French language class
*
DEFINE CLASS _lngcal_frca AS _lngcal
   Name = "_lngcal_frca"
   fdow = 1

   PROCEDURE Init
       *
       * _lngcal_frca::Init
       *
       This.cFile = This.GetClasslibFolder()+"frca.xml"
       DODEFAULT()
   ENDPROC


   PROCEDURE SetTooltip
      *
      * _lngcal_frca::SetTooltip
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
