import 'package:flutter/material.dart';

//main
void main() => runApp(
  MaterialApp(title: 'TipCalculator', home: TipCalculator())
);


//class
class TipCalculator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    double billAmount = 0.0;
    double tipPercent = 0.0;

    //Create TextField
    TextField billAmountField = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Bill Amount'),

      onChanged: (String value){
        try{
          billAmount = double.parse(value);
        }catch(exception){
          billAmount = 0.0;
        }
      },
    );

    TextField tipPercentField = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Tip %', hintText: '15'),

      onChanged: (String value){
        try{
          tipPercent = double.parse(value);
        }catch(exception){
          tipPercent = 0.0;
        }
      },
    );

    //Create Button
    RaisedButton calculateButton = RaisedButton(
      child: Text('Calculate'),
      onPressed: (){
        double calculateTip = billAmount * tipPercent / 100.0;
        double total = billAmount + calculateTip;

        // Generate Dialog
        AlertDialog dialog = AlertDialog(
          content: Text('Tip : \$$calculateTip \n Total: \$$total '),
        );

        showDialog(context: context, builder: (BuildContext context) => dialog); // to show dialog

      }, // onPressed
    );


    Container container = Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          billAmountField,
          tipPercentField,
          calculateButton
        ],
      ),
    );

    AppBar appBar = AppBar(
      title: Text('Tip Calculator'),
    );


    Scaffold scaffold = Scaffold(
      appBar:  appBar,
      body: container,
    );

    return scaffold;

  }
}
