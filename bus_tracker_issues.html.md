#### Known [Bus Tracker][track] Issues:

1. Information can be several minutes old.
2. Age of information is not indicated.
3. Sometimes, not all buses are displayed.
4. In certain circumstances, buses may appear on the wrong route.
5. There are separate bus trackers for [Amherst][track], [Northampton][ntrack], and [Springfield][strack]. Routes common to multiple regions only appear on one bus tracker.
6. Information in the bus icon pop-up window can be misleading or inaccurate:
    * "Last updated on:" is not when the bus was at its shown location.
    * "Status:" (ON-TIME, LATE, EARLY) is sometimes wrong.
    * "Last Stop:" is sometimes contradicted by the location of the bus' icon.
7. The [text-only][text] main page is missing route numbers.
8. The [text-only][text] stops pages do not display times for Routes 34 and 35.

#### Future Plans:

* Improve accuracy of information.
* Indicate age of information.
* Add route numbers to the main page of the [text-only version][text].
* Add Routes 34 and 35 to the [text-only version][text].
* Combine all PVTA routes onto one bus tracker.
* Add departure estimates to: 
    * The [trip planner][trip] (using [GTFS-realtime][gtfs])
    * The bus stops mobile pages (QRCodes posted at bus stops currently display scheduled times).

Please [contact PVTA][cpvta] with any questions or suggestions.  

[gtfs]: https://developers.google.com/transit/gtfs-realtime/
[track]: http://uts.pvta.com:81/InfoPoint
[ntrack]: http://ntf.pvta.com:81/InfoPoint
[strack]: http://stf.pvta.com:81/InfoPoint
[text]: http://uts.pvta.com:81/infopoint/noscript.aspx
[cpvta]: http://www.pvta.com/contact.php
[trip]: trip_planner.html
