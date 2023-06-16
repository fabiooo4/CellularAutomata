class CA {

  int generation;
  int[] ruleset;
  int w = 5;
  int[][] grid;

  int cols;
  int rows;


  CA(int[] r) {
    ruleset = r;
    cols = width/w;
    rows = height/w;
    grid = new int[cols][rows];
    reset();
  }

  // Make a random ruleset
  void randomize() {
    for (int i = 0; i < 8; i++) {
      ruleset[i] = int(random(2));
    }
  }

  // Reset to generation 0
  void reset() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        grid[i][j] = 0;
      }
    }
    grid[cols/2][0] = 1;    // Start with middle cell 1
    generation = 0;
  }


  void generate() {
    for (int i = 0; i < cols; i++) {
      int left  = grid[(i+cols-1)%cols][generation%rows];   // Left neighbor 
      int me    = grid[i][generation%rows];       // Current 
      int right = grid[(i+1)%cols][generation%rows];  // Right neighbor 
      grid[i][(generation+1)%rows] = rules(left, me, right); // Compute next generation state based on ruleset
    }
    generation++;
  }

  void display() {
    int offset = generation%rows;

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        int y = j - offset;
        if (y <= 0) y = rows + y;
        if (grid[i][j] == 1) fill(255);
        else                   fill(#161c28);
        noStroke();
        rect(i*w, (y-1)*w, w, w);
      }
    }
  }

  // Converts a binary string to an index in the ruleset array
  int rules (int a, int b, int c) {
   String s = "" + a + b + c;
   int index = Integer.parseInt(s, 2);
   return ruleset[index];
   }

  // The CA is done if it reaches the bottom of the screen
  boolean finished() {
    if (generation > height/w) {
      return true;
    } 
    else {
      return false;
    }
  }
}
