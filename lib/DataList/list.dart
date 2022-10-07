import 'package:flutter/material.dart';
class Data {
  Data({
    required this.id ,
    required this.Date ,
    required this.Clock_In,
    required this.Clock_Out,
    required this.Break_Time,
    required this.Late_By,
    required this.Early_By,
    required this.Working_Hours,
    required this.isSelected,
  });
int   id ;
  String  Date ;
  int Clock_In;
  String Clock_Out;
  String Late_By;
  String Early_By;
  String Break_Time;
  String Working_Hours;
  bool isSelected;
}

class DataTableExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DataTableExampleState();
  }
}

class DataTableExampleState extends State<DataTableExample> {

  List<Data> _items = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }

  List<Data> _generateItems() {
    return List.generate(15, (int index) {
      return Data(
          id:index + 1,
           Date:"01/10/2022" ,
      Clock_In:index + 1,
      Clock_Out:'00:00',
       Late_By:'00:49',
          Early_By:'00:00',
         Break_Time:'00:00',
          Working_Hours:'07:21:36',
        isSelected:false
      );
    });
  }

  void updateSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(
        label: const Text('Date'),
        numeric: false, // Deliberately set to false to avoid right alignment.
      ),
      DataColumn(
        label: Text('Clock In'),
        numeric: false,

        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.Clock_In.compareTo(item2.Clock_In));
          } else {
            _items.sort((item1, item2) => item2.Clock_In.compareTo(item1.Clock_In));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: Text('Clock Out'),
        numeric: false,  // Deliberately set to false to avoid right alignment.

        onSort: (int columnIndex, bool ascending) {
          if (ascending) {
            _items.sort((item1, item2) => item1.Clock_Out.compareTo(item2.Clock_Out));
          } else {
            _items.sort((item1, item2) => item2.Clock_Out.compareTo(item1.Clock_Out));
          }

          setState(() {
            _sortColumnIndex = columnIndex;
            _sortAscending = ascending;
          });
        },
      ),
      DataColumn(
        label: Text('Break Time'),
        numeric: false,

      ),
      DataColumn(
        label: Text('Late By'),
        numeric: false,

      ),
      DataColumn(
        label: Text('Early By'),
        numeric: false,

      ),  DataColumn(
        label: Text('Working Hours'),
        numeric: false,

      ),

    ];
  }

  DataRow _createRow(Data item) {
    return DataRow(
      // index: item.id, // for DataRow.byIndex
      key: ValueKey(item.id),
      selected: item.isSelected,
      onSelectChanged: (bool? isSelected) {
        if (isSelected != null) {
          item.isSelected = isSelected;

          setState(() {});
        }
      },
      color: MaterialStateColor.resolveWith((Set<MaterialState> states) => states.contains(MaterialState.selected)
          ? Colors.red
          : Color.fromARGB(100, 215, 217, 219)
      ),
      cells: [
        DataCell(
          Text(item.Date.toString()),
        ),
        DataCell(
          Text(item.Clock_In.toString()),
          placeholder: false,
          showEditIcon: false,
          onTap: () {
            print('onTap');
          },
        ),
        DataCell(
            Text(item.Clock_Out.toString())
        ),
        DataCell(
          Text(item.Break_Time),
        ),
        DataCell(
          Text(item.Late_By),
        ),
        DataCell(
          Text(item.Early_By),
        ),
        DataCell(
          Text(item.Working_Hours),
        ),


      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(top: 15,left: 25,right: 15),
      child: Container(
          decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(
                    8.0),),),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: DataTable(
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columnSpacing: 0,
               // dividerThickness: 5,
                onSelectAll: (bool? isSelected) {
                  if (isSelected != null) {
                    _items.forEach((item) {
                      item.isSelected = isSelected;
                    });

                    setState(() {});
                  }
                },

                // dataRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) => states.contains(MaterialState.selected)
                //     ? Colors.blue
                //     : Color.fromARGB(100, 215, 217, 219)
                // ),
                // dataRowHeight: 40,
                //dataTextStyle: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
               // headingRowColor: MaterialStateColor.resolveWith((states) => Colors.white),
             //   headingRowHeight: 80,
              //  headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
               // horizontalMargin: 10,
                showBottomBorder: true,
                showCheckboxColumn: false,
                columns: _createColumns(),
                rows: _items.map((item) => _createRow(item))
                    .toList(),
              ),
            ),
          ),
    );

  }
}