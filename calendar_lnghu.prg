
*-- Hungarian language class
*
DEFINE CLASS _lngcal_hu AS _lngcal
   Name = "_lngcal_hu"

   PROCEDURE Init
       *
       * _lngcal_hu::Init
       *
       This.cFile = This.GetClasslibFolder()+"hu.xml"
       DODEFAULT()
   ENDPROC


   PROCEDURE SetTooltip
      *
      * _lngcal_hu::SetTooltip
      *
      LPARAM m.loObj
      m.lcName=UPPER(m.loObj.Name)
      DO CASE
         CASE m.lcName="CMDPREVW"
              m.loObj.ToolTipText=STRCONV("Ugr谩s a sajt贸bemutat贸 h茅ten meg",11,238,2)

         CASE m.lcName="CMDNEXTW"
              m.loObj.ToolTipText=STRCONV("Ugr谩s a sajt贸bemutat贸 h茅ten meg",11,238,2)

         CASE m.lcName="CMDPREVM"
              m.loObj.ToolTipText=STRCONV("Ugr谩s a sajt贸bemutat贸 h贸nap",11,238,2)

         CASE m.lcName="CMDNEXTM"
              m.loObj.ToolTipText=STRCONV("Ugr谩s a k枚vetkez艖 h贸napra",11,238,2)

         CASE m.lcName="CMDPREVY"
              m.loObj.ToolTipText=STRCONV("Ugr谩s a sajt贸bemutat贸 茅v",11,238,2)

         CASE m.lcName="CMDNEXTY"
              m.loObj.ToolTipText=STRCONV("Ugr谩s a k枚vetkez艖 茅vre",11,238,2)


         CASE m.lcName="TXTYEAR"
              m.loObj.ToolTipText="蓈"

         CASE m.lcName="CBOMONTH"
              m.loObj.ToolTipText="H髇ap"

         CASE m.lcName="CNTW1"
              m.loObj.ToolTipText=STRTRAN("H閠 %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW2"
              m.loObj.ToolTipText=STRTRAN("H閠 %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW3"
              m.loObj.ToolTipText=STRTRAN("H閠 %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW4"
              m.loObj.ToolTipText=STRTRAN("H閠 %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW5"
              m.loObj.ToolTipText=STRTRAN("H閠 %WEEK%.","%WEEK%",m.loObj.Value)

         CASE m.lcName="CNTW6"
              m.loObj.ToolTipText=STRTRAN("H閠 %WEEK%.","%WEEK%",m.loObj.Value)

      ENDCASE
   ENDPROC


ENDDEFINE
