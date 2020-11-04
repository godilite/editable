## [1.0.0] - 04/10/2020.

* This Initial release has the following features:
* Save Edited Rows
* Save edited cell 
* Customize cell data
* Add empty rows
* Create empty tables
* Customizable save button
* Customize table headers

## [1.0.1] - 04/10/2020.

* minor edit to package metatags

## [1.0.2] - 04/10/2020.

* minor edit to package readme

## [1.0.3] - 04/10/2020.

* minor edit to package readme
* compatability check passed for all OS

## [1.0.4] - 04/10/2020.

* fix: removes Space showing on small screen sizes if saveIcon is shown
* compatability check passed for all OS
* formats code based on dartfmt

## [1.0.5] - 05/10/2020.

* Bug Fix: table header alignments when saveRow icon is shown

## [1.0.6] - 07/10/2020.

* Bug Fix: Align table headers
* Refactor: Adds helper functions
* Change default button for createRowButton

## [1.0.7] - 08/10/2020.

* Bug Fix: Table color set to transparent
* This allows table to take parent widget color property

## [1.0.8] - 11/10/2020.

* New Feature: Horizontal and vertical scrollable
* New Table property: [columnRatio] sets the fraction of screen width occupied by each column

## [1.0.9] - 12/10/2020.

* Bug fix: A known behaviour where table doesnot rebuild with new data was fixed. This fix ensures that new rows can be added at runtime

## [1.1.0] - 12/10/2020.

* Bug fix: issues with width constraint for column element

## [1.1.1] - 12/10/2020.

* New feature: Zebra stripe table rows
* Set prefered colors for zebra striping
* Order row data to column [key] parameter 

## [1.1.2] - 28/10/2020.

* New feature: Adjustable Column width
* Replaced the [index] parameter of the column with [widthFactor]
* [widthFactor] is a double, used to assign percentage width to each column

## [1.1.3] - 04/11/2020.

* New feature: Use GlobalKey State to get edited row data
* New feature: Use GlobalKey State to create new row
* This enable creating row and saving edited rows anywhere outside the Editable widget
