void main() {
  List height = [0,1,0,2,1,0,1,3,2,1,2,1];

  print(trappedWater(height));
}


//https://leetcode.com/problems/trapping-rain-water/ for question

//APPROACH:
//Find "holes" (A formation of blocks that is capable of holding water) 
//and calculate the amount of water in all of them


int trappedWater(List height) {
  int x = 0;
  int startHeight = 0;
  int water = 0;
  List hole = [];
  bool exit = false;

  while (height[0] == 0) {  //removing unnecessary 0's at beginning of List
    height.removeAt(0);
  }

  while (x < height.length) {  //going through list
    startHeight = height[x];
    exit = false;

    while (startHeight > 0 && exit == false) { //Checking layer by layer for possible holes
      int i = x + 1;
      hole = [];

      while (i < height.length && exit == false) {
        if (height[i] >= startHeight) {
          hole = height.sublist(x, i + 1);   //forming hole
          water += waterInHole(hole);      //finding total amount of water trapped in hole
          exit = true;
          x = i - 1;
        }
        i++;
      }

      startHeight--;
    }

    x++;
  }

  return water;
}

int waterInHole(List hole) { //finds total water trapped in hole
  if (hole.length < 3) {
    return 0;
  }

  int x = 0;
  int highPoint;
  int water = 0;
  
  if(hole[0] < hole[hole.length - 1]){
    highPoint = hole[0];
  }
  else{
    highPoint = hole[hole.length - 1];
  }

  while (x < hole.length) {
    if (hole[x] < highPoint) {
      water += highPoint - hole[x];
    }
    x++;
  }

  return water;
}
