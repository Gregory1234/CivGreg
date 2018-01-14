enum GTextModeMenu {
  CENTER, LEFT, RIGHT;
}

class Button {
  int x, y, w, h, size;
  GTextModeMenu mode;
  String text;
  Button(int x, int y, int w, int h, String t) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.text=t;
    this.size=32;
    this.mode=GTextModeMenu.LEFT;
  }
  Button(int x, int y, int w, int h, String t, int size) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.text=t;
    this.size=size;
    this.mode=GTextModeMenu.LEFT;
  }
  Button(int x, int y, int w, int h, String t, int size, GTextModeMenu mode) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.text=t;
    this.size=size;
    this.mode=mode;
  }
  Button(int x, int y, int w, int h, String t, GTextModeMenu mode) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.text=t;
    this.size=32;
    this.mode=mode;
  }
  void draw() {
    textSize(size);
    fill(255);
    rect(x, y, w, h);
    fill(0);
    if (mode==GTextModeMenu.LEFT) {
      textAlign(LEFT);
      text(text, x+1, y+size+1);
    }
    if (mode==GTextModeMenu.CENTER) {
      textAlign(CENTER);
      text(text, x+w/2, y+size+1);
      textAlign(LEFT);
    }
  }
  boolean check(int X, int Y) {
    return X>x&&X<x+w&&Y>y&&Y<y+h;
  }
  boolean check() {
    return check(mouseX, mouseY);
  }
}
class NumberSelect extends Button {
  public int number;
  int csize, min, max;
  NumberSelect(int x, int y, int w, int h, String t, int number, int csize) {
    super(x, y, w, h, t);
    this.number=number;
    this.csize=csize;
    this.min=0;
    this.max=256;
  }
  NumberSelect(int x, int y, int w, int h, String t, int size, int number, int csize) {
    super(x, y, w, h, t, size);
    this.number=number;
    this.csize=csize;
    this.min=0;
    this.max=256;
  }
  NumberSelect(int x, int y, int w, int h, String t, int size, GTextModeMenu mode, int number, int csize) {
    super(x, y, w, h, t, size, mode);
    this.number=number;
    this.csize=csize;
    this.min=0;
    this.max=256;
  }
  NumberSelect(int x, int y, int w, int h, String t, GTextModeMenu mode, int number, int csize) {
    super(x, y, w, h, t, mode);
    this.number=number;
    this.csize=csize;
    this.min=0;
    this.max=256;
  }
  NumberSelect(int x, int y, int w, int h, String t, int number, int csize, int min, int max) {
    super(x, y, w, h, t);
    this.number=number;
    this.csize=csize;
    this.min=min;
    this.max=max;
  }
  NumberSelect(int x, int y, int w, int h, String t, int size, int number, int csize, int min, int max) {
    super(x, y, w, h, t, size);
    this.number=number;
    this.csize=csize;
    this.min=min;
    this.max=max;
  }
  NumberSelect(int x, int y, int w, int h, String t, int size, GTextModeMenu mode, int number, int csize, int min, int max) {
    super(x, y, w, h, t, size, mode);
    this.number=number;
    this.csize=csize;
    this.min=min;
    this.max=max;
  }
  NumberSelect(int x, int y, int w, int h, String t, GTextModeMenu mode, int number, int csize, int min, int max) {
    super(x, y, w, h, t, mode);
    this.number=number;
    this.csize=csize;
    this.min=min;
    this.max=max;
  }
  void draw() {
    textSize(size);
    fill(255);
    rect(x, y, w, h);
    rect(x, y, csize, h);
    rect(x+w-csize, y, csize, h);
    fill(0);
    textAlign(CENTER);
    text("-", x+csize/2, y+size+1);
    text("+", x+w-csize/2, y+size+1);
    if (mode==GTextModeMenu.LEFT) {
      textAlign(LEFT);
      text(text.replace("@", ""+number), x+csize+1, y+size+1);
    }
    if (mode==GTextModeMenu.CENTER) {
      textAlign(CENTER);
      text(text.replace("@", ""+number), x+csize+w/2, y+size+1);
      textAlign(LEFT);
    }
  }
  int update(int X, int Y) {
    if (X>x&&X<x+csize&&Y>y&&Y<y+h)
      if(number>min)
        number--;
    if (X>x+w-csize&&X<x+w&&Y>y&&Y<y+h)
      if(number<max)
        number++;
    return number;
  }
  int update() {
    return update(mouseX, mouseY);
  }
}