import 'dart:math';

List<int> playerX = [] ;
List<int> playerO = [] ;

extension ContainsAll on List {
  bool containsAll ( int x , int y , [int? z]){
    if (z == null) 
      return contains(x) && contains(y) ;
    else
      return contains(x) && contains(y) && contains(z) ;     
  }
}

class Game {
  static void playGame (int index , String activePlayer ) {
    if (activePlayer == 'X') 
      playerX.add(index) ;
    else 
      playerO.add(index);
  }

  static String checkWinner() {
    String winner = '' ;
    if ( 
      playerX.containsAll(0 , 1 , 2) ||
      playerX.containsAll(3 , 4 , 5) ||
      playerX.containsAll(6 , 7 , 8) ||
      playerX.containsAll(0 , 3 , 6) ||
      playerX.containsAll(1 , 4 , 7) ||
      playerX.containsAll(2 , 5 , 8) ||
      playerX.containsAll(0 , 4 , 8) ||
      playerX.containsAll(2 , 4 , 6)  
     ) return winner = 'X' ;
    else if (
      playerO.containsAll(0 , 1 , 2) ||
      playerO.containsAll(3 , 4 , 5) ||
      playerO.containsAll(6 , 7 , 8) ||
      playerO.containsAll(0 , 3 , 6) ||
      playerO.containsAll(1 , 4 , 7) ||
      playerO.containsAll(2 , 5 , 8) ||
      playerO.containsAll(0 , 4 , 8) ||
      playerO.containsAll(2 , 4 , 6)  
    ) return winner = 'O' ;
    else 
      return winner ;
  }

