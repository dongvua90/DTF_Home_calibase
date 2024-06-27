import 'package:dtf_home_calibase/chessboard.dart';
import 'package:dtf_home_calibase/models/square.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DTF Calibase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<Sq>> board = List.generate(8, (file) => 
      List.generate(8, (rank) => Sq(piece: 'k',isSquareBlack: (file+rank)%2==1?true:false))
    );
  String fen="rnbqkbnrpppppppp--------------------------------PPPPPPPPRNBQKBNR";

  void changeTest()
  {
    for(int rank=0;rank<8;rank++)
    {
      for(int file=0;file<8;file++){
        int idx=rank*8+file;
        board[file][rank].piece=fen[idx];
        board[file][rank].adcValue = idx+3;
        board[file][rank].adcPhaseValue = idx+4;
        board[file][rank].frequence = idx+5;
      }
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title:const Text("DTF Calibase"),

        actions: [
          IconButton(onPressed: () {
            setState(() {
              fen="rnbqkbnrpppppppp----------------------------P----PPPPPPPRNBQKBNR";
              changeTest();
            });
          }, icon:const Icon(Icons.crop_original)),
          IconButton(onPressed: () {
            setState(() {
              fen="rnbqkbnrpppppppp--------------------------------PPPPPPPPRNBQKBNR";
              changeTest();
            });
          }, icon:const Icon(Icons.deblur))
        ],
      ),
      body: Row( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: MediaQuery.of(context).size.height-56, child: Chessboard(board: board,)),
          const SizedBox(width: 5,),
          Expanded(child: Column(
            children: [
               DropdownButton(items: [
                    DropdownMenuItem(child: Text("COM1")),
                    DropdownMenuItem(child: Text("COM4")),
                  ], onChanged: (value) {
                    
                  },),
              Row(
                children: [
                 
                  ElevatedButton(onPressed: () {
                    
                  }, child: Text("Open"))
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
