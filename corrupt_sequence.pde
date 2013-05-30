// Coded initially in 2004 Benjamin Gaulon corrupt.recyclism.com // more info on www.recyclism.com //
// LOAD AN IMAGE SEQUENCE //
// Feel free to use / modify / Share this //

PImage img;
String fileName = "name"; // Replace by your file name
String fileExt = ".jpg"; // Replace by your file extension
int imageCount = 14; // Number of images in DATA folder

void setup()
{
  size(50, 50);
  for (int i = 1; i < (imageCount+1); i++)
  
  {
    byte b[] = loadBytes(fileName + Integer.toString(i) + fileExt);


    // print each value, from 0 to 255
    byte bCopy[] = new byte[b.length];
    arrayCopy(b, bCopy);
    // load binary of file

    int scrambleStart = 10;
    // scramble start excludes 10 bytes///

    int scrambleEnd = b.length;
    // scramble end ///

    int nbOfReplacements = int (random(1, 20));
    // Number of Replacements - Go easy with this as too much will just kill the file ///

    // Swap bits ///
    for (int g = 0; g < nbOfReplacements; g++)

    {
      int PosA = int(random (scrambleStart, scrambleEnd));

      int PosB = int(random (scrambleStart, scrambleEnd));

      byte tmp = bCopy[PosA];

      bCopy[PosA] = bCopy[PosB];

      bCopy[PosB] = tmp;
    }
    // Save each corrupted file into the "corrupt" folder with same name and number
    saveBytes("./corrupt/"+fileName + Integer.toString(i) + fileExt, bCopy);
    println("Corrupt: " + fileName + Integer.toString(i) + fileExt);
  }
}

