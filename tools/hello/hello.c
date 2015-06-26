/*
	Hello, NES!
	writes "Hello, NES!" to the screen

	written by WolfCoder (2010)
*/

/* Includes */
#include <nes.h>

/* Writes the string to the screen */
/* Note how the NES hardware itself automatically moves the position we write to the screen */
void write_string(char *str)
{
	/* Position the cursor */
	/* We only need to do this once */
	/* This is actually 2 cells down since the first 8 pixels from the top of the screen is hidden */
	*((unsigned char*)0x2006) = 0x20;
	*((unsigned char*)0x2006) = 0x41;
	/* Write the string */
	while(*str)
	{
		/* Write a letter */
		/* The compiler put a set of graphics that match ASCII */
		*((unsigned char*)0x2007) = *str;
		/* Advance pointer that reads from the string */
		str++;
	}
}

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
	write_string("Hello, NES!");

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
