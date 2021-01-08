import 'package:flutter/material.dart';

import 'language_helper.dart';

LanguagesHelper languages = LanguagesHelper();

RoundedRectangleBorder kButtonOutlineShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
  side: BorderSide(color: Colors.white),
);

const kNameCountryTextStyle12 = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

const kTextStyle12 = TextStyle(
  fontFamily: 'Open Sans',
  fontSize: 12.0,
);

const kTextFieldDecor = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Digite o nome da cidade',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);
