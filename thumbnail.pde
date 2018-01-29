void setup()
{
  
  boolean doubles = false;
  
  //background(255, 0, 0);
  PImage gradient = loadImage("maroonGradient.png"); // gradient background
  PImage vs = loadImage("VS.png"); //VS image
  PImage wiiU = loadImage("WiiU.png");
  PFont playerNameFont;
  PFont playerNameFontDoubles;
  PFont dateFont;
  PFont roundFont;
  //playerNameFont = createFont("Back to 1982", 60);
  //playerNameFont = createFont("8BIT WONDER", 50);
  playerNameFont = createFont("Impact", 100);
  dateFont = createFont("Century Gothic", 56);
  roundFont = createFont("Impact", 70);
  playerNameFontDoubles = createFont("Impact", 70);
  String player1Name = "";
  String player2Name = "";
  Table table;
  String team1Player1Name = "";
  String team1Player2Name = "";
  String team2Player1Name = "";
  String team2Player2Name = "";
  
  
  size(1280, 720); //look up dimensions
  
  if (doubles)
  {
    table = loadTable("MatchesDoubles.csv", "header");
  }
  else
  {
    table = loadTable("Matches.csv", "header");
  }
  
  //println(table.getRowCount()); //debugging
  
  for (TableRow row : table.rows())
  {
    background(255);
    
    image(gradient, 0, 0, gradient.width, gradient.height); //draw gradient
    
    fill(207, 83, 0);
    strokeWeight(4); //makes the black outline for the orange bars
    rect(-5, -5, 1290, 150); //top orange bar (moved up to hide stroke)
    rect(-5, 720 - 150, 1290, 160); //bottom orange bar (moved down to hide stroke)
    
    image(wiiU, 30, 720 - 130, wiiU.width * 0.3, wiiU.height * 0.3); // Draw WiiU Logo
    
    // DRAWING DATE
    String date = row.getString("Date");
    textFont(dateFont);
    fill(0);
    text(date, 1280 - 30 - textWidth(date), 720 - 55); // write the date on the bottom right
    
    // DRAWING PLAYER 1 NAME
    if (!doubles)
    {
      player1Name = row.getString("Player 1");
      textFont(playerNameFont);
      fill(0);
      for (int x = -3; x < 4; x++) //add the outline to the text
      {
        text(player1Name, 30 + x, 110);
        text(player1Name, 30, 110  + x);
      }
      fill(255);
      text(player1Name, 30, 110);
    }
    else // DRAWING TEAM 1 NAMES (DOUBLES)
    {
      team1Player1Name = row.getString("Team 1 Player 1");
      team1Player2Name = row.getString("Team 1 Player 2");
      textFont(playerNameFontDoubles);
      fill(0);
      for (int x = -3; x < 4; x++) //add the outline to the text
      {
        text(team1Player1Name, 30 + x, 60);
        text(team1Player1Name, 30, 60  + x);
      }
      fill(255);
      text(team1Player1Name, 30, 60);
      
      fill(0);
      for (int x = -3; x < 4; x++) //add the outline to the text
      {
        text(team1Player2Name, 30 + x, 135);
        text(team1Player2Name, 30, 135  + x);
      }
      fill(255);
      text(team1Player2Name, 30, 135);
    }
    
    // DRAWING PLAYER 2 NAME
    if (!doubles)
    {
      player2Name = row.getString("Player 2");
      textFont(playerNameFont);
      fill(0);
      for (int x = -3; x < 4; x++) //add the outline to the text
      {
        text(player2Name, (1280 - 30 - textWidth(player2Name)) + x, 110);
        text(player2Name, (1280 - 30 - textWidth(player2Name)), 110  + x);
      }
      fill(255);
      text(player2Name, 1280 - 30 - textWidth(player2Name), 110);
    }
    else // DRAWING TEAM 2 NAMES (DOUBLES)
    {
      team2Player1Name = row.getString("Team 2 Player 1");
      team2Player2Name = row.getString("Team 2 Player 2");
      
      textFont(playerNameFontDoubles);
      fill(0);
      for (int x = -3; x < 4; x++) //add the outline to the text
      {
        text(team2Player1Name, (1280 - 30 - textWidth(team2Player1Name)) + x, 60);
        text(team2Player1Name, (1280 - 30 - textWidth(team2Player1Name)), 60  + x);
      }
      fill(255);
      text(team2Player1Name, 1280 - 30 - textWidth(team2Player1Name), 60);
      
      fill(0);
      for (int x = -3; x < 4; x++) //add the outline to the text
      {
        text(team2Player2Name, (1280 - 30 - textWidth(team2Player2Name)) + x, 135);
        text(team2Player2Name, (1280 - 30 - textWidth(team2Player2Name)), 135  + x);
      }
      fill(255);
      text(team2Player2Name, 1280 - 30 - textWidth(team2Player2Name), 135);
    }
    
    
    // DRAWING PLAYER 1 CHARACTER
    if (!doubles)
    {
      String player1Char = row.getString("P1 Char");
      PImage P1CharImage = loadImage("Smash Pixel Art/" + player1Char + ".png");
      
      float scale = 380 / ((float)P1CharImage.height);
      
      image(P1CharImage, (width / 4) - ((P1CharImage.width * (scale)) / 2), (height / 2) - ((P1CharImage.height * (scale)) / 2), P1CharImage.width * scale, P1CharImage.height * scale); // draw player 1 char
    }
    else // DRAWING TEAM 1 CHARACTERS (DOUBLES)
    {
      String team1Player1Char = row.getString("T1 P1 Char");
      String team1Player2Char = row.getString("T1 P2 Char");
      PImage t1p1Char = loadImage("Smash Pixel Art/" + team1Player1Char + ".png");
      PImage t1p2Char = loadImage("Smash Pixel Art/" + team1Player2Char + ".png");
      
      float scale = 380 / ((float)t1p1Char.height);
      float scale2 = 380 / ((float)t1p2Char.height);
      
      image(t1p1Char, (width / 8) - ((t1p1Char.width * (scale)) / 2), (height / 2) - ((t1p1Char.height * (scale)) / 2), t1p1Char.width * scale, t1p1Char.height * scale); // draw team 1 player 1 char
      image(t1p2Char, ((width / 8) * 2.5) - ((t1p2Char.width * (scale2)) / 2), (height / 2) - ((t1p2Char.height * (scale2)) / 2), t1p2Char.width * scale2, t1p2Char.height * scale2); // draw team 1 player 2 char
    }
    
    // DRAWING PLAYER 2 CHARACTER
    if (doubles) // I messed up the order. Fix this later so that singles comes first
    {
      String team2Player1Char = row.getString("T2 P1 Char");
      println(team2Player1Char);
      String team2Player2Char = row.getString("T2 P2 Char");
      println(team2Player2Char);
      PImage t2p1Char = loadImage("Smash Pixel Art/" + team2Player1Char + ".png");
      PImage t2p2Char = loadImage("Smash Pixel Art/" + team2Player2Char + ".png");
      
      float scale3 = 380 / ((float)t2p1Char.height);
      float scale4 = 380 / ((float)t2p2Char.height);
      
      image(t2p1Char, ((width / 8) * 7) - ((t2p1Char.width * (scale3)) / 2), (height / 2) - ((t2p1Char.height * (scale3)) / 2), t2p1Char.width * scale3, t2p1Char.height * scale3); // draw team 2 player 1 char
      image(t2p2Char, ((width / 8) * 5.5) - ((t2p2Char.width * (scale4)) / 2), (height / 2) - ((t2p2Char.height * (scale4)) / 2), t2p2Char.width * scale4, t2p2Char.height * scale4); // draw team 2 player 2 char
      //println(scale3);
      //println(P2CharImage.height);
    }
    else
    {
      String player2Char = row.getString("P2 Char");
      PImage P2CharImage = loadImage("Smash Pixel Art/" + player2Char + ".png");
      
      float scale2 = 380 / ((float)P2CharImage.height);
      
      image(P2CharImage, ((width / 4) * 3) - ((P2CharImage.width * (scale2)) / 2), (height / 2) - ((P2CharImage.height * (scale2)) / 2), P2CharImage.width * scale2, P2CharImage.height * scale2); // draw player 2 char
      println(scale2);
      println(P2CharImage.height);
    }
    
    // DRAWING ROUND NUMBER
    String round = row.getString("Round");
    textFont(roundFont);
    fill(255);
    for (int x = -3; x < 4; x++) //add the outline to the text
    {
      text(round, ((width / 2) - (textWidth(round)) / 2) + x, 720 - 55);
      text(round, ((width / 2) - (textWidth(round)) / 2), 720 - 55  + x);
    }
    fill(0);
    text(round, ((width / 2) - (textWidth(round)) / 2), 720 - 55);
    
    // draw vs logo
    image(vs, ((width / 2) - ((vs.width  * (0.3))/ 2)), ((height / 2) - ((vs.height * (0.3)) / 2)), vs.width * 0.3, vs.height * 0.3);
    
    if (!doubles)
    {
      save("Completed_Thumbnails/" + player1Name + " " + player2Name + " " + round + ".png");
    }
    else
    {
      save("Completed_Thumbnails/" + team1Player1Name + " " + team1Player2Name + " " + team2Player1Name + " " + team2Player2Name + " " + round + ".png");
    }
  }
  
}