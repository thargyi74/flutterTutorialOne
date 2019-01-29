// ParentWidget manages and TapboxC also manages it own state.
import 'package:flutter/material.dart';

class ParentWidgetTapBoxC extends StatefulWidget {
  @override
  _ParentWidgetTapBoxCState createState() => _ParentWidgetTapBoxCState();
}

class _ParentWidgetTapBoxCState extends State<ParentWidgetTapBoxC> {
  bool _active = false;

  void _handleTapBoxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TapBoxC(active: _active, onChanged: _handleTapBoxChanged);
  }
}

class TapBoxC extends StatefulWidget {
  TapBoxC({Key key, @required this.active, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapBoxCState createState() => _TapBoxCState();
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

  void _handleTapCancle() {
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
      onTapCancel: _handleTapCancle,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'ACTIVE' : 'INACTIVE',
              style: TextStyle(color: Colors.white, fontSize: 32.0)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(color: Colors.teal[700], width: 10.0)
              : null,
        ),
      ),
    );
  }
}
