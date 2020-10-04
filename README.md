# Editable

⚡️A highly customizable, editable table package for Flutter projects.

### Specs
[![pub](https://img.shields.io/pub/v/editable.svg?style=flat)](https://pub.dev/packages/editable)


This package allows you to create editable tables and spreadsheets with ease, either by providing inital row and column count
to display an empty table, or use it with predefined rows and column data sets.

**It has methods to save data from edited rows**. ❤️

## Features
* Save Edited Rows
* Save Edited cell 
* Customize cell data
* Add Empty rows
* Create Empty tables
* Customizable Save button
* Customize Table headers

### Spread Some :heart:
[![GitHub followers](https://img.shields.io/github/followers/godilite.svg?style=social&label=Follow)](https://github.com/godilite)

## Getting started

In the `pubspec.yaml` of your flutter project, add the following
dependency:

```yaml
dependencies:
  ...
  editable: "^1.0.1"
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
       {"title":'Name', 'index': 1, 'key':'name'},
       {"title":'Date', 'index': 2, 'key':'date'},
       {"title":'Month', 'index': 3, 'key':'month'},
       {"title":'Status', 'index': 4, 'key':'status'},
     ]; 
     ```
     [title] is the column heading
    
     [index] represents a unique id for each column of type [int]
    
     [key] an identifyer preferably a short string

- `rows`: an array of objects, where each object key represents a column [key],
    example:
    ```dart 
    List rows = [
                {"name": 'James Joe', "date":'23/09/2020',"month":'June',"status":'completed'}, 
                {"name": 'Daniel Paul', "date":'12/4/2020',"month":'March',"status":'new'}, 
            ];
    ```
    each objects should have its element positioned in same order as its column
- `rowCount`: Interger value of number of rows to be generated: Optional if row data is provided
- `columnCount`: Interger value of number of columns to be generated: Optional if column data is provided 

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
  - `createButtonAlign`: Aligns the button for adding new rows;
  - `createButtonIcon`: Icon displayed in the create new row button;
  - `createButtonColor`: Color for the create new row button;   
  - `createButtonShape`:   border shape of the create new row button
        ```dart
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
![Editable Table with Data](https://user-images.githubusercontent.com/41484542/95013572-08794580-0639-11eb-818d-8cab6ab4c51a.png)
![Empty SpreadSheet](https://user-images.githubusercontent.com/41484542/95013599-3ced0180-0639-11eb-83e0-501215627ccd.png)
![Table with save icons](https://user-images.githubusercontent.com/41484542/95013617-6a39af80-0639-11eb-8058-b3ccbe3d475f.png)

# Roadmap
The following are immediate work In progress for the next version of the project:
- Sortable column
- Peform mathematic operations between columns
- Search row data
- flexible column width customization

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

