
////////////////////////////////////////////////////
//
//    W_template.pde (ie "Widget Template")
//
//    This is a Template Widget, intended to be used as a starting point for OpenBCI Community members that want to develop their own custom widgets!
//    Good luck! If you embark on this journey, please let us know. Your contributions are valuable to everyone!
//
//    Created by: Conor Russomanno, November 2016
//
///////////////////////////////////////////////////,

class W_ExternalTrigger extends Widget {

    //to see all core variables/methods of the Widget class, refer to Widget.pde
    //put your custom variables here...
    Button widgetTemplateButton;
    Button widgetLoadVideoButton;

    import processing.video.*;
    Movie my_movie;
    boolean playSign;
    boolean selected;

    W_ExternalTrigger(PApplet _parent){
        super(_parent); //calls the parent CONSTRUCTOR method of Widget (DON'T REMOVE)

        widgetTemplateButton = new Button (x + w/2, y + h/2, 200, navHeight, "Load Video", 12);
        widgetTemplateButton.setFont(p4, 14);

        playSign = false;
        selected = false;
    
        
    }

    void update(){
        super.update(); //calls the parent update() method of Widget (DON'T REMOVE)
        if (topNav.configSelector.isVisible || topNav.layoutSelector.isVisible) {
            widgetTemplateButton.setIsActive(false);
            widgetTemplateButton.setIgnoreHover(true);
        } else {
            widgetTemplateButton.setIgnoreHover(false);
        }
    }

    void draw(){
        super.draw(); //calls the parent draw() method of Widget (DON'T REMOVE)
        //put your code here... //remember to refer to x,y,w,h which are the positioning variables of the Widget class
        if ((playSign == true) && (selected == true)){
            image(my_movie, mouseX, mouseY);
        }
        else {
            pushStyle();

            widgetTemplateButton.draw();

            popStyle();
        }


        

        

    }

    void screenResized(){
        super.screenResized(); //calls the parent screenResized() method of Widget (DON'T REMOVE)
        widgetTemplateButton.setPos(x + w/2 - widgetTemplateButton.but_dx/2, y + h/2 - widgetTemplateButton.but_dy/2);
    }

    void mousePressed(){
        
        super.mousePressed(); //calls the parent mousePressed() method of Widget (DON'T REMOVE)
        if (!topNav.configSelector.isVisible && !topNav.layoutSelector.isVisible) {
            if(widgetTemplateButton.isMouseHere()){
                widgetTemplateButton.setIsActive(true);
            }
        }
        
    }

    void mouseReleased(){
        super.mouseReleased(); //calls the parent mouseReleased() method of Widget (DON'T REMOVE)
        if(widgetTemplateButton.isActive && widgetTemplateButton.isMouseHere()){
            selectInput("Select a file to process:", "fileSelected");
            playSign = true;
            
        }
        widgetTemplateButton.setIsActive(false);
    }

    //add custom functions here
    void customFunction(){
        //this is a fake function... replace it with something relevant to this widget

    }

    // edit
    void movieEvent(Movie m) {
        m.read();
    }

    void fileSelected(File selection) {
        if (selection == null) {
            println("Window was closed or the user hit cancel.");
        } else {
            println("User selected " + selection.getAbsolutePath());
            my_movie = new Movie(pApplet, selection.getAbsolutePath());
            selected = true;
            my_movie.play();
        }
    }


};

//These functions need to be global! These functions are activated when an item from the corresponding dropdown is selected
void Dropdown_trigger_1(int n){
    println("Item " + (n+1) + " selected from Dropdown 1");
    if(n==0){
        //do this
    } else if(n==1){
        //do this instead
    }

    closeAllDropdowns(); // do this at the end of all widget-activated functions to ensure proper widget interactivity ... we want to make sure a click makes the menu close
}

// void Dropdown2(int n){
//     println("Item " + (n+1) + " selected from Dropdown 2");
//     closeAllDropdowns();
// }

// void Dropdown3(int n){
//     println("Item " + (n+1) + " selected from Dropdown 3");
//     closeAllDropdowns();
// }


