import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operand = '';
  String _outputHistory = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = '';
      _outputHistory = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _outputHistory = _output + _operand;
      _output = '0';
    } else if (buttonText == '.') {
      if (!_output.contains('.')) {
        _output += buttonText;
      }
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      String result = '0';
      if (_operand == '+') {
        result = (_num1 + _num2).toString();
      } else if (_operand == '-') {
        result = (_num1 - _num2).toString();
      } else if (_operand == '×') {
        result = (_num1 * _num2).toString();
      } else if (_operand == '÷') {
        if (_num2 != 0) {
          result = (_num1 / _num2).toString();
        } else {
          result = 'Error';
        }
      }
      _outputHistory = double.parse(result).toStringAsFixed(
          double.parse(result).truncateToDouble() == double.parse(result)
              ? 0
              : 1);
      _output = double.parse(result).toStringAsFixed(result.contains('.')
          ? 2
          : 0); // Display only if fractional part exists
      _num1 = 0.0;
      _num2 = 0.0;
      _operand = '';
    } else {
      if (_output == '0' && buttonText != '0') {
        _output = buttonText;
      } else if (_output != '0') {
        _output += buttonText;
      }
      _outputHistory = _output;
    }
    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellowAccent[300],
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              alignment: Alignment.centerRight,
              child: Text(
                _outputHistory,
                style: const TextStyle(
                  fontSize: 42.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        buildButton('7'),
                        buildButton('8'),
                        buildButton('9'),
                        buildButton('÷'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        buildButton('4'),
                        buildButton('5'),
                        buildButton('6'),
                        buildButton('×'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        buildButton('1'),
                        buildButton('2'),
                        buildButton('3'),
                        buildButton('-'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        buildButton('.'),
                        buildButton('0'),
                        buildButton('C'),
                        buildButton('+'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        buildButton('='),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
