import 'package:dtf_home_calibase/models/square.dart';
import 'package:flutter/material.dart';

class Chessboard extends StatefulWidget {
  final List<List<Sq>> board;
  const Chessboard({super.key,required this.board});

  @override
  State<Chessboard> createState() => _ChessboardState();
}

class _ChessboardState extends State<Chessboard> {

  @override void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8), 
      itemBuilder: (context, index) {
        int file = index % widget.board.length;
        int rank = index ~/ widget.board.length;
        return  Square(sq: widget.board[file][rank]);
      },
      itemCount: widget.board.length*widget.board[0].length,);
  }
}