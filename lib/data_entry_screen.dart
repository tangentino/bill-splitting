import 'package:bill_splitting/constants.dart';
import 'package:flutter/material.dart';

import '../components/base_card.dart';
import '../components/ic_button.dart';
import '../components/ic_tx_widget.dart';
import '../screens/result_screen.dart';

enum TipLevel {
  one,
  two,
  three,
}

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({Key? key}) : super(key: key);

  @override
  State<DataEntryScreen> createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  // Instance variables
  double totalBill = 0.0;
  TipLevel? tipLevel;
  int persons = 2;
  double billPerPerson = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text(
          'BILL SPLITTING',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: kBrightTextColor,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              child: BaseCard(
                  theColor: kDarkCardColor,
                  theChild: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Total Bill (before tip)',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kBrightTextColor,
                        ),
                      ),
                      Text(
                        totalBill.toString(),
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          color: kBrightTextColor,
                        ),
                      ),
                      Slider(
                          value: totalBill,
                          min: 0.0,
                          max: 1000.0,
                          divisions: 100,
                          onChanged: (double newValue) {
                            setState(() {
                              totalBill = newValue;
                            });
                          }),
                    ],
                  ),
                  theOnTapFunc: () {
                    print('pressed');
                  }),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Theme(
                data: ThemeData(
                  iconTheme: IconThemeData(
                    color: kDarkCardColor,
                  ),
                ),
                child: DefaultTextStyle(
                  style: TextStyle(color: kBrightTextColor),
                  child: BaseCard(
                    theColor: kDarkCardColor,
                    theChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(persons.toString(),
                                style: TextStyle(fontSize: 60.0)),
                            Text(
                                " persons                    ", // bad design. Cheating here.
                                style: TextStyle(fontSize: 20.0)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IcButton(
                              theColor: kButtonColor,
                              theIconData: Icons.remove,
                              theOnPressedFunc: () {
                                setState(() {
                                  print("remove btn pressed");
                                  persons--;
                                  if (persons < 2) persons = 2;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            IcButton(
                              theColor: kButtonColor,
                              theIconData: Icons.add,
                              theOnPressedFunc: () {
                                setState(() {
                                  print("add btn pressed xx");
                                  persons++;
                                  print(persons.toString());
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Theme(
              data: ThemeData(
                iconTheme: IconThemeData(
                  color: kDarkCardColor,
                ),
                textTheme: const TextTheme(
                  bodyText2: TextStyle(
                    fontSize: 14.0,
                    color: kDarkCardColor,
                  ),
                ),
              ),
              child: BaseCard(
                theColor: kDarkCardColor,
                theChild: Row(
                  children: <Widget>[
                    Expanded(
                      child: DefaultTextStyle(
                        style: TextStyle(fontSize: 24, color: kDarkCardColor),
                        child: BaseCard(
                          theColor:
                          //tipLevel == TipLevel.one ? Colors.amber : Colors.blue,
                          tipLevel == TipLevel.one
                              ? kExtra2Color
                              : kButtonColor,
                          theChild: IcTxWidget(
                              iconData: Icons.sentiment_dissatisfied,
                              iconSize: 80,
                              gapSize: 5,
                              txt: '10%'),
                          theOnTapFunc: () {
                            setState(() {
                              print("10%");
                              tipLevel = TipLevel.one;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: DefaultTextStyle(
                        style: TextStyle(fontSize: 24, color: kDarkCardColor),
                        child: BaseCard(
                          theColor:
                          //tipLevel == TipLevel.two ? Colors.amber : Colors.blue,
                          tipLevel == TipLevel.two
                              ? kExtra2Color
                              : kButtonColor,
                          theChild: IcTxWidget(
                              iconData: Icons.sentiment_neutral,
                              iconSize: 80,
                              gapSize: 5,
                              txt: "15%"),
                          theOnTapFunc: () {
                            setState(() {
                              print("15%");
                              tipLevel = TipLevel.two;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: DefaultTextStyle(
                        style: TextStyle(fontSize: 24, color: kDarkCardColor),
                        child: BaseCard(
                          theColor:
                          //tipLevel == TipLevel.three ? Colors.amber : Colors.blue,
                          tipLevel == TipLevel.three
                              ? kExtra2Color
                              : kButtonColor,
                          theChild: IcTxWidget(
                              iconData: Icons.sentiment_satisfied,
                              iconSize: 80,
                              gapSize: 5,
                              txt: "20%"),
                          theOnTapFunc: () {
                            setState(() {
                              print("20%");
                              tipLevel = TipLevel.three;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: BaseCard(
                theColor: kButtonColor,
                theChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SPLIT THE BILL",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: kBrightTextColor,
                    ),
                  ),
                ),
                theOnTapFunc: () {
                  double billWithTip = 0.0;

                  switch (tipLevel) {
                    case TipLevel.one:
                      {
                        billWithTip = 1.1 * totalBill;
                      }
                      break;
                    case TipLevel.two:
                      {
                        billWithTip = 1.15 * totalBill;
                      }
                      break;
                    case TipLevel.three:
                      {
                        billWithTip = 1.2 * totalBill;
                      }
                      print(billPerPerson);
                      break;
                    default:
                      {
                        billWithTip = 1 * totalBill;
                      }
                  }
                  billPerPerson = billWithTip / persons;
                  print(billPerPerson.toString());

                  // Load the result screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ResultScreen(billPerPerson: billPerPerson),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
