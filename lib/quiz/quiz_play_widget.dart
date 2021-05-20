import 'package:flutter/material.dart';

class OptionTile extends StatefulWidget {
  final String option, descr, correctAnswer, optionSelected;
  OptionTile({@required this.optionSelected, 
  @required this.correctAnswer,
  @required this.descr, 
  @required this.option});

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
            border: Border.all(color: widget.descr == widget.optionSelected ? widget.optionSelected == widget.correctAnswer ? 
            Colors.green.withOpacity(0.7) : Colors.red.withOpacity(0.7): Colors.grey)
            ),
            child: Text("${widget.option}", style: TextStyle(
              color: widget.optionSelected ==widget.descr ?
              widget.correctAnswer == widget.optionSelected ? 
              Colors.green.withOpacity(0.7) 
              : Colors.red
              : Colors.grey )
            )
          ),
          SizedBox(width: 8,),
          Text(widget.descr, style: TextStyle(fontSize: 17, color:  Colors.black54),)
        ],
      )
    );
  }
}
