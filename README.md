# Editable

⚡️A highly customizable, editable table package for Flutter projects.

### Specs
[![pub](https://img.shields.io/pub/v/editable.svg?style=flat)](https://pub.dev/packages/editable)

This package allows you to create editable tables and spreadsheets with ease, either by providing inital row and column count
to display an empty table, or use it with predefined rows and column data sets.

**It is compatible with Flutter Desktop (Windows, Linux, MacOS), IOS, Android, and Web**. ❤️

## Features
* Save Edited Rows
* Save Edited cell 
* Customize cell data
* Add Empty rows
* Create Empty tables
* Customizable Save button
* Customize Table headers
* Zebra - Stripe table
* Style table border
* Adjustable Column widths


### Spread Some :heart:
[![GitHub followers](https://img.shields.io/github/followers/godilite.svg?style=social&label=Follow)](https://github.com/godilite)

## Support us

You can buy us a cup of coffee. Sponsor our next milestones

[![Patreon](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://www.patreon.com/godilite)


## Getting started

In the `pubspec.yaml` of your flutter project, add the following
dependency:

```yaml
dependencies:
  ...
  editable: "^1.1.2"
```

In your library add the following import:

```dart
import 'package:editable/editable.dart';
```

## API

### Create Table

To create a new table, use the `Editable()` widget class and provide the table data  properties as follows:
- `column`: an array of objects example
     example:
     ```dart 
     List cols = [
       {"title":'Name', 'widthFactor': 0.2, 'key':'name'},
       {"title":'Date', 'widthFactor': 0.1, 'key':'date'},
       {"title":'Month', 'widthFactor': 0.1, 'key':'month'},
       {"title":'Status',  'key':'status'},
     ]; 
     ```
     [title] is the column heading
    
     [widthFactor] a custom size ratio of each column width, if not provided, defaults to  [columnRatio = 0.20]
      ```dart
      'widthFactor': 0.1 //gives 10% of screen size to the column
      'widthFactor': 0.2 //gives 20% of screen size to the column
      ```
    
     [key] an identifyer preferably without space and special characters

- `rows`: an array of objects, where each object key represents a column [key],
  example:
    ```dart
    List rows = [
        {"name": 'James Joe', "date":'23/09/2020',"month":'June',"status":'completed'},
        {"date":'12/4/2020',"month":'March',"name": 'Daniel Paul', "status":'new'},
      ];
    ```
  Each objects *DO NOT* have to be positioned in same order as its column
 
- `rowCount`: Interger value of number of rows to be generated: Optional if row data is provided
- `columnCount`: Interger value of number of columns to be generated: Optional if column data is provided 
- `columnRatio`: fraction of the screen width occupied by each column. This is usefull for shrinking and expanding table width
  example: 
  ```dart
    columnRation: 0.2 //sets each column to occupy 20 percent of screen width
  ```

### Customization
  - `borderColor`:  Color of table border
  - `borderWidth`: width of table borders  
  - `tdPaddingLeft`:  Table data cell padding left 
  - `tdPaddingTop`: Table data cell padding top
  - `tdPaddingRight`:  Table data cell padding right;
  - `tdPaddingBottom`: Table data cell padding bottom;
  - `tdAlignment`: Aligns the table data ;
  - `tdStyle`: Style the table data;
  - `thPaddingLeft`: Table header cell padding left;
  - `thPaddingTop`: Table header cell padding top;
  - `thPaddingRight`:  Table header cell padding right;  
  - `thPaddingBottom`: Table header cell padding bottom;
  - `trHeight`: Table Row Height, cannot be less than 40.0 ;
  - `thWeight`: Table headers fontweight;
  - `thSize`: Table headers fontSize;
  - `showSaveIcon`:  Toogles the save button, if [true] displays an icon to save rows, 
        adds an addition column to the right
  - `saveIcon`: Icon for to save row data, example:
        ```dart
        saveIcon : Icons.add
        ```
  - `saveIconColor`: Color for the save Icon
  - `saveIconSize`:   Size for the saveIcon
  - `showCreateButton`:  displays a button that adds a new row onPressed
  - `stripeColor1`: The first row alternate color, if stripe is set to true
  - `stripeColor2`:     The Second row alternate color, if stripe is set to true;
  
   - `zebraStripe`: Enable zebra-striping, set to false by default
      ```// if zebraStripe is enabled, you can style the colors [stripeColor1] and [stripeColor2]```
  - `createButtonAlign`: Aligns the button for adding new rows;
  - `createButtonIcon`: Icon displayed in the create new row button;
  - `createButtonColor`: Color for the create new row button;   
  - `createButtonShape`:   border shape of the create new row button
        ```
        createButtonShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
        )
        ```
  - `createButtonLabel`:  Label for the create new row button
 
### Save methods

- `onSubmitted`:  [onSubmitted] callback is triggered when the enter button is tapped (for desktop users)
     Or when edit is complete(on mobile) on a table data cell
    it returns a value of the edited cell data
 
- `onRowSaved`: [onRowSaved] callback is triggered when a [saveButton] is pressed.
   returns only values if row is edited, otherwise returns a string ['no edit']

# Screenshots
### Editable Table with Data (zebraStripe)
![Editable Table with Data](https://user-images.githubusercontent.com/41484542/96218374-85cb8100-0f7c-11eb-9bd3-f3154073d747.png)
### Empty SpreadSheet (zebraStripe)
![Empty SpreadSheet](https://user-images.githubusercontent.com/41484542/96218512-caefb300-0f7c-11eb-93e1-77fd66f7cc2b.png)
### Empty SpreadSheet (No Stripe)
![Empty Sheet](https://user-images.githubusercontent.com/41484542/96218567-e490fa80-0f7c-11eb-8df1-03aebd4b4ee4.png)
### Table with Save Icon
![Table with save icons](https://user-images.githubusercontent.com/41484542/95015531-4da37480-0645-11eb-965a-f3d3507c18da.png)

# Roadmap
The following are immediate work In progress for the next version of the project:
- Sortable column
- Perform mathematical operations between columns
- Search row data 
- Export table to different formats

# Tutorials
The Following are resources to help you build with Editable: 
- [Creating Editable Tables With Flutter](https://medium.com/swlh/creating-editable-tables-with-flutter-5536b593c29a)
- [Keeping it local: Managing a Flutter app's data (Andrew Fitz Gibbon)](https://www.youtube.com/watch?v=xjhxm3foCMk&t=2743s)


# Contribution

I highly encourage the community to step forward and improve this
library further. You can fix any reported bug, propose or implement new
features, write tests, etc.

Here is a quick list of things to remember
* Check the open issues before creating a new one,
* Help me in reducing the number of open issues by fixing any existing
  bugs,
* Check the roadmap to see if you can help in implementing any new
  feature,
* You can contribute by writing unit and integration tests for this
  library,
* If you have any new idea that aligns with the goal of this library,
  feel free to raise a feature request and discuss it.

# Author

This Editable table package for Flutter is developed by [Godwin Asuquo](https://github.com/godilite)

Also, as always, please give us a star to help!


