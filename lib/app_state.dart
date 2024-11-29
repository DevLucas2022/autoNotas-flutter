import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _yAxis =
          prefs.getStringList('ff_yAxis')?.map(double.parse).toList() ?? _yAxis;
    });
    _safeInit(() {
      _xAxis =
          prefs.getStringList('ff_xAxis')?.map(double.parse).toList() ?? _xAxis;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _codigoSala = '';
  String get codigoSala => _codigoSala;
  set codigoSala(String value) {
    _codigoSala = value;
  }

  List<double> _yAxis = [12313.0];
  List<double> get yAxis => _yAxis;
  set yAxis(List<double> value) {
    _yAxis = value;
    prefs.setStringList('ff_yAxis', value.map((x) => x.toString()).toList());
  }

  void addToYAxis(double value) {
    yAxis.add(value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void removeFromYAxis(double value) {
    yAxis.remove(value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromYAxis(int index) {
    yAxis.removeAt(index);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void updateYAxisAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    yAxis[index] = updateFn(_yAxis[index]);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInYAxis(int index, double value) {
    yAxis.insert(index, value);
    prefs.setStringList('ff_yAxis', _yAxis.map((x) => x.toString()).toList());
  }

  List<double> _xAxis = [12312.0];
  List<double> get xAxis => _xAxis;
  set xAxis(List<double> value) {
    _xAxis = value;
    prefs.setStringList('ff_xAxis', value.map((x) => x.toString()).toList());
  }

  void addToXAxis(double value) {
    xAxis.add(value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void removeFromXAxis(double value) {
    xAxis.remove(value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromXAxis(int index) {
    xAxis.removeAt(index);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void updateXAxisAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    xAxis[index] = updateFn(_xAxis[index]);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInXAxis(int index, double value) {
    xAxis.insert(index, value);
    prefs.setStringList('ff_xAxis', _xAxis.map((x) => x.toString()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
