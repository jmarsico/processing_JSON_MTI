//create json object, which will store the json file
JSONObject json;

//this is the URL endpoint that we want to call to retrieve the JSON
String quakeURL = "https://www.kimonolabs.com/api/e0javbdm?apikey=No7h5YUcyCWbbn7xjG0ukUrDZTpjWFUU";

float w;

void setup() {
  size(640, 360);
  w = 0;
  loadData();
  
}

void draw() {
  //background(255); 
}


void loadData() {
  //get the JSON file
  json = loadJSONObject(quakeURL);
  println("we got JSON!");
  println(json);
  
  //get the JSON object named "results", which contains the array we want!
  JSONObject results = json.getJSONObject("results");
  
  //get the array titled "collection1"
  JSONArray quakes = results.getJSONArray("collection1");
  println("number quakes: " + quakes.size());
  
  if(quakes.size() > 0)
  {
    w = width/quakes.size();
    //go through each section and find the "amnt"
    for(int i = 0; i < quakes.size(); i++)
    {
      //get the first dataGroup in the "collection1" array
      JSONObject quake = quakes.getJSONObject(i);
      
      //we know that "amnt" is a float, so we're going to ask for a float named "amnt"
      float amnt = quake.getFloat("firstSigQuake");
      println("amount of quake " + i + ": " + amnt);
      
      stroke(0);
      strokeWeight(5);
      line(w*i + 10, height, w*i + 10, height - amnt*20);

      textAlign(LEFT);
      float x = w*i + 10;
      float y = height - amnt*20;
      pushMatrix();
      translate(x,y);
      rotate(-HALF_PI);
      text(amnt,0,0);
      popMatrix();
              
    }
    
    
    
  }
}