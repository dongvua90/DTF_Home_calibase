import 'package:flutter/material.dart';

class Sq {
  String piece;
  int adcValue = 0;
  int adcPhaseValue = 0;
  int frequence = 0;
  bool isSquareBlack;

  Sq({required this.piece, required this.isSquareBlack});
}

class Square extends StatefulWidget {
  final Sq sq;
  const Square({super.key, required this.sq});

  @override
  State<Square> createState() => _SquareState();
}

class _SquareState extends State<Square> {
  Image? getImage() {
    switch (widget.sq.piece) {
      case '-':
        return null;
      case 'K':
        return Image.asset('assets/images/pieces/wK.png');
      case 'Q':
        return Image.asset('assets/images/pieces/wQ.png');
      case 'B':
        return Image.asset('assets/images/pieces/wB.png');
      case 'N':
        return Image.asset('assets/images/pieces/wN.png');
      case 'R':
        return Image.asset('assets/images/pieces/wR.png');
      case 'P':
        return Image.asset('assets/images/pieces/wP.png');
      case 'k':
        return Image.asset('assets/images/pieces/bK.png');
      case 'q':
        return Image.asset('assets/images/pieces/bQ.png');
      case 'b':
        return Image.asset('assets/images/pieces/bB.png');
      case 'n':
        return Image.asset('assets/images/pieces/bN.png');
      case 'r':
        return Image.asset('assets/images/pieces/bR.png');
      case 'p':
        return Image.asset('assets/images/pieces/bP.png');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            color: widget.sq.isSquareBlack
                ? const Color.fromARGB(255, 119, 149, 86)
                : const Color.fromARGB(255, 235, 236, 208),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: getImage() ?? const Text(''),
          ),
          Positioned(
              top: 2,
              left: 2,
              child: Text(
                widget.sq.frequence > 0 ? widget.sq.frequence.toString() : '',
                style: TextStyle(color: widget.sq.isSquareBlack?Colors.white70:Colors.indigo),
              )),
          Positioned(
              bottom: 2,
              left: 2,
              child: Text(
                widget.sq.adcValue > 0 ? widget.sq.adcValue.toString() : '',
                style: TextStyle(color:widget.sq.isSquareBlack?Colors.white70:Colors.indigo),
              )),
          Positioned(
              bottom: 2,
              right: 2,
              child: Text(
                widget.sq.adcPhaseValue > 0
                    ? widget.sq.adcPhaseValue.toString()
                    : '',
                style: TextStyle(color:widget.sq.isSquareBlack?Colors.white70: Colors.indigo),
              )),
          // widget.sq.piece!='-'?SizedBox.expand(child: Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircularProgressIndicator(value: 0.9,strokeCap: StrokeCap.round,),
          // )):Text(''),
          // widget.sq.piece!='-'? SizedBox.expand(child: Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: CircularProgressIndicator(value: 0.5,strokeCap: StrokeCap.round,color: Colors.red,),
          // )):Text(''),
        ],
      ),
    );
  }
}
