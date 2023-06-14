import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xo_game/game_logic.dart';
import 'info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static bool gameOver = false;
  bool isSwitched = false;
  int turn = 0;
  String activePlayer = 'X';
  String result = '';
  Game game = Game();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SwitchListTile.adaptive(
              activeColor: const Color.fromARGB(255, 25, 158, 29),
              value: isSwitched,
              onChanged: (bool newValue) => setState(() {
                if (playerX.isEmpty) {
                  isSwitched = newValue;
                } else {}
              }),
              title: const Text(
                'computer mode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 28,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              '$activePlayer player turn',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 207, 18, 18),
                fontSize: 45,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(
                  9,
                  (index) => InkWell(
                   borderRadius: BorderRadius.circular(16),
                    onTap: gameOver ? null : () => onTap(index),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Theme.of(context).shadowColor),
                      child: Center(
                        child: Text(
                          playerX.contains(index)
                              ? 'X'
                              : playerO.contains(index)
                                  ? 'O'
                                  : ' ',
                          style: TextStyle(
                              color: playerX.contains(index)
                                  ? const Color.fromARGB(255, 91, 89, 82)
                                  : Colors.white,
                              fontSize: 70,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 42,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(35)),
                  child: ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          activePlayer = 'X';
                          gameOver = false;
                          turn = 0;
                          result = '';
                          playerO.clear();
                          playerX.clear();
                        });
                      },
                      icon: const Icon(
                        Icons.replay_5_sharp,
                        size: 32,
                      ),
                      label: const Text(
                        'repeat',
                        style: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold),
                      )),
                ),
                IconButton(
                  onPressed: () async => await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: ((context) => const INfoPage()))),
                  icon: const Icon(
                    FontAwesomeIcons.addressBook,
                    size: 35,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.09,
            )
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    if (!playerO.contains(index) && !playerX.contains(index)) {
      Game.playGame(index, activePlayer);
      updateState();
      if (isSwitched == true && gameOver == false) {
        Game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = activePlayer == 'X' ? 'O' : 'X';
      String winner = Game.checkWinner();
      if (winner == 'X' || winner == 'O') {
        result = "$winner is the winner";
        gameOver = true;
      } else if (playerO.length + playerX.length == 9) {
        result = 'It is a DRAW';
        gameOver = true;
      }
    });
  }
}
