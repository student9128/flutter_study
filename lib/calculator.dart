import 'package:flutter/material.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String _text = '';
  String _beforeText = '';
  bool _isResult = false;
  String _operateText = '';

  void _onValueChange(String text) {
    setState(() {
      switch (text) {
        case 'AC':
          _text = '0';
          _beforeText = '0';
          _isResult = false;
          break;
        case '+/-':
          if (_text.startsWith('-')) {
            _text = _text.substring(1);
          } else {
            _text = '-$_text';
          }
          break;
        case '%':
          var d = _value2Double(_text);
          _isResult = true;
          _text = '${d / 100}';

          break;
        case '+':
        case '-':
        case 'x':
        case '÷':
          _isResult = false;
          _operateText = text;
          break;
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
        case '.':
          if (_isResult) {
            _text = text;
          }
          if (_operateText.isNotEmpty && _beforeText.isEmpty) {
            _beforeText = _text;
            _text = '';
          }
          _text += text;
          if (_text.startsWith('0')) {
            _text = _text.substring(1);
          }
          break;
        case '=':
          double d = _value2Double(_beforeText);
          double d1 = _value2Double(_text);
          switch (_operateText) {
            case '+':
              _text = '${d + d1}';
              break;
            case '-':
              _text = '${d - d1}';
              break;
            case 'x':
              _text = '${d * d1}';
              break;
            case '÷':
              _text = '${d / d1}';
              break;
          }
          _beforeText = '';
          _isResult = true;
          _operateText = '';
          break;
      }
    });
  }

  double _value2Double(String value) {
    if (_text.startsWith('-')) {
      var substring = value.substring(1);
      return double.parse(substring) * -1;
    } else {
      return double.parse(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("计算器"),
      ),
      body: Container(
//        color: Color(0xfff4f6ff),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
              color: Colors.grey[300],
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 10),
              child: Text(
                '$_text',
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
              ),
            )),
            SizedBox(
              height: 20,
            ),
            _CalculatorKeyboard(
              onValueChange: _onValueChange,
            ),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}

class _CalculatorItem extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;
  final Color highlightColor;
  final double width;
  final ValueChanged<String> onValueChange;

  _CalculatorItem(
      {this.text,
      this.textColor,
      this.color,
      this.highlightColor,
      this.width,
      this.onValueChange});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: InkWell(
        onTap: () {
          onValueChange('$text');
        },
        borderRadius: BorderRadius.all(Radius.circular(5)),
        highlightColor: highlightColor ?? color,
        child: Container(
          width: width ?? 70,
          height: 70,
          padding: EdgeInsets.only(left: width == null ? 0 : 25),
          alignment: width == null ? Alignment.center : Alignment.centerLeft,
          child: Text(
            '$text',
            style: TextStyle(color: textColor ?? Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}

final List<Map> _keyboardList = [
  {
    'text': 'AC',
    'textColor': Colors.black,
    'color': Color(0xFFA5A5A5),
    'highlightColor': Color(0xFFD8D8D8)
  },
  {
    'text': '+/-',
    'textColor': Colors.black,
    'color': Color(0xFFA5A5A5),
    'highlightColor': Color(0xFFD8D8D8)
  },
  {
    'text': '%',
    'textColor': Colors.black,
    'color': Color(0xFFA5A5A5),
    'highlightColor': Color(0xFFD8D8D8)
  },
  {
    'text': '÷',
    'color': Color(0xFFE89E28),
    'highlightColor': Color(0xFFEDC68F)
  },
  {'text': '7', 'color': Color(0xFF363636)},
  {'text': '8', 'color': Color(0xFF363636)},
  {'text': '9', 'color': Color(0xFF363636)},
  {
    'text': 'x',
    'color': Color(0xFFE89E28),
    'highlightColor': Color(0xFFEDC68F)
  },
  {'text': '4', 'color': Color(0xFF363636)},
  {'text': '5', 'color': Color(0xFF363636)},
  {'text': '6', 'color': Color(0xFF363636)},
  {
    'text': '-',
    'color': Color(0xFFE89E28),
    'highlightColor': Color(0xFFEDC68F)
  },
  {'text': '1', 'color': Color(0xFF363636)},
  {'text': '2', 'color': Color(0xFF363636)},
  {'text': '3', 'color': Color(0xFF363636)},
  {
    'text': '+',
    'color': Color(0xFFE89E28),
    'highlightColor': Color(0xFFEDC68F)
  },
  {'text': '0', 'color': Color(0xFF363636), 'width': 150.0},
  {'text': '.', 'color': Color(0xFF363636)},
  {
    'text': '=',
    'color': Color(0xFFE89E28),
    'highlightColor': Color(0xFFEDC68F)
  },
];

class _CalculatorKeyboard extends StatelessWidget {
  final ValueChanged<String> onValueChange;

  const _CalculatorKeyboard({Key key, this.onValueChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: List.generate(
          _keyboardList.length,
          (index) => _CalculatorItem(
                text: _keyboardList[index]['text'],
                textColor: _keyboardList[index]['textColor'],
                color: _keyboardList[index]['color'],
                width: _keyboardList[index]['width'],
                highlightColor: _keyboardList[index]['highlightColor'],
                onValueChange: onValueChange,
              )),
    );
  }
}
