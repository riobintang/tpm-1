import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

String firstCurrency = "USD";
String secondCurrency = "IDR";
String secondValue = "0";

class CurrencyConvert extends StatefulWidget {
  const CurrencyConvert({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CurrencyConvert();
}

class _CurrencyConvert extends State<CurrencyConvert> {
  var items = ["USD", "IDR", "RUB", "EUR"];
  final TextEditingController _firstValueController = TextEditingController();
  //final TextEditingController _secondValue = TextEditingController();

  void _calculateConvert() {
    int? firstValue = int.tryParse(_firstValueController.text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Convert"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextField(controller: _firstValueController, keyboardType: TextInputType.number,),
              DropdownButton(
                  // Initial Value
                  value: firstCurrency,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      firstCurrency = newValue!;
                      //_changeDate();
                    });
                  })
            ],
          ),
          Row(
            children: [
              Text(secondValue),
              DropdownButton(
                  // Initial Value
                  value: secondCurrency,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      secondCurrency = newValue!;
                      //_changeDate();
                    });
                  })
            ],
          )
        ],
      )),
    );
  }
}
