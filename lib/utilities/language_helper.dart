import 'package:conews_flutter/localization/app_localization.dart';
import 'package:flutter/material.dart';

class LanguagesHelper {
  String newCases(BuildContext context) {
    return AppLocalizations.of(context).translate('new_case');
  }

  String newDeaths(BuildContext context) {
    return AppLocalizations.of(context).translate('new_deaths');
  }

  String charts(BuildContext context) {
    return AppLocalizations.of(context).translate('charts');
  }

  String totalCases(BuildContext context) {
    return AppLocalizations.of(context).translate('total_cases');
  }

  String totalDeaths(BuildContext context) {
    return AppLocalizations.of(context).translate('total_deaths');
  }

  String totalRecuperados(BuildContext context) {
    return AppLocalizations.of(context).translate('total_recovered');
  }

  String update(BuildContext context) {
    return AppLocalizations.of(context).translate('update');
  }

  String updateBottom(BuildContext context) {
    return AppLocalizations.of(context).translate('update_bottom');
  }

  String titlePage(BuildContext context) {
    return AppLocalizations.of(context).translate('title_page');
  }

  String clickOpen(BuildContext context) {
    return AppLocalizations.of(context).translate('click_open');
  }
}
