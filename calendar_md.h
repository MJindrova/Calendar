
#DEFINE _mdCalendar_TD_NameDay          1
#DEFINE _mdCalendar_TD_HollyDay         2
#DEFINE _mdCalendar_TD_InternationalDay 4
#DEFINE _mdCalendar_TD_SignificantDay   8
#DEFINE _mdCalendar_TD_CustomDay        16

#DEFINE _mdCalendar_TD_All    _mdCalendar_TD_NameDay+_mdCalendar_TD_HollyDay+_mdCalendar_TD_InternationalDay+_mdCalendar_TD_SignificantDay+_mdCalendar_TD_CustomDay
#DEFINE _mdCalendar_TD_Without_NameDay    _mdCalendar_TD_HollyDay+_mdCalendar_TD_InternationalDay+_mdCalendar_TD_SignificantDay+_mdCalendar_TD_CustomDay
