/*
	Hello, NES!
	writes "Hello, NES!" to the screen

	written by WolfCoder (2010)
*/

/* Includes */
#include <nes.h>

/* Program entry */
int main()
{
	/* We have to wait for VBLANK or we can't even use the PPU */
	waitvblank(); /* This is found in nes.h */

	/* This is a really strange way to set colors, don't you think? */
	/* First, we need to set the background color */
	*((unsigned char*)0x2006) = 0x3F;
	*((unsigned char*)0x2006) = 0x00;
	*((unsigned char*)0x2007) = 1;
	/* Then, we need to set the text color */
	*((unsigned char*)0x2006) = 0x3F;
	*((unsigned char*)0x2006) = 0x03;
	*((unsigned char*)0x2007) = 0x30;

	/* We must write our message to the screen */
	//write_string("Hello, NES!");
	
	*((unsigned char*)0x2006) = 0x20;
	*((unsigned char*)0x2006) = 0x41;
	*((unsigned char*)0x2007) = 'H';
	*((unsigned char*)0x2007) = 'e';
	*((unsigned char*)0x2007) = 'l';
	*((unsigned char*)0x2007) = 'l';
	*((unsigned char*)0x2007) = 'o';
	*((unsigned char*)0x2007) = ',';
	*((unsigned char*)0x2007) = ' ';
	*((unsigned char*)0x2007) = 'W';
	*((unsigned char*)0x2007) = 'o';
	*((unsigned char*)0x2007) = 'r';
	*((unsigned char*)0x2007) = 'l';
	*((unsigned char*)0x2007) = 'd';
	*((unsigned char*)0x2007) = '!';

	/* Set the screen position */
	/* First value written sets the X offset and the second is the Y offset */
	*((unsigned char*)0x2005) = 0x00;
	*((unsigned char*)0x2005) = 0x00;

	/* Enable the screen */
	/* By default, the screen and sprites were off */
	*((unsigned char*)0x2001) = 8;

	/* Wait */
	/* The compiler seems to loop the main function over and over, so we need to hold it here */
	while(1);
	
	return 0;
}
