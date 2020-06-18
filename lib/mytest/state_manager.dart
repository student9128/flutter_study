import 'package:flutter/material.dart';

class StateManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('State'),
      ),
      body: ParentWidgetC(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxB(active: _active, onChanged: _handleTapBoxChanged),
    );
  }
}

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

class ParentWidgetC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapBoxC(active:_active,onChanged:_handleTapboxChanged),
    );
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() {
    return _TapBoxCState();
  }
}

class _TapBoxCState extends State<TapBoxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
            border: _highlight
                ? Border.all(
                    color: Colors.teal[700],
                    width: 10,
                  )
                : null),
      ),
    );
  }
}
