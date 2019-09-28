import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color gradientStartColor = Color(0xff636FA4);
const Color gradientEndColor = Color(0xffE8CBC0);

const Color gradientStartColor2 = Color(0xffee9ca7);
const Color gradientEndColor2 = Color(0xffffdde1);

class TipCalculatorApp extends StatefulWidget {
  @override
  _TipCalculatorAppState createState() => _TipCalculatorAppState();
}

class _TipCalculatorAppState extends State<TipCalculatorApp> {
  bool isCalculatePressed = false;
  int people = 1;
  double tipPerPerson = 0;
  double tipTotalPerPerson = 0;
  final _formKey = GlobalKey<FormState>();
  TextEditingController billTextEditingController = TextEditingController();
  TextEditingController tipTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _buildTipCalculatorPage()),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildTipCalculatorPage() {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
                    child: Text(
                      "Tip Calculator",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildTipBillAmount(),
                  SizedBox(
                    height: 10.0,
                  ),
                  _buildTipBillTip(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildNumberOfPeoples(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildCalculateButton(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _buildResult(),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildResult() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20.0, right: 10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 10.0,
                color: Colors.black12,
                padding: EdgeInsets.all(10.0),
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    people == 1 || isCalculatePressed == false
                        ? Text(
                            "Tip",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        : Text(
                            "Tip per person",
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                    Text(
                      tipPerPerson.toString(),
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10.0, right: 20.0),
              child: RaisedButton(
                color: Colors.black12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 10.0,
                padding: EdgeInsets.all(10.0),
                onPressed: () {},
                child: Column(
                  children: <Widget>[
                    people == 1 || isCalculatePressed == false
                        ? Text(
                            "Total",
                            style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        : Text(
                            "Total per person",
                            style: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                    Text(
                      tipTotalPerPerson.toString(),
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculateButton() {
    return Container(
      width: 150,
      margin: EdgeInsets.only(left: 20.0, right: 10.0),
      child: RaisedButton(
        color: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 10.0,
        padding: EdgeInsets.all(10.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _calculateTip();
          }
        },
        child: Center(
          child: Text(
            "Calculate",
            style: TextStyle(color: Colors.white, fontSize: 22.0),
          ),
        ),
      ),
    );
  }

  Widget _buildNumberOfPeoples() {
    return Container(
      width: 220,
      margin: EdgeInsets.only(left: 20.0, right: 10.0),
      child: RaisedButton(
//        color: lightText,
        color: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        elevation: 10.0,
        padding: EdgeInsets.all(10.0),
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _calculateTip();
          }
        },
        child: Column(
          children: <Widget>[
            Text(
              "No. Of People",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [gradientStartColor2, gradientEndColor2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.4, 1.0]),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 25.0,
                    icon: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      if (people != 1) {
                        setState(() {
                          isCalculatePressed = false;
                          people--;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(width: 10.0),
                Text(
                  people.toString(),
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(width: 10.0),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [gradientStartColor2, gradientEndColor2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.4, 1.0]),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    iconSize: 25.0,
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isCalculatePressed = false;
                        people++;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipBillTip() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: TextFormField(
        inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
        controller: tipTextEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: "Bill Tip (%)",
          hintStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        validator: (String billTip) {
          if (billTip.isEmpty) {
            return "Bill tip is required!!";
          }
        },
      ),
    );
  }

  Widget _buildTipBillAmount() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: TextFormField(
        controller: billTextEditingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          hintText: "Bill Amount",
          hintStyle: TextStyle(
            color: Colors.blueGrey,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        validator: (String billAmount) {
          if (billAmount.isEmpty) {
            return "Bill amount is required!!";
          }
        },
      ),
    );
  }

  void _calculateTip() {
    FocusScope.of(context).requestFocus(FocusNode());

    if (people > 1) {
      isCalculatePressed = true;
    } else {
      isCalculatePressed = false;
    }

    tipPerPerson = (double.parse(billTextEditingController.text) /
        (int.parse(tipTextEditingController.text) * people));
    print("tipPerPerson ${tipPerPerson}");

    tipTotalPerPerson =
        (double.parse(billTextEditingController.text) / people) + tipPerPerson;
    print("tipTotalPerPerson ${tipTotalPerPerson}");

    billTextEditingController.clear();
    tipTextEditingController.clear();
    setState(() {});
  }
}
