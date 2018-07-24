DEFINE CLASS _lngcal AS _mdcalendar
   Name = "_lngcal"

   *-- Set localized tooltip for objects
   PROCEDURE SetTooltip
      *
      * _lngcal::SetTooltip
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
