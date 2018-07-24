# Calendar class


## Files
* calendar_md.prg - nonvisual class for working with dates
* calendar.vcx - library with base UI calendar classes
* calendar.scx - example of using UI calendar class
* calendar_lng.prg - base library for collaboration with UI (derived from _mdcalendar)
* calendar_lngat.prg - Austria localization for UI
* calendar_lngbe.prg - Belgium localization for UI
* calendar_lngca.prg - Canada localization for UI
* calendar_lngch.prg - Switzerland localization for UI
* calendar_lngcs.prg - Czech localization for UI
* calendar_lngde.prg - German localization for UI
* calendar_lnges.prg - Spanish localization for UI
* calendar_lngfr.prg - French localization for UI
* calendar_lnggb.prg - Great Britain localization for UI
* calendar_lnghu.prg - Hungary localization for UI
* calendar_lngit.prg - Italy localization for UI
* calendar_lngli.prg - Liechtenstein localization for UI
* calendar_lngnl.prg - Netherlands localization for UI
* calendar_lngpl.prg - Polish localization for UI
* calendar_lngpt.prg - Portugal localization for UI
* calendar_lngsk.prg - Slovak localization for UI
* calendar_lngtl.prg - Timor-Leste localization for UI
* calendar_lngtr.prg - Turkish localization for UI
* calendar_lngus.prg - USA localization for UI



## Examples
```
SET PROCEDURE TO calendar_md.VCX ADDITIVE
loCalendar=CREATEOBJECT("_mdcalendar") 
loCalendar.LoadMDFromXML('enus.xml')
?loCalendar.GetProximateWorkDay(DATE()) && get proximate work day
?loCalendar.GetWeekDays(DATE(2018,07,01),DATE(),.F.) && get work days from date interval
?loCalendar.IsHollyday(DATE(2018,07,04)) && Check if day is hollyday
?loCalendar.IsWorkday(DATE(2018,07,04)) && Check if day is work day
?loCalendar.GetEasterSunday(DATE(2018,01,01)) && return Easter Sunday for year 2018
?loCalendar.GetNameDayText(DATE(2018,07,04),.T.) && return names in day (for europe calendar)
?loCalendar.GetDayBaseName(DATE(2018,07,04))
?loCalendar.GetDayCaption(DATE(2018,07,04),1+2+4+8+16) && return all day caption
``` 

## XML metadata
### Files
cs.xml - Czech data
de.xml - German data
deat.xml - Austria data
debe.xml - Belguim - German data
dech.xml - Switzerland - German data
deli.xml - Liechtenstein data
enca.xml - Canada - English data
engb.xml - United Kingdom data
enus.xml - US english data
es.xml - Spain data
frbe.xml - Belgium-French data
frca.xml - Canada - French data
frch.xml - Switzerland - French data
frfr.xml - French data
hu.xml - Hungarian data
it.xml - Italien data
itch.xml - Switzerland - Italian data
nl.xml - Dutch-standard data
nlbe.xml - Belgium-Dutch data
pl.xml - Polish data
pt.xml - Portugal data
sk.xml - Slovak data
tl.xml - Philippines data 
tr.xml - Turkish data

### Days localization
`<days></days>`

### Months localization
`<months></months>` 

### Hollydays definition
`<hollydays></hollydays>`

### International days definition
`<internationaldays></internationaldays>`

### Significant days definition
`<significantdays></significantdays>`

### Name days definition
`<namedays></namedays>`

### Days definition
`<day />` 
`key=""` - unique key for day in year. Can be text or number (MMDD)
`name=""` - name of day
`method=""` - method for day calculation 
`metadata=""` - metadata for day calculation
`multi=""` - method can return more days
`validity=""` - expression for time validity

#### Methods definition
|  Method | Metadata | Format |
| ------------ | ------------ | ------------ |
|`GetFirstDayOfMonthMD`|`0902`|`[MONTH][DOW]`|
|`GetLastDayOfMonthMD`|`0502`|`[MONTH][DOW]`|
|`GetXDayOfMonthMD`|`020203`|`[MONTH][DOW][N-TH]`|
|`GetFirstWeekofMonthMD`|`09`|`[MONTH]`|
|`GetLastWeekofMonthMD`|`09`|`[MONTH]`|
|`GetNearstDayOfMonthMD`|`040901`|`[MONTH][DAY][DOW]`|
|`GetAscensionDay`|  |  |
|`GetCarnival`|  |  |
|`GetCorpusChristi`|  |  |
|`GetEasterMonday`|  |  |
|`GetEasterSunday`|  |  |
|`GetGoodFriday`|  |  |
|`GetMaundyThursday`|  |  |
|`GetPentecost`|  |  |
|`GetWhitMonday`|  |  |

