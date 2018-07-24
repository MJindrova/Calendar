*-- Basic calendar metadata class
*http://www.pjh2.de/datetime/weeknumber/wnd.php?l=en#Legend

#INCLUDE "calendar_md.h"

DEFINE CLASS _mdcalendar AS CUSTOM
   Name = "_mdcalendar"
   
   FontCharset = 0    && FontCharset
   FWEEK = 1          && First week of year
   FDOW = 1           && First day of week
   cAlias = ""        && Alias of cached hollydays
   cCachedYears = .F. && Alias of cached years
   cFile = ""         && Last loaded XML file
   lc_dayname = 1     && The flag of lowercase day name
   lc_monthname = .F. && The flag of lowercase month name
   cmd = ""           && Metadata alias

   PROTECTED amonths[12] && List of months
   PROTECTED adays[7]


   PROCEDURE get11mb23
      *
      * _mdcalendar::get11mb23
      *
      LPARAMETERS m.ldDate
      LOCAL m.ldMDate,m.ldFDate
      * last mondey in may
      m.ldMDate=DATE(YEAR(m.ldDate),11,23)
      m.ldFDate=DATE(YEAR(m.ldDate),11,1)
      DO WHILE m.ldMDate>=m.ldFDate AND DOW(m.ldMDate,This.FDOW)<>1
         m.ldMDate=m.ldMDate-1
      ENDDO
      RETURN m.ldMDate
   ENDPROC


   *-- Check is the day is holyday
   PROCEDURE IsHollyDay
      *
      * _mdcalendar::IsHollyDay
      *
      LPARAM m.ldDate
      * ldDate - test date
      LOCAL m.lii, m.lcCOLLATE, m.llExists
      IF RECCOUNT(This.cMD)=0 OR EMPTY(m.ldDate) OR ISNULL(m.ldDate)
         RETURN .F.
      ENDIF

      * test if exist in cache
      This.CheckCacheDays(m.ldDate)
      lcCOLLATE=SET("COLLATE")
      SET COLLATE TO "MACHINE"
      m.llExists=INDEXSEEK(DTOS(m.ldDate)+BINTOC(_mdCalendar_TD_HollyDay),.F.,This.cAlias,"I02")
      SET COLLATE TO (m.lcCOLLATE)
      RETURN m.llExists
   ENDPROC


   *-- Check is day workday
   PROCEDURE IsWorkDay
      *
      * _mdcalendar::IsWorkDay
      *
      LPARAMETERS m.ldDate
      * ldDate - test date
      IF This.IsHollyDay(m.ldDate) && check for hollyday
         RETURN .F.
      ENDIF
      * check if Saturday or Sunday
      RETURN NOT INLIST(DOW(m.ldDate),7,1) && every use first day is Sunday
   ENDPROC


   *-- Get localized dow name
   PROCEDURE GetCDOW
      *
      * _mdcalendar::GetCDOW
      *
      LPARAM m.ldDate,m.liFDOW
      RETURN This.aDays(DOW(m.ldDate,m.liFDOW))
   ENDPROC


   *-- Get localized month name
   PROCEDURE GetCMonth
      *
      * _mdcalendar::GetCMonth
      *
      LPARAM m.ldDate
      RETURN This.aMonths(MONTH(m.ldDate))
   ENDPROC


   *-- Get hollyday caption
   PROCEDURE GetDayCaption
      *
      * _mdcalendar::GetDayCaption
      *
      LPARAM m.ldDate, m.liXX002
      * ldDate  - date
      * liXX002 - day type mask
      LOCAL m.lii,m.liSele,m.lcTTT,m.lcCOLLATE,m.lcEXACT
      IF RECCOUNT(This.cMD)=0 OR EMPTY(m.ldDate) OR ISNULL(m.ldDate)
         RETURN .NULL.
      ENDIF

      * test if exist in cache
      m.lcTTT=.NULL.
      This.CheckCacheDays(m.ldDate)
      m.liSele=SELECT()
      SELECT (This.cAlias)
      m.lcCOLLATE=SET("COLLATE")
      m.lcEXACT=SET("EXACT")
      SET EXACT OFF
      SET COLLATE TO "MACHINE"
      SET ORDER TO "I03"
      SET FILTER TO BITAND(XX002,m.liXX002)>0
      IF SEEK(DTOS(m.ldDate),This.cAlias)
         m.lcTTT=""
         m.lii=RECNO()
         SCAN WHILE XX000=m.ldDate 
              m.lcTTT=m.lcTTT+IIF(m.lii=RECNO(),"",CHR(13))+XX003
         ENDSCAN
      ENDIF
      SET ORDER TO "I02"
      SET FILTER TO
      SET COLLATE TO (m.lcCOLLATE)
      IF m.lcEXACT=="ON"
         SET EXACT ON
      ELSE
         SET EXACT OFF
      ENDIF

      SELECT (m.liSele)
      RETURN m.lcTTT
   ENDPROC


   PROCEDURE GetEasterSunday_Julian
      *
      * _mdcalendar::GetEasterSunday_Julian
      *
      LPARAM m.ldDate

      LOCAL m.liYear,m.lia,m.lib,m.lic,m.lid,m.lie,m.liMonth
      m.liYear=YEAR(m.ldDate)

      m.lia = m.liYear%4
      m.lib = m.liYear%7
      m.lic = m.liYear%19
      m.lid = (19*m.lic + 15)%30
      m.lie = (2*m.lia + 4*m.lib - m.lid + 34)%7
      m.liMonth = FLOOR((m.lid + m.lie + 114) / 31)
      m.liDay = ((m.lid + m.lie + 114)%31) + 1
      RETURN DATE(m.liYear,m.liMonth,m.liDay)
   ENDPROC


   *-- Get Easter Sunday
   PROCEDURE GetEasterSunday
      *
      * _mdcalendar::GetEasterSunday
      *
      LPARAM m.ldDate
      LOCAL m.liCentury, m.liYear, m.liG, m.liK, m.liI, m.liJ, m.liL, m.liMonth, m.liDay
      m.liYear=YEAR(m.ldDate)
      m.liCentury = INT(m.liYear/100) 
      m.liG = m.liYear%19 
      m.liK = INT((m.liCentury - 17)/25)
      m.liI = (m.liCentury - INT(m.liCentury/4) - INT((m.liCentury - m.liK)/3) + 19*m.liG + 15)%30 
      m.liI = m.liI - INT(m.liI/28) * (1 - INT(m.liI/28) * INT(29/(m.liI + 1)) * INT((21 - m.liG)/11)) 
      m.liJ = (m.liYear + INT(m.liYear/4) + m.liI + 2 - m.liCentury + INT(m.liCentury/4))%7 
      m.liL = m.liI - m.liJ 
      m.liMonth = 3 + INT((m.liL + 40)/44)
      m.liDay = m.liL + 28 - 31 * INT(m.liMonth/4)

      * korekce na pondìlí
      RETURN DATE(m.liYear,m.liMonth,m.liDay)
   ENDPROC


   *-- Get Good Friday
   PROCEDURE GetGoodFriday
      *
      * _mdcalendar::GetGoodFriday
      *
      LPARAMETERS m.ldDate
      RETURN This.GetEasterSunday(m.ldDate)-2
   ENDPROC


   *-- Get Easter Monday
   PROCEDURE GetEasterMonday
      *
      * _mdcalendar::GetEasterMonday
      *
      LPARAMETERS m.ldDate
      RETURN This.GetEasterSunday(m.ldDate)+1
   ENDPROC


   *-- Get Ascension Day
   PROCEDURE GetAscensionDay
      *
      * _mdcalendar::GetAscensionDay
      *
      LPARAMETERS m.ldDate
      RETURN This.GetEasterSunday(m.ldDate)+39
   ENDPROC


   *-- Get Whit Monday
   PROCEDURE GetWhitMonday
      *
      * _mdcalendar::GetWhitMonday
      *
      LPARAMETERS m.ldDate
      RETURN This.GetEasterSunday(m.ldDate)+50
   ENDPROC


   *-- Get Pentecost
   PROCEDURE GetPentecost
      *
      * _mdcalendar::GetPentecost
      *
      LPARAMETERS m.ldDate
      RETURN This.GetEasterSunday(m.ldDate)+49
   ENDPROC


   *-- Get Corpus Christi
   PROCEDURE GetCorpusChristi
      *
      * _mdcalendar::GetCorpusChristi
      *
      LPARAMETERS m.ldDate
      RETURN This.GetEasterSunday(m.ldDate)+60
   ENDPROC


   *-- Get maundy thursday
   PROCEDURE GetMaundyThursday
      *
      * _mdcalendar::GetMaundyThursday
      *
      LPARAMETERS m.ldDate
      RETURN This.GetEasterSunday(m.ldDate)-3
   ENDPROC


   *-- Get Carnival
   PROCEDURE GetCarnival
      *
      * _mdcalendar::GetCarnival
      *
      LPARAMETERS m.ldDate
      RETURN This.GetEasterSunday(m.ldDate)-47
   ENDPROC


   *-- Get first week's day of month
   PROCEDURE GetFirstDayOfMonth
      *
      * _mdcalendar::GetFirstDayOfMonth
      *
      LPARAM m.liYear, m.liMonth, m.liDay
      LOCAL m.ldMDate,m.ldLDate
      * first monday in may
      m.ldMDate=DATE(m.liYear,m.liMonth,1)
      m.ldLDate=GOMONTH(m.ldMDate,1)-1
      DO WHILE m.ldMDate<=m.ldLDate AND DOW(m.ldMDate,This.FDOW)<>m.liDay
         m.ldMDate=m.ldMDate+1
      ENDDO
      RETURN m.ldMDate
   ENDPROC


   *-- Get first week's day of month with metadata
   PROCEDURE GetFirstDayOfMonthMD
      *
      * _mdcalendar::GetFirstDayOfMonthMD
      *
      LPARAMETERS m.ldDate,m.lcMetadata
      * ldDate - any date from year
      * lcMetaData 0305 [MONTH][DOW]
      RETURN This.GetFirstDayofMonth(YEAR(m.ldDate),VAL(LEFT(m.lcMetadata,2)),VAL(RIGHT(m.lcMetadata,2)))
   ENDPROC


   *-- Get last week's day of month
   PROCEDURE GetLastDayOfMonth
      *
      * _mdcalendar::GetLastDayOfMonth
      *
      LPARAM m.liYear, m.liMonth, m.liDay
      LOCAL m.ldMDate,m.ldFDate
      * last mondey in may
      m.ldMDate=GOMONTH(DATE(m.liYear,m.liMonth,1),1)-1
      m.ldFDate=DATE(m.liYear,m.liMonth,1)
      DO WHILE m.ldMDate>=m.ldFDate AND DOW(m.ldMDate,This.FDOW)<>m.liDay
         m.ldMDate=m.ldMDate-1
      ENDDO
      RETURN m.ldMDate
   ENDPROC


   *-- Get last week's day of month with metadata
   PROCEDURE GetLastDayOfMonthMD
      *
      * _mdcalendar::GetLastDayOfMonthMD
      *
      LPARAMETERS m.ldDate,m.lcMetadata
      * ldDate - any date from year
      * lcMetaData 0305 [MONTH][DOW]
      RETURN This.GetLastDayofMonth(YEAR(m.ldDate),VAL(LEFT(m.lcMetadata,2)),VAL(RIGHT(m.lcMetadata,2)))
   ENDPROC


   *-- Get X week's day of month
   PROCEDURE GetXDayOfMonth
      *
      * _mdcalendar::GetXDayOfMonth
      *
      LPARAM m.liYear, m.liMonth, m.liDay, m.liX
      LOCAL m.liCount,m.ldMDate,m.ldLDate
      m.liCount=0
      m.ldMDate=DATE(m.liYear,m.liMonth,1)
      m.ldLDate=GOMONTH(m.ldMDate,1)-1
      DO WHILE m.ldMDate<=m.ldLDate
         IF DOW(m.ldMDate,This.FDOW)=m.liDay
            m.liCount=m.liCount+1
            IF m.liCount=m.liX
               EXIT
            ENDIF
         ENDIF
         m.ldMDate=m.ldMDate+1
      ENDDO
      RETURN m.ldMDate
   ENDPROC


   *-- Get X week's day of month with metadata
   PROCEDURE GetXDayOfMonthMD
      *
      * _mdcalendar::GetXDayOfMonthMD
      *
      LPARAMETERS m.ldDate,m.lcMetadata
      * ldDate - any date from year
      * lcMetaData 030501 [MONTH][DOW][X-DOW]
      RETURN This.GetXDayofMonth(YEAR(m.ldDate),VAL(LEFT(m.lcMetadata,2)),VAL(SUBSTR(m.lcMetadata,3,2)),VAL(RIGHT(m.lcMetadata,2)))
   ENDPROC


   *-- Get nerast day of month
   PROCEDURE GetNearstDayOfMonth
      *
      * _mdcalendar::GetNearstDayOfMonth
      *
      LPARAM m.liYear,m.liMonth,m.liDay,m.liDow
      LOCAL m.ldMDate,m.ldLDate
      * nearst day
      m.ldMDate=DATE(m.liYear,m.liMonth,m.liDay)
      m.ldLDate=GOMONTH(m.ldMDate,1)-1
      DO WHILE m.ldMDate<=m.ldLDate AND DOW(m.ldMDate,This.FDOW)<>m.liDow
         m.ldMDate=m.ldMDate+1
      ENDDO
      RETURN m.ldMDate
   ENDPROC


   *-- Get nerast day of month with metadata
   PROCEDURE GetNearstDayOfMonthMD
      *
      * _mdcalendar::GetNearstDayOfMonthMD
      *
      LPARAMETERS m.ldDate,m.lcMetadata
      * ldDate - any date from year
      * lcMetaData 050102 [MONTH][DAY][DOW]
      RETURN This.GetNearstDayofMonth(YEAR(m.ldDate),VAL(LEFT(m.lcMetadata,2)),VAL(SUBSTR(m.lcMetadata,3,2)),VAL(RIGHT(m.lcMetadata,2)))
   ENDPROC


   *-- Get last week of month
   PROCEDURE GetLastWeekOfMonth
      *
      * _mdcalendar::GetLastWeekOfMonth
      *
      LPARAM m.liYear, m.liMonth, m.ldFirstDate, m.ldLastDate
      LOCAL m.ldDate,m.liDow
      m.ldDate=GOMONTH(DATE(m.liYear,m.liMonth,1),1)-1 && Vem poslední den z mìsíce
      m.liDow=DOW(m.ldDate,This.FDOW) && (1,2,3,4,5,6,7) 
      IF m.liDow=7
         m.ldFirstDate=m.ldDate-6
         m.ldLastDate=m.ldDate
      ELSE
         m.ldFirstDate=m.ldDate-6-m.liDow
         m.ldLastDate=m.ldFirstDate+6
      ENDIF
   ENDPROC


   *-- Get last week of month with metadata
   PROCEDURE GetLastWeekOfMonthMD
      *
      * _mdcalendar::GetLastWeekOfMonthMD
      *
      LPARAMETERS m.ldDate, m.lcMetadata, m.laDates
      * ldDate - any date from year
      * lcMetaData 03 [MONTH]
      *@laDate - array of dates
      EXTERNAL ARRAY laDates
      LOCAL m.ldFirstDate, m.ldLastDate, m.liDay
      This.GetLastWeekofMonth(YEAR(m.ldDate),VAL(LEFT(m.lcMetadata,2)),@m.ldFirstDate,@m.ldLastDate)
      DIMENSION m.laDates(m.ldLastDate-m.ldFirstDate+1)
      m.liDay=DAY(m.ldFirstDate)-1
      DO WHILE m.ldFirstDate<=m.ldLastDate
         m.laDates(DAY(m.ldFirstDate)-m.liDay)=m.ldFirstDate
         m.ldFirstDate=m.ldFirstDate+1
      ENDDO
      RETURN .T.
   ENDPROC


   *-- Get first week of month
   PROCEDURE GetFirstWeekOfMonth
      *
      * _mdcalendar::GetFirstWeekOfMonth
      *
      LPARAM m.liYear, m.liMonth, m.ldFirstDate, m.ldLastDate
      LOCAL m.ldDate, m.liDow
      m.ldDate=DATE(m.liYear,m.liMonth,1) && Vem první den z mìsíce
      m.liDow=DOW(m.ldDate,This.FDOW) && (1,2,3,4,5,6,7) 
      IF m.liDow=1
         m.ldFirstDate=m.ldDate
         m.ldLastDate=m.ldDate6
      ELSE
         m.ldFirstDate=m.ldDate+6-m.liDow
         m.ldLastDate=m.ldFirstDate+6
      ENDIF
   ENDPROC


   *-- Get first week of month  with metadata
   PROCEDURE GetFirstWeekOfMonthMD
      *
      * _mdcalendar::GetFirstWeekOfMonthMD
      *
      LPARAMETERS m.ldDate, m.lcMetadata, m.laDates
      * ldDate - any date from year
      * lcMetaData 03 [MONTH]
      *@laDate - array of dates
      EXTERNAL ARRAY laDates
      LOCAL m.ldFirstDate, m.ldLastDate, m.liDay
      This.GetFirstWeekofMonth(YEAR(m.ldDate),VAL(LEFT(m.lcMetadata,2)),@m.ldFirstDate,@m.ldLastDate)
      DIMENSION m.laDates(m.ldLastDate-m.ldFirstDate+1)
      m.liDay=DAY(m.ldFirstDate)-1
      DO WHILE m.ldFirstDate<=m.ldLastDate
         m.laDates(DAY(m.ldFirstDate)-m.liDay)=m.ldFirstDate
         m.ldFirstDate=m.ldFirstDate+1
      ENDDO
      RETURN .T.
   ENDPROC


   PROCEDURE GetNameDayText
      *
      * _mdcalendar::GetNameDayText
      *
      LPARAM m.ldDate, m.llAll
      * ldDate - Date 
      * llAll  - Return all namedays
      LOCAL m.lii, m.liSele, m.lcTTT, m.lcCOLLATE
      IF RECCOUNT(This.cMD)=0 OR EMPTY(m.ldDate) OR ISNULL(m.ldDate)
         RETURN .NULL.
      ENDIF

      * test if exist in cache
      m.lcTTT=.NULL.
      This.CheckCacheDays(m.ldDate)
      m.lcCOLLATE=SET("COLLATE")
      SET COLLATE TO "MACHINE"
      IF SEEK(DTOS(m.ldDate)+BINTOC(_mdCalendar_TD_NameDay),This.cAlias,"I02")
         m.liSele=SELECT()
         SELECT (This.cAlias)
         m.lcTTT=""
         m.lii=RECNO()
         IF m.llAll
            SCAN WHILE XX000=m.ldDate AND XX002=_mdCalendar_TD_NameDay
                 m.lcTTT=m.lcTTT+IIF(m.lii=RECNO(),"",",")+XX003
            ENDSCAN
         ELSE
            m.lcTTT=XX003
         ENDIF

         SELECT (m.liSele)
      ENDIF
      SET COLLATE TO (m.lcCOLLATE)
      RETURN m.lcTTT
   ENDPROC


   PROCEDURE GetDayBaseName
      *
      * _mdcalendar::GetDayBaseName
      *
      LPARAMETERS m.ldDate
      RETURN IIF(This.lc_DayName, LOWER(This.GetCDOW(m.ldDate,This.FDOW)),This.GetCDOW(m.ldDate,This.FDOW))+", "+;
             LTRIM(STR(DAY(m.ldDate),2))+". "+;
             IIF(This.lc_MonthName,LOWER(This.GetCMONTH(m.ldDate)),This.GetCMONTH(m.ldDate))
   ENDPROC


   *-- Get proximate work day
   PROCEDURE GetProximateWorkDay
      *
      * _mdcalendar::GetProximateWorkDay
      *
      LPARAMETERS m.luDate
      * ldDate - test date(time)
      LOCAL m.lnDelta, m.liYear, m.lcHD, m.lcCOLLATE
      m.lnDelta=IIF(TYPE("m.luDate")="D",1,24*3600)
      m.liYear=YEAR(m.luDate)

      * test if exist in cache
      This.CheckCacheDays(IIF(VARTYPE(m.luDate)="D",m.luDate,TTOD(m.luDate)))
      m.lcCOLLATE=SET("COLLATE")
      SET COLLATE TO "MACHINE"
      =SEEK(m.liYear,This.cCachedYears)
      m.lcHD=EVALUATE(This.cCachedYears+".XX013")
      SET COLLATE TO (m.lcCOLLATE)

      DO WHILE BETWEEN(YEAR(m.luDate),m.liYear,m.liYear+1)
         IF DOW(m.luDate)=1 OR ','+SUBST(TTOC(m.luDate,1),5,4)+','$lcHD
            m.luDate=m.luDate+m.lnDelta
         ELSE
            IF DOW(m.luDate)=7
               m.luDate=m.luDate+m.lnDelta*2
            ELSE
               EXIT
            ENDIF
         ENDIF
      ENDDO

      RETURN IIF(BETWEEN(YEAR(m.luDate),m.liYear,m.liYear+1),m.luDate,.NULL.)
   ENDPROC


   *-- Get count network days. This method is obsolete and buged. Use new method GetWeekDays()
   PROCEDURE GetCountNetworkDays
      *
      * _mdcalendar::GetCountNetworkDays
      *
      LPARAM m.luStart,m.luEnd,m.llSixDayWeek
      * luStart - Start date(time)
      * luEnd   - End date(time)

      *!* Source: http://fox.wikis.com/wc.dll?Wiki~Weekdays

      LOCAL m.lnDays, m.lnDOW,m.lnHollyDays,m.lcCOLLATE,m.liSele
      *Determine the total possible number of days.
      m.lnDays = ABS(IIF(VARTYPE(m.luStart)="D",m.luStart,TTOD(m.luStart)) -;
                     IIF(VARTYPE(m.luEnd)="D",m.luEnd,TTOD(m.luEnd))) + 1

      *Determine the number of the day of the week.
      m.lnDOW = DOW(MIN(m.luStart,m.luEnd),2)

      m.liSele=SELECT()
      This.CheckCacheDays(IIF(VARTYPE(m.luStart)="D",luStart,TTOD(m.luStart)))
      IF YEAR(m.luStart)<>YEAR(m.luEnd)
         This.CheckCacheDays(IIF(VARTYPE(m.luEnd)="D",m.luEnd,TTOD(m.luEnd)))
      ENDIF   

      m.lcCOLLATE=SET("COLLATE")
      SET COLLATE TO "MACHINE"

      SELECT (This.cAlias)
      SET ORDER TO "I02"
      SET FILTER TO BETWEEN(DTOS(XX000),DTOS(m.luStart),DTOS(m.luEnd)) AND ;
                    BINTOC(XX002)=BINTOC(_mdCalendar_TD_HollyDay) AND ;
                    NOT IIF(m.llSixDayWeek,DOW(XX000)=1,INLIST(DOW(XX000),7,1))
                    
      COUNT TO m.lnHollyDays
      SET FILTER TO
      SELECT (m.liSele)
      SET COLLATE TO (m.lcCOLLATE)

      *Subtract the weekend (Sat/Sun) days (2 of every 7).
      *Also remove the difference between the
      *"start" date and the closest Monday.
      RETURN MAX(m.lnDays - INT(m.lnDays / 7) * 2 - m.lnHollyDays -;
             IIF( m.lnDOW = 7, SIGN(m.lnDays % 7), SIGN(m.lnDOW - 7 + (m.lnDays % 7)) + 1),0)
   ENDPROC


   *-- Get first date of week
   PROCEDURE GetFirstDateOfWeek
      *
      * _mdcalendar::GetFirstDateOfWeek
      *
      LPARAM m.vWeek,m.vYear,m.liDow
      * m.vWeek - The week number
      * m.vYear - The year
      * m.liDow - The day of week (1-7)

      ***********************************************************************
      * http://tomsvfpblog.blogspot.com/2009/12/datumsspielereien-teil-5.html
      ***********************************************************************
      LOCAL m.ldDate
         
      * // Wenn kein Jahr übergeben wurde, dann arbeiten wir mit dem aktuellen
      m.vYear = IIF (VARTYPE(m.vYear) <> [N],YEAR(DATE()) ,m.vYear )
      m.liDow = IIF (VARTYPE(m.liDow) <> [N],1 ,m.liDow )

      * // der 1.1. des gewählten Jahres stellt die Basis für die Berechnung   
      m.ldDate = DATE(m.vYear,1,1)

      * // Wenn der 01.01. in der 1. Kalenderwoche liegt, dann ist alles gut,   
      * // andernfalls müssen wir 7 Tage hinzuaddieren.                       
      m.ldDate = IIF (WEEK(m.ldDate,This.FWeek,This.FDow) <> 1,m.ldDate + 7,m.ldDate)

      * // Den Montag der Woche des Datums berechnen und die Anzahl der Wochen
      * // hinzuaddieren. Dies ergibt den Montag der übergebenen Kalenderwoche
      RETURN m.ldDate - (DOW(m.ldDate,This.FDow) - 1) + ((m.vWeek-1)*7)+(m.liDow-1)
   ENDPROC


   *-- Get week days, support for six dayswek
   PROCEDURE GetWeekDays
      *
      * _mdcalendar::GetWeekDays
      *
      LPARAM m.luStart, m.luEnd, m.llSixDaysWeek
      * luStart       - Start date(time)
      * luEnd         - End date(time)
      * llSixDaysWeek - Six daysweek / Fivedaysweek

      LOCAL m.lnDays, m.lnHollyDays, m.lnDOWS, m.lnDOWE, m.liWeeks, m.liBDays, m.liADays, m.liFD, m.lcWD, m.lnWDays, m.lcCOLLATE, m.liSele, m.lnYear

      m.liSele=SELECT()
      This.CheckCacheDays(IIF(VARTYPE(m.luStart)="D",m.luStart,TTOD(m.luStart)))
      IF YEAR(m.luStart)<>YEAR(m.luEnd)
         m.lnYear=YEAR(m.luStart)
         DO WHILE m.lnYear<=YEAR(m.luEnd)
            This.CheckCacheDays(DATE(m.lnYear,1,1))
            m.lnYear=m.lnYear+1
         ENDDO
      ENDIF   

      m.lcCOLLATE=SET("COLLATE")
      SET COLLATE TO "MACHINE"

      SELECT (This.cAlias)
      SET ORDER TO "I02"
      SET FILTER TO BETWEEN(DTOS(XX000),DTOS(m.luStart),DTOS(m.luEnd)) AND ;
                    BINTOC(XX002)=BINTOC(_mdCalendar_TD_HollyDay) AND ;
                    NOT IIF(m.llSixDaysWeek,DOW(XX000)=1,INLIST(DOW(XX000),7,1))
                    
      COUNT TO m.lnHollyDays
      SET FILTER TO
      SELECT (m.liSele)
      SET COLLATE TO (m.lcCOLLATE)

      m.lnDays = ABS(IIF(VARTYPE(m.luStart)="D",m.luStart,TTOD(m.luStart)) -;
                     IIF(VARTYPE(m.luEnd)="D",m.luEnd,TTOD(m.luEnd))) + 1

      m.lnDOWS = DOW(MIN(m.luStart,m.luEnd),2)
      m.lnDOWE = DOW(MAX(m.luStart,m.luEnd),2)

      m.liFD=IIF(m.llSixDaysWeek,7,6)
      m.lcWD=IIF(m.llSixDaysWeek,",7,",",6,7,")

      IF m.lnDays<=m.liFD-m.lnDOWS
         m.liBDays=IIF(ATC(","+STR(m.lnDOWS,1)+",",m.lcWD)>0,0,MIN(m.liFD-m.lnDOWS,m.lnDays)) && before  days
         m.lnWDays=MAX(m.liBDays-m.lnHollyDays,0)
      ELSE
         m.liBDays=IIF(ATC(","+STR(m.lnDOWS,1)+",",m.lcWD)>0,0,m.liFD-m.lnDOWS) && before  days
         m.liADays=IIF(ATC(","+STR(m.lnDOWE,1)+",",m.lcWD)>0,0,m.lnDOWE) && after  days
         m.liWeeks=INT((m.lnDays-(m.liBDays+m.liADays))/7) && week count
         m.lnWDays=MAX(m.liBDays+m.liADays+m.liWeeks*IIF(m.llSixDaysWeek,6,5)-m.lnHollyDays,0)
      ENDIF
      RETURN m.lnWDays
   ENDPROC


   *-- Internal method for add day to internal list
   PROTECTED PROCEDURE _AddDay
      *
      * _mdcalendar::_AddDay
      *
      LPARAM m.lcHD, m.lcCaption, m.lcMETHOD, m.lcMetadata, m.llMulti, m.liType, m.liPriority, m.lcXX030

      INSERT INTO (This.cMD) (XX020, XX003, XX022, XX002 , XX024, XX025, XX004, XX030);
              VALUES (m.lcHD,m.lcCaption,m.lcMETHOD,m.liType,m.lcMetadata,m.llMulti,m.liPriority,m.lcXX030)

      * check if data generated
      IF RECCOUNT(This.cCachedYears)=0
         RETURN
      ENDIF

      LOCAL m.liSele
      m.liSele=SELECT()
      SELECT (This.cCachedYears)
      SCAN ALL
           * for all cached year, add cached date
           This.CheckCacheDays(DATE(XX010,1,1),RECCOUNT(This.cMD))
           SELECT (This.cCachedYears)
      ENDSCAN

      SELECT (m.liSele)
   ENDPROC


   *-- Add day to internal list
   PROCEDURE AddDay
      *
      * _mdcalendar::AddDay
      *
      LPARAM m.lcHD, m.lcCaption, m.lcMETHOD, m.lcMetadata, m.llMulti, m.liPriority
      This._AddDay(@m.lcHD,@m.lcCaption,@m.lcMETHOD,@m.lcMetadata,m.llMulti,_mdCalendar_TD_CustomDay,m.liPriority) && 4
   ENDPROC


   PROCEDURE AddSignificantDay
      *
      * _mdcalendar::AddSignificantDay
      *
      LPARAM m.lcHD, m.lcCaption, m.lcMETHOD, m.lcMetadata, m.llMulti, m.liPriority
      This._AddDay(@m.lcHD,@m.lcCaption,@m.lcMETHOD,@m.lcMetadata,m.llMulti,_mdCalendar_TD_SignificantDay,m.liPriority) && 3
   ENDPROC


   PROCEDURE AddInternationalDay
      *
      * _mdcalendar::AddInternationalDay
      *
      LPARAM m.lcHD, m.lcCaption, m.lcMETHOD, m.lcMetadata, m.llMulti, m.liPriority
      This._AddDay(@m.lcHD,@m.lcCaption,@m.lcMETHOD,@m.lcMetadata,m.llMulti,_mdCalendar_TD_InternationalDay,m.liPriority) && 2
   ENDPROC


   *-- Add name day
   PROCEDURE AddNameDay
      *
      * _mdcalendar::AddNameDay
      *
      LPARAM m.lcHD, m.lcCaption, m.lcMETHOD, m.lcMetadata, m.llMulti, m.liPriority
      This._AddDay(@m.lcHD,@m.lcCaption,@m.lcMETHOD,@m.lcMetadata,m.llMulti,_mdCalendar_TD_NameDay,m.liPriority) && 0
   ENDPROC


   *-- Add hollyday to internal list
   PROCEDURE AddHollyDay
      *
      * _mdcalendar::AddHollyDay
      *
      LPARAM m.lcHD, m.lcCaption, m.lcMETHOD, m.lcMetadata, m.llMulti, m.liPriority
      This._AddDay(@m.lcHD,@m.lcCaption,@m.lcMETHOD,@m.lcMetadata,m.llMulti,_mdCalendar_TD_HollyDay,m.liPriority) && 1
   ENDPROC


   *-- Load calendar metadata from XML
   PROCEDURE LoadMDFromXML
      *
      * _mdcalendar::LoadMDFromXML
      *
      LPARAMETERS m.lcFile, m.liXX002
      * lcFile  - Input XML file with metadata
      * liXX002 - day type mask

      m.liXX002=IIF(VARTYPE(m.liXX002)<>"N",_mdCalendar_TD_All,m.liXX002)
      This.cFile=m.lcFile
      IF RECCOUNT(This.cMD)>0
         This.ClearCache()
      ENDIF

      LOCAL m.lcXML,m.lcData,m.lii,m.lcRow,m.lcPriority,m.lcPriorityI,m.liFCH
      LOCAL ARRAY m.laRows(1)
      m.lcXML=FILETOSTR(m.lcFile)


      * info about lokalisation
      * <calendarmd fdow="2" fweek="1" fontcharset="238" allnamedaysinday="0">
      m.lcData=STREXTRACT(m.lcXML,"<calendarmd",">")
      This.FWeek=VAL(STREXTRACT(m.lcData,'fweek="','"'))
      This.FDow=VAL(STREXTRACT(m.lcData,'fdow="','"'))
      STORE VAL(STREXTRACT(m.lcData,'fontcharset="','"')) TO This.FontCharSet,liFCH
      This.lc_DayName=STREXTRACT(m.lcData,'lc_dayname="','"')="1"
      This.lc_MonthName=STREXTRACT(m.lcData,'lc_monthname="','"')="1"


      * days in week
      *!*  <days>
      *!*   <day id="1" name="Pondìlí" />
      *!*   <day id="2" name="Úterý" />
      *!*  </days>
      m.lcData=STREXTRACT(m.lcXML,"<days>","</days>")
      FOR m.lii=1 TO OCCURS("<day",m.lcData)
          m.lcRow=STREXTRACT(m.lcData,"<day","/>",m.lii)
          This.aDays(VAL(STREXTRACT(m.lcRow,'id="','"')))=This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'name="','"'),11,m.liFCH,2))
      NEXT

      * months
      *!*  <months>
      *!*   <month id="1" name="Leden" />
      *!*   <month id="12" name="Prosinec" />
      *!*  </months>
      m.lcData=STREXTRACT(m.lcXML,"<months>","</months>")
      FOR m.lii=1 TO OCCURS("<month",m.lcData)
          m.lcRow=STREXTRACT(m.lcData,"<month","/>",m.lii)
          This.aMonths(VAL(STREXTRACT(m.lcRow,'id="','"')))=This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'name="','"'),11,m.liFCH,2))
      NEXT

      * Hollydays/holidays
      *!*  <hollydays>
      *!*   <day key="" name="" method="" metadata="" multi="" />
      *!*  </hollydays>
      IF BITAND(m.liXX002,_mdCalendar_TD_HollyDay)>0
         m.lcData=STREXTRACT(m.lcXML,"<hollydays","</hollydays>",1,4)
         m.lcPriority=STREXTRACT(m.lcData,'priority="','"')
         m.lcPriority=IIF(EMPTY(m.lcPriority),"5",m.lcPriority)

         m.lcData=STREXTRACT(m.lcData,">","</hollydays>")
         FOR m.lii=1 TO ALINES(m.laRows,m.lcData,4,">")
             m.lcRow=m.laRows(m.lii)
             IF EMPTY(m.lcRow)
                LOOP
             ENDIF
             m.lcPriorityI=STREXTRACT(m.lcRow,'priority="','"')
             This._AddDay(STRCONV(STREXTRACT(m.lcRow,'key="','"'),11,m.liFCH,2),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'name="','"'),11,m.liFCH,2)),;
                  STREXTRACT(m.lcRow,'method="','"'),;
                  STREXTRACT(m.lcRow,'metadata="','"'),VAL(STREXTRACT(m.lcRow,'multi="','"'))=1,_mdCalendar_TD_HollyDay,;
                  VAL(IIF(EMPTY(m.lcPriorityI),m.lcPriority,m.lcPriorityI)),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'validity="','"'),11,m.liFCH,2)))
         NEXT
      ENDIF

      * international days
      *!*  <internationaldays>
      *!*   <day key="" name="" method="" metadata="" multi="" />
      *!*  </internationaldays>
      IF BITAND(m.liXX002,_mdCalendar_TD_InternationalDay)>0
         m.lcData=STREXTRACT(m.lcXML,"<internationaldays","</internationaldays>",1,4)
         m.lcPriority=STREXTRACT(m.lcData,'priority="','"')
         m.lcPriority=IIF(EMPTY(m.lcPriority),"5",m.lcPriority)

         m.lcData=STREXTRACT(m.lcData,">","</internationaldays>")
         FOR m.lii=1 TO ALINES(m.laRows,m.lcData,4,">")
             m.lcRow=m.laRows(m.lii)
             IF EMPTY(m.lcRow)
                LOOP
             ENDIF
             m.lcPriorityI=STREXTRACT(m.lcRow,'priority="','"')

             This._AddDay(STRCONV(STREXTRACT(m.lcRow,'key="','"'),11,m.liFCH,2),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'name="','"'),11,m.liFCH,2)),;
                  STREXTRACT(m.lcRow,'method="','"'),;
                  STREXTRACT(m.lcRow,'metadata="','"'),VAL(STREXTRACT(m.lcRow,'multi="','"'))=1,_mdCalendar_TD_InternationalDay,;
                  VAL(IIF(EMPTY(m.lcPriorityI),m.lcPriority,m.lcPriorityI)),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'validity="','"'),11,m.liFCH,2)))
         NEXT
      ENDIF

      * name days
      *!*  <namedays>
      *!*   <day key="" name="" method="" metadata="" multi="" />
      *!*  </namedays>
      IF BITAND(m.liXX002,_mdCalendar_TD_NameDay)>0
         m.lcData=STREXTRACT(m.lcXML,"<namedays","</namedays>",1,4)
         m.lcPriority=STREXTRACT(m.lcData,'priority="','"')
         m.lcPriority=IIF(EMPTY(m.lcPriority),"5",m.lcPriority)

         m.lcData=STREXTRACT(m.lcData,">","</namedays>")
         FOR m.lii=1 TO ALINES(m.laRows,m.lcData,4,">")
             m.lcRow=m.laRows(m.lii)
             IF EMPTY(m.lcRow)
                LOOP
             ENDIF
             m.lcPriorityI=STREXTRACT(m.lcRow,'priority="','"')

             This._AddDay(STRCONV(STREXTRACT(m.lcRow,'key="','"'),11,m.liFCH,2),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'name="','"'),11,m.liFCH,2)),;
                  STREXTRACT(m.lcRow,'method="','"'),;
                  STREXTRACT(m.lcRow,'metadata="','"'),VAL(STREXTRACT(m.lcRow,'multi="','"'))=1,_mdCalendar_TD_NameDay,;
                  VAL(IIF(EMPTY(m.lcPriorityI),m.lcPriority,m.lcPriorityI)),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'validity="','"'),11,m.liFCH,2)))
         NEXT
      ENDIF

      * significant days
      *!*  <significantdays>
      *!*   <day key="" name="" method="" metadata="" multi="" />
      *!*  </significantdays>
      IF BITAND(m.liXX002,_mdCalendar_TD_SignificantDay)>0
         m.lcData=STREXTRACT(m.lcXML,"<significantdays","</significantdays>",1,4)
         m.lcPriority=STREXTRACT(m.lcData,'priority="','"')
         m.lcPriority=IIF(EMPTY(m.lcPriority),"5",m.lcPriority)

         m.lcData=STREXTRACT(m.lcData,">","</significantdays>")
         FOR m.lii=1 TO ALINES(m.laRows,m.lcData,4,">")
             m.lcRow=m.laRows(m.lii)
             IF EMPTY(m.lcRow)
                LOOP
             ENDIF
             m.lcPriorityI=STREXTRACT(m.lcRow,'priority="','"')

             This._AddDay(STRCONV(STREXTRACT(m.lcRow,'key="','"'),11,m.liFCH,2),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'name="','"'),11,m.liFCH,2)),;
                  STREXTRACT(m.lcRow,'method="','"'),;
                  STREXTRACT(m.lcRow,'metadata="','"'),VAL(STREXTRACT(m.lcRow,'multi="','"'))=1,_mdCalendar_TD_SignificantDay,;
                  VAL(IIF(EMPTY(m.lcPriorityI),m.lcPriority,m.lcPriorityI)),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'validity="','"'),11,m.liFCH,2)))
         NEXT
      ENDIF

      * custom days
      *!*  <customdays>
      *!*   <day key="" name="" method="" metadata="" multi="" />
      *!*  </customdays>
      IF BITAND(m.liXX002,_mdCalendar_TD_CustomDay)>0
         m.lcData=STREXTRACT(m.lcXML,"<customdays","</customdays>",1,4)
         m.lcPriority=STREXTRACT(m.lcData,'priority="','"')
         m.lcPriority=IIF(EMPTY(m.lcPriority),"5",m.lcPriority)

         m.lcData=STREXTRACT(m.lcData,">","</customdays>")
         FOR m.lii=1 TO ALINES(m.laRows,m.lcData,4,">")
             m.lcRow=m.laRows(m.lii)
             IF EMPTY(m.lcRow)
                LOOP
             ENDIF
             m.lcPriorityI=STREXTRACT(m.lcRow,'priority="','"')

             This._AddDay(STRCONV(STREXTRACT(m.lcRow,'key="','"'),11,m.liFCH,2),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'name="','"'),11,m.liFCH,2)),;
                  STREXTRACT(m.lcRow,'method="','"'),;
                  STREXTRACT(m.lcRow,'metadata="','"'),VAL(STREXTRACT(m.lcRow,'multi="','"'))=1,_mdCalendar_TD_CustomDay,;
                  VAL(IIF(EMPTY(m.lcPriorityI),m.lcPriority,m.lcPriorityI)),;
                  This.HTMLStringToStr(STRCONV(STREXTRACT(m.lcRow,'validity="','"'),11,m.liFCH,2)))
         NEXT
      ENDIF
   ENDPROC


   *-- Get Classlib Folder
   PROCEDURE GetClasslibFolder
      *
      * _mdcalendar::GetClasslibFolder
      *
      LOCAL m.lcPath, m.lii
      m.lcPath=SYS(16)
      m.lii=AT(" ",m.lcPath,2)
      m.lcPath=SUBSTR(m.lcPath,m.lii+1)
      RETURN JUSTPATH(m.lcPath)+"\"
   ENDPROC


   PROCEDURE HTMLStringToStr
      *
      * _mdcalendar::HTMLStringToStr
      *
      LPARAMETERS m.lcString
      RETURN STRTRAN(STRTRAN(STRTRAN(STRTRAN(m.lcString,"&amp;","&"),"&gt;",">"),"&lt;","<"),"&quot;",'"')
   ENDPROC


   *-- Check cache hollydays
   PROTECTED PROCEDURE CheckCacheDays
      *
      * _mdcalendar::CheckCacheDays
      *
      LPARAM m.ldDate, m.liMD
      LOCAL m.ldDateX, m.lii, m.liy, m.lcCOLLATE, m.lcHDMD, m.liYear, m.llSeek, m.XX002, m.XX003, m.XX004, m.XX022, m.XX024, m.XX025, m.XX030
      * test if exist in cache
      LOCAL ARRAY m.laDates(1)

      m.lcCOLLATE=SET("COLLATE")
      SET COLLATE TO "MACHINE"
      m.liYear=YEAR(m.ldDate)
      m.llSeek=SEEK(m.liYear,This.cCachedYears)
      SET COLLATE TO (m.lcCOLLATE)

      IF m.llSeek AND PCOUNT()<=1
         RETURN
      ENDIF   

      m.lcHDMD=IIF(m.llSeek,EVALUATE(This.cCachedYears+".XX013"),",")

      * create cache for year 
      SELECT (This.cMD)
      IF PCOUNT()<=1
         SET FILTER TO
      ELSE
         SET FILTER TO RECNO()=m.liMD
      ENDIF   

      SCAN ALL 
           SCATTER FIELDS XX002,XX003,XX004,XX022,XX024,XX025,XX030  MEMVAR MEMO
           DO CASE
              * key is basic data MMDD
              CASE LEN(m.XX022)=0
                   m.ldDateX=DATE(m.liYear,VAL(LEFT(XX020,2)),VAL(RIGHT(XX020,2)))

              * use procedure
              CASE LEN(m.XX024)=0 AND NOT m.XX025
                   m.ldDateX=EVAL("This."+m.XX022+"(m.ldDate)")

              * use procedure with metadata
              CASE LEN(m.XX024)>0 AND NOT m.XX025
                   m.ldDateX=EVAL("This."+m.XX022+"(m.ldDate,m.XX024)")

              * use procedure - multidate result
              CASE LEN(m.XX024)=0 AND m.XX025
                   =EVAL("This."+m.XX022+"(m.ldDate,@m.laDates)")

              * use procedure with metadata- multidate result
              CASE LEN(m.XX024)>0 AND m.XX025
                   =EVAL("This."+m.XX022+"(m.ldDate,m.XX024,@m.laDates)")

           ENDCASE
        
           IF NOT m.XX025 && singledate result
              IF !EMPTY(m.ldDateX) AND (LEN(m.XX030)=0 OR EVALUATE(STRTRAN(m.XX030,"%YEAR%",STR(YEAR(m.ldDateX),4))))
                 INSERT INTO (This.cAlias) (XX000,XX001,XX002,XX003,XX004) VALUES (m.ldDateX,RECNO(),m.XX002,m.XX003,m.XX004)
                 IF m.XX002=_mdCalendar_TD_HollyDay
                    m.lcHDMD=m.lcHDMD+SUBSTR(DTOS(m.ldDateX),5)+","
                 ENDIF
              ENDIF   
           ELSE && multidate result
              FOR m.liy=1 TO ALEN(m.laDates)
                  IF LEN(m.XX030)=0 OR EVALUATE(STRTRAN(m.XX030,"%YEAR%",STR(YEAR(m.laDates(m.liy)),4)))
                     INSERT INTO (This.cAlias) (XX000,XX001,XX002,XX003,XX004) VALUES (m.laDates(m.liy),RECNO(),m.XX002,m.XX003,m.XX004)
                     IF m.XX002=_mdCalendar_TD_HollyDay
                        m.lcHDMD=m.lcHDMD+SUBSTR(DTOS(m.laDates(m.liy)),5)+","
                     ENDIF
                  ENDIF
              NEXT
           ENDIF
      ENDSCAN
      SET FILTER TO
      ** add year to cache
      IF NOT m.llSeek
         INSERT INTO (This.cCachedYears) (XX010, XX013) VALUES (m.liYear,m.lcHDMD)
      ELSE
         REPLACE XX013 WITH m.lcHDMD IN (This.cCachedYears)
      ENDIF
   ENDPROC


   PROCEDURE Init
      *
      * _mdcalendar::Inits
      *
      LOCAL m.liSele,m.lcCOLLATE
      This.cAlias=SYS(2015)
      This.cCachedYears=SYS(2015)
      This.cMD=SYS(2015)

      m.liSele=SELECT()
      CREATE CURSOR (This.cMD) (XX020 V(20) NOCPTRAN, XX003 V(254) NOCPTRAN, XX022 V(50), XX002 I, XX024 V(20), XX025 L, XX004 INTEGER, XX030 M)

      *!* XX020 - Key
      *!* XX003 - Caption
      *!* XX022 - Method
      *!* XX002 - Type
      *!* XX024 - metadata
      *!* XX025 - Multi
      *!* XX004 - Priority
      *!* XX030 - Time validity expression


      CREATE CURSOR (This.cAlias) (XX000 DATE, XX001 INTEGER, XX002 INTEGER, XX003 V(254) NOCPTRANS, XX004 INTEGER)
      * XX000 - Date 
      * XX001 - Index in aHD[]
      * XX002 - Type of date item
      * XX003 - Text of day
      * XX004 - Priority
      m.lcCOLLATE=SET("COLLATE")
      SET COLLATE TO "MACHINE"

      SELECT (This.cAlias)
      INDEX ON DTOS(XX000)+STR(XX004,1) TAG "I03" ADDITIVE
      INDEX ON DTOS(XX000)+BINTOC(XX002) TAG "I02" ADDITIVE

      CREATE CURSOR (This.cCachedYears) (XX010 INTEGER, XX013 M)
      SELECT (This.cCachedYears)
      INDEX ON XX010 TAG "I01"

      SET COLLATE TO (m.lcCOLLATE)
      SELECT (m.liSele)

      This.CreateDays()
   ENDPROC


   PROCEDURE Destroy
      *
      * _mdcalendar::Destroy
      *
      IF USED(This.cAlias)
         USE IN (This.cAlias)
      ENDIF
      IF USED(This.cCachedYears)
         USE IN (This.cCachedYears)
      ENDIF
      IF USED(This.cMD)
         USE IN (This.cMD)
      ENDIF
   ENDPROC


   *-- Clear cache (years and date)
   PROCEDURE ClearCache
      *
      * _mdcalendar::ClearCache
      *
      LOCAL m.lcSafety
      m.lcSafety = SET("SAFETY")
      SET SAFETY OFF
      ZAP IN (This.cAlias)
      ZAP IN (This.cCachedYears)
      ZAP IN (This.cMD)
      IF m.lcSafety=="ON"
         SET SAFETY ON
      ELSE
         SET SAFETY OFF
      ENDIF
   ENDPROC


   *-- Get general localized text
   PROCEDURE GetText
      *
      * _mdcalendar::GetText
      *
   ENDPROC


   *-- Create days list
   PROTECTED PROCEDURE CreateDays
      *
      * _mdcalendar::CreateDays
      *
      This.CreateNameDays()
      This.CreateHollyDays()
      This.CreateSignificantDays()
      This.CreateInternationalDays()
      This.CreateCustomDays()
   ENDPROC


   *-- Create hollydays
   PROCEDURE CreateHollyDays
      *
      * _mdcalendar::CreateHollyDays
      *
   ENDPROC


   *-- Create international  days
   PROCEDURE CreateInternationalDays
      *
      * _mdcalendar::CreateInternationalDays
      *
   ENDPROC


   *-- Create cutomer days
   PROCEDURE CreateCustomDays
      *
      * _mdcalendar::CreateCustomDays
      *
   ENDPROC


   *-- Create Significant Days
   PROCEDURE CreateSignificantDays
      *
      * _mdcalendar::CreateSignificantDays
      *
   ENDPROC


   *-- Create name days
   PROCEDURE CreateNameDays
      *
      * _mdcalendar::CreateNameDays
      *
   ENDPROC


ENDDEFINE
