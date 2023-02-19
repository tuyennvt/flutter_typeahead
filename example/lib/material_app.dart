import 'dart:ui';

import 'package:example/data.dart';
import 'package:example/map_data.dart';
import 'package:example/scroll_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_typeahead demo',
      scrollBehavior: MaterialScrollBehavior()
          .copyWith(dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch}),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: FormExample(),
      ),
    );
  }
}

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _typeAheadController = TextEditingController();

  String? _selectedCity;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: this._formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TypeAheadGroupFormField<MapData>(
              textFieldGroupConfiguration: TextFieldGroupConfiguration(
                decoration: InputDecoration(labelText: 'City'),
                controller: this._typeAheadController,
              ),
              suggestionsGroupCallback: (pattern) {
                return dataGroup;
              },
              titleGroupBuilder: (context, String title) {
                return Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(title),
                  ),
                );
              },
              itemBuilder: (context, MapData suggestion) {
                return ListTile(
                  title: Text(suggestion.label),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (MapData suggestion) {},
              validator: (value) => value!.isEmpty ? 'Please select a city' : null,
              onSaved: (value) => this._selectedCity = value,
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (this._formKey.currentState!.validate()) {
                  this._formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Your Favorite City is ${this._selectedCity}'),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