  static autoPlay  (String activePlayer) {
    int index = 0 ;
    Random random = Random() ;
                      /* ------ Attacking ------ */ 
    //Attack the Row 
    if (playerO.containsAll(0 , 1) && !playerO.contains(2) && !playerX.contains(2) ) 
      index = 2 ;
    else if (playerO.containsAll(3 , 4) && !playerO.contains(5) && !playerX.contains(5) ) 
      index = 5 ;    
    else if (playerO.containsAll(6, 7) && !playerO.contains(8) && !playerX.contains(8) ) 
      index = 8 ; 
    else if (playerO.containsAll(0 , 2) && !playerO.contains(1) && !playerX.contains(1) ) 
      index = 1 ;   
    else if (playerO.containsAll(3 , 5) && !playerO.contains(4) && !playerX.contains(4) ) 
      index = 4 ;     
    else if (playerO.containsAll(6 , 8) && !playerO.contains(7) && !playerX.contains(7) ) 
      index = 7 ;    
    else if (playerO.containsAll(1 , 2) && !playerO.contains(0) && !playerX.contains(0) ) 
      index = 0 ;        
    else if (playerO.containsAll(4 , 5) && !playerO.contains(3) && !playerX.contains(3) ) 
      index = 3 ;  
    else if (playerO.containsAll(7 , 8) && !playerO.contains(6) && !playerX.contains(6) ) 
      index = 6 ;  
    // Attack the Column 
    else if (playerO.containsAll(0 , 3) && !playerO.contains(6) && !playerX.contains(6) ) 
      index = 6 ;   
    else if (playerO.containsAll(1 , 4) && !playerO.contains(7) && !playerX.contains(7) ) 
      index = 7 ;  
    else if (playerO.containsAll(2 , 5) && !playerO.contains(8) && !playerX.contains(8) ) 
      index = 8 ;  
    else if (playerO.containsAll(0 , 6) && !playerO.contains(3) && !playerX.contains(3) ) 
      index = 3 ;  
    else if (playerO.containsAll(1 , 7) && !playerO.contains(4) && !playerX.contains(4) ) 
      index = 4 ;  
    else if (playerO.containsAll(2 , 8) && !playerO.contains(5) && !playerX.contains(5) ) 
      index = 5 ; 
    else if (playerO.containsAll(3 , 6) && !playerO.contains(0) && !playerX.contains(0) ) 
      index = 0 ; 
    else if (playerO.containsAll(4 , 7) && !playerO.contains(1) && !playerX.contains(1) ) 
      index = 1 ;       
    else if (playerO.containsAll(5 , 8) && !playerO.contains(2) && !playerX.contains(2) ) 
      index = 2 ; 
    // Attack the Cross
    else if (playerO.containsAll(0 , 8) && !playerO.contains(4) && !playerX.contains(4) ) 
      index = 4 ; 
    else if (playerO.containsAll(0 , 4) && !playerO.contains(8) && !playerX.contains(8) ) 
      index = 8 ; 
    else if (playerO.containsAll(4 , 8) && !playerO.contains(0) && !playerX.contains(0) ) 
      index = 0 ; 
    else if (playerO.containsAll(2 , 4) && !playerO.contains(6) && !playerX.contains(6) ) 
      index = 6 ; 
    else if (playerO.containsAll(2 , 6) && !playerO.contains(4) && !playerX.contains(4) ) 
      index = 4 ;             
    else if (playerO.containsAll(4 , 6) && !playerO.contains(2) && !playerX.contains(2) ) 
      index = 2 ; 

                      /* ------ Defending ------ */ 
    // Defence the Row 
    else if (playerX.containsAll(0 , 1) && !playerO.contains(2) && !playerX.contains(2) ) 
      index = 2 ;
    else if (playerX.containsAll(3 , 4) && !playerO.contains(5) && !playerX.contains(5) ) 
      index = 5 ;    
    else if (playerX.containsAll(6, 7) && !playerO.contains(8) && !playerX.contains(8) ) 
      index = 8 ; 
    else if (playerX.containsAll(0 , 2) && !playerO.contains(1) && !playerX.contains(1) ) 
      index = 1 ;   
    else if (playerX.containsAll(3 , 5) && !playerO.contains(4) && !playerX.contains(4) ) 
      index = 4 ;     
    else if (playerX.containsAll(6 , 8) && !playerO.contains(7) && !playerX.contains(7) ) 
      index = 7 ;    
    else if (playerX.containsAll(1 , 2) && !playerO.contains(0) && !playerX.contains(0) ) 
      index = 0 ;        
    else if (playerX.containsAll(4 , 5) && !playerO.contains(3) && !playerX.contains(3) ) 
      index = 3 ;  
    else if (playerX.containsAll(7 , 8) && !playerO.contains(6) && !playerX.contains(6) ) 
      index = 6 ;  
    // Defence the Column 
    else if (playerX.containsAll(0 , 3) && !playerO.contains(6) && !playerX.contains(6) ) 
      index = 6 ;   
    else if (playerX.containsAll(1 , 4) && !playerO.contains(7) && !playerX.contains(7) ) 
      index = 7 ;  
    else if (playerX.containsAll(2 , 5) && !playerO.contains(8) && !playerX.contains(8) ) 
      index = 8 ;  
    else if (playerX.containsAll(0 , 6) && !playerO.contains(3) && !playerX.contains(3) ) 
      index = 3 ;  
    else if (playerX.containsAll(1 , 7) && !playerO.contains(4) && !playerX.contains(4) ) 
      index = 4 ;  
    else if (playerX.containsAll(2 , 8) && !playerO.contains(5) && !playerX.contains(5) ) 
      index = 5 ; 
    else if (playerX.containsAll(3 , 6) && !playerO.contains(0) && !playerX.contains(0) ) 
      index = 0 ; 
    else if (playerX.containsAll(4 , 7) && !playerO.contains(1) && !playerX.contains(1) ) 
      index = 1 ;       
    else if (playerX.containsAll(5 , 8) && !playerO.contains(2) && !playerX.contains(2) ) 
      index = 2 ; 
    // Defence the Cross
    else if (playerX.containsAll(0 , 8) && !playerO.contains(4) && !playerX.contains(4) ) 
      index = 4 ; 
    else if (playerX.containsAll(0 , 4) && !playerO.contains(8) && !playerX.contains(8) ) 
      index = 8 ; 
    else if (playerX.containsAll(4 , 8) && !playerO.contains(0) && !playerX.contains(0) ) 
      index = 0 ; 
    else if (playerX.containsAll(2 , 4) && !playerO.contains(6) && !playerX.contains(6) ) 
      index = 6 ; 
    else if (playerX.containsAll(2 , 6) && !playerO.contains(4) && !playerX.contains(4) ) 
      index = 4 ;             
    else if (playerX.containsAll(4 , 6) && !playerO.contains(2) && !playerX.contains(2) ) 
      index = 2 ; 

    // just pick any available cell
    else {
      do
        index = random.nextInt(9);
      while (playerX.length != 5 && (playerO.contains(index) || playerX.contains(index)));
    }  
    playGame(index, activePlayer);
    activePlayer = 'X' ;
  }
}
