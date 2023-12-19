import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tictacgame/src/widgets/big_text_widget.dart';
import 'package:tictacgame/views/home_view/result_card.dart';
import '../../custom_dailog.dart';
import '../../src/constants/colors_const.dart';
import '../../src/widgets/column_button_widget.dart';
import '../../src/widgets/game_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<GameButton> buttonsList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          resultShowDialog(context,"Game Tied");
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var list = List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1.contains(cellID) || player2.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        resultShowDialog(context,"Player 1 Won");
      } else {
        resultShowDialog(context,"Player 2 Won");
      }
    }

    return winner;
  }

  void resetGame() {
    setState(() {
      buttonsList = doInit();
    });
  }

  void resultShowDialog(BuildContext context, String title) async {
    showDialog(
        context: context,
        builder: (_) =>  CustomDialog(title: title, content: "Press the reset button to start again.", actionText: 'Reset', onPressed: () {
          setState(() {
            buttonsList = doInit();
          });
          Navigator.pop(_);
        },));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.outgoingCallColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: ColorConst.whiteColor),
          leading: ModalRoute.of(context)!.canPop
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Image.asset(
                    "assets/back.png",
                    color: ColorConst.whiteColor,
                  ))
              : null,
          title: const BigText(
            text: "Tic Tac Toe",
            color: ColorConst.whiteColor,
            fontWidget: FontWeight.bold,
            size: 30,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: resetGame,
                icon: Image.asset(
                  "assets/restart.png",
                  color: ColorConst.whiteColor,
                ))
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    ColorConst.dashboardCardColorBlue,
                    ColorConst.appBackgroundColor,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           const SizedBox(height: 30),
            const ResultCard(),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                itemCount: buttonsList.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: ColumnButtonWidget(
                    function: buttonsList[i].enabled
                        ? () => playGame(buttonsList[i])
                        : (){},
                    text: buttonsList[i].text,
                    icon: const Icon(Icons.add),
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
