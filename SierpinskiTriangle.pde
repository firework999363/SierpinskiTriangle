// public float xx = 0;
// public float yy = 0;
//public float zz = 0;
public float x2 = 40;
public float q = 600;
public boolean move = false;
// public boolean move2 = false;
public void setup()
{
	size(600,600,P3D);
	background(0);
}
public void draw()
{
	smooth();
	colorMode(HSB, 209);
	background(-x2+210,100,150);
	slider();
	if (x2 > 250)
	{
		x2 = 250;
	}
	else if (x2 < 40)
	{
		x2 = 40;
	}
	else
	{
		x2 = x2;
	}
	q = (((float)(-599)/210)*x2 + ((float)(14996)/21));
	if(q < 5)
	{
		q = 30;
	}
	sierpinski(0,550,0,600);
}
public void mouseDragged()//optional
{
  if (move)
  {
  	x2 = x2 + (mouseX - pmouseX);
  }
  // else
  // {
  // 	xx = xx + (mouseX - pmouseX);
  // 	yy = yy + (mouseY - pmouseY);
  // }
}
public void mousePressed()
{
	if (mouseX >= x2 && mouseX <= x2+10 && mouseY >= 40 && mouseY <= 60)
	{
		move = true;
	}
}
public void mouseReleased()
{
	move = false; 
}
public void slider()
{
	colorMode(RGB, 255);
	fill(255);
	strokeWeight(1);
	stroke(255);
	line(40,50,250,50);
	rect(x2,40,10,20);
}
public void sierpinski(float x, float y, float z, float len) 
{
	// pushMatrix();
	//translate(250,337.8679655,-362.132034);
	// private float ax = -250;
	// private float ay = -337.8679655;
	// private float az = 362.132034;
	// rotateX(radians(xx));
	// rotateY(radians(yy));
	//rotateZ(radians(zz));
	strokeWeight(1);
	colorMode(HSB,210);
	stroke(x2-40,210,210);
	noFill();
	if (len>q)
	{
		sierpinski(x,y,z,len/2);
		sierpinski(x+(len/2),y,z,len/2);
		sierpinski(x,y,z-(len/2),len/2);
		sierpinski(x+(len/2),y,z-(len/2),len/2);
		sierpinski(x+(len/4),y-(len/((float)Math.sqrt(2)*2)),z-(len/4),len/2);
	}
	else
	{
		line(x,y,z,x+len,y,z);
		line(x,y,z,x,y,z-len);
		line(x,y,z-len,x+len,y,z-len);
		line(x+len,y,z-len,x+len,y,z);
		line(x,y,z,x+len/2,y-(len/(float)Math.sqrt(2)),z-(len/2));
		line(x+len,y,z,x+len/2,y-(len/(float)Math.sqrt(2)),z-(len/2));
		line(x,y,z-len,x+len/2,y-(len/(float)Math.sqrt(2)),z-(len/2));
		line(x+len,y,z-len,x+len/2,y-(len/(float)Math.sqrt(2)),z-(len/2));
	}
	// popMatrix();
}
