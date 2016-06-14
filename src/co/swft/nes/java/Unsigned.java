package co.swft.nes.java;

/**
 * Helper class for unsigned Math in Java. No Javadoc for brevity
 * 
 * > test
 * 
 * @author Matt Consto
 */
public class Unsigned {
	/*
	 * Unsigning functions
	 */
	
	public static byte   un (boolean a)            {return (byte) (a ? 1 : 0);}
	public static int    un (byte    a)            {return Byte   .toUnsignedInt   (a);}
	public static int    un (short   a)            {return Short  .toUnsignedInt   (a);}
	public static long   un (int     a)            {return Integer.toUnsignedLong  (a);}
	public static String un (long    a)            {return Long   .toUnsignedString(a);}
	
	public static short  make(byte low, byte high) {return Unsigned.or(low, Unsigned.shiftl(high, (short) 8));}
	public static byte   high(short   a)           {return (byte) (a >>> 8);}
	public static byte   low (short   a)           {return (byte) a;}
	
	/*
	 * Unary Functions
	 */
	public static boolean bit (byte a, byte p)     {return ((a >>> p) & 1) == 1;}
	public static boolean bit (byte a, short p)    {return ((a >>> p) & 1) == 1;}
	public static boolean bit (byte a, int p)      {return ((a >>> p) & 1) == 1;}
	public static boolean bit (short a, byte p)    {return ((a >>> p) & 1) == 1;}
	public static boolean bit (short a, short p)   {return ((a >>> p) & 1) == 1;}
	public static boolean bit (short a, int p)     {return ((a >>> p) & 1) == 1;}
	public static boolean bit (int a, byte p)      {return ((a >>> p) & 1) == 1;}
	public static boolean bit (int a, short p)     {return ((a >>> p) & 1) == 1;}
	public static boolean bit (int a, int p)       {return ((a >>> p) & 1) == 1;}
	
	public static byte   inc(byte    a)            {return (byte)  (un(a) + 1);}
	public static short  inc(short   a)            {return (short) (un(a) + 1);}
	public static int    inc(int     a)            {return (int)   (un(a) + 1);}
	public static byte   dec(byte    a)            {return (byte)  (un(a) - 1);}
	public static short  dec(short   a)            {return (short) (un(a) - 1);}
	public static int    dec(int     a)            {return (int)   (un(a) - 1);}
	public static byte   not(byte    a)            {return (byte)  ~un(a);}
	public static short  not(short   a)            {return (short) ~un(a);}
	public static int    not(int     a)            {return (int)   ~un(a);}

	/*
	 * Binary/N-ary functions
	 */
	public static byte   add(byte    a, byte    b) {return (byte)  (un(a) + un(b));}
	public static short  add(byte    a, short   b) {return (short) (un(a) + un(b));}
	public static int    add(byte    a, int     b) {return (int)   (un(a) + un(b));}
	public static short  add(short   a, byte    b) {return (short) (un(a) + un(b));}
	public static short  add(short   a, short   b) {return (short) (un(a) + un(b));}
	public static int    add(short   a, int     b) {return (int)   (un(a) + un(b));}
	public static int    add(int     a, byte    b) {return (int)   (un(a) + un(b));}
	public static int    add(int     a, short   b) {return (int)   (un(a) + un(b));}
	public static int    add(int     a, int     b) {return (int)   (un(a) + un(b));}
	public static byte   add(byte  ... a)          {int  t = 0; for(byte  b : a) t += un(b); return (byte)  t;}
	public static short  add(short ... a)          {int  t = 0; for(short b : a) t += un(b); return (short) t;}
	public static int    add(int   ... a)          {long t = 0; for(int   b : a) t += un(b); return (int)   t;}

	public static byte   sub(byte    a, byte    b) {return (byte)  (un(a) - un(b));}
	public static short  sub(byte    a, short   b) {return (short) (un(a) - un(b));}
	public static int    sub(byte    a, int     b) {return (int)   (un(a) - un(b));}
	public static short  sub(short   a, byte    b) {return (short) (un(a) - un(b));}
	public static short  sub(short   a, short   b) {return (short) (un(a) - un(b));}
	public static int    sub(short   a, int     b) {return (int)   (un(a) - un(b));}
	public static int    sub(int     a, byte    b) {return (int)   (un(a) - un(b));}
	public static int    sub(int     a, short   b) {return (int)   (un(a) - un(b));}
	public static int    sub(int     a, int     b) {return (int)   (un(a) - un(b));}
	public static byte   sub(byte  ... a)          {int  t = 0; for(byte  b : a) t -= un(b); return (byte)  t;}
	public static short  sub(short ... a)          {int  t = 0; for(short b : a) t -= un(b); return (short) t;}
	public static int    sub(int   ... a)          {long t = 0; for(int   b : a) t -= un(b); return (int)   t;}

	public static byte   mul(byte    a, byte    b) {return (byte)  (un(a) * un(b));}
	public static short  mul(byte    a, short   b) {return (short) (un(a) * un(b));}
	public static int    mul(byte    a, int     b) {return (int)   (un(a) * un(b));}
	public static short  mul(short   a, byte    b) {return (short) (un(a) * un(b));}
	public static short  mul(short   a, short   b) {return (short) (un(a) * un(b));}
	public static int    mul(short   a, int     b) {return (int)   (un(a) * un(b));}
	public static int    mul(int     a, byte    b) {return (int)   (un(a) * un(b));}
	public static int    mul(int     a, short   b) {return (int)   (un(a) * un(b));}
	public static int    mul(int     a, int     b) {return (int)   (un(a) * un(b));}
	public static byte   mul(byte  ... a)          {int  t = 0; for(byte  b : a) t *= un(b); return (byte)  t;}
	public static short  mul(short ... a)          {int  t = 0; for(short b : a) t *= un(b); return (short) t;}
	public static int    mul(int   ... a)          {long t = 0; for(int   b : a) t *= un(b); return (int)   t;}

	public static byte   div(byte    a, byte    b) {return (byte)  (un(a) / un(b));}
	public static short  div(byte    a, short   b) {return (short) (un(a) / un(b));}
	public static int    div(byte    a, int     b) {return (int)   (un(a) / un(b));}
	public static short  div(short   a, byte    b) {return (short) (un(a) / un(b));}
	public static short  div(short   a, short   b) {return (short) (un(a) / un(b));}
	public static int    div(short   a, int     b) {return (int)   (un(a) / un(b));}
	public static int    div(int     a, byte    b) {return (int)   (un(a) / un(b));}
	public static int    div(int     a, short   b) {return (int)   (un(a) / un(b));}
	public static int    div(int     a, int     b) {return (int)   (un(a) / un(b));}
	public static byte   div(byte  ... a)          {int  t = 0; for(byte  b : a) t /= un(b); return (byte)  t;}
	public static short  div(short ... a)          {int  t = 0; for(short b : a) t /= un(b); return (short) t;}
	public static int    div(int   ... a)          {long t = 0; for(int   b : a) t /= un(b); return (int)   t;}

	public static byte   mod(byte    a, byte    b) {return (byte)  (un(a) % un(b));}
	public static short  mod(byte    a, short   b) {return (short) (un(a) % un(b));}
	public static int    mod(byte    a, int     b) {return (int)   (un(a) % un(b));}
	public static short  mod(short   a, byte    b) {return (short) (un(a) % un(b));}
	public static short  mod(short   a, short   b) {return (short) (un(a) % un(b));}
	public static int    mod(short   a, int     b) {return (int)   (un(a) % un(b));}
	public static int    mod(int     a, byte    b) {return (int)   (un(a) % un(b));}
	public static int    mod(int     a, short   b) {return (int)   (un(a) % un(b));}
	public static int    mod(int     a, int     b) {return (int)   (un(a) % un(b));}
	public static byte   mod(byte  ... a)          {int  t = 0; for(byte  b : a) t %= un(b); return (byte)  t;}
	public static short  mod(short ... a)          {int  t = 0; for(short b : a) t %= un(b); return (short) t;}
	public static int    mod(int   ... a)          {long t = 0; for(int   b : a) t %= un(b); return (int)   t;}

	public static byte   rotl(byte    a)            {return rotl(a, (byte)  1);}
	public static short  rotl(short   a)            {return rotl(a, (short) 1);}
	public static int    rotl(int     a)            {return rotl(a, (int)   1);}
	public static byte   rotl(byte    a, byte    b) {byte  c = mod(b, (byte)  8 ); return (byte)  ((a << c) | (a >>> (7  - c)));}
	public static short  rotl(byte    a, short   b) {short c = mod(b, (short) 16); return (short) ((a << c) | (a >>> (15 - c)));}
	public static int    rotl(byte    a, int     b) {int   c = mod(b, (int)   32); return (int)   ((a << c) | (a >>> (31 - c)));}
	public static short  rotl(short   a, byte    b) {short c = mod(b, (short) 16); return (short) ((a << c) | (a >>> (15 - c)));}
	public static short  rotl(short   a, short   b) {short c = mod(b, (short) 16); return (short) ((a << c) | (a >>> (15 - c)));}
	public static int    rotl(short   a, int     b) {int   c = mod(b, (int)   32); return (int)   ((a << c) | (a >>> (31 - c)));}
	public static int    rotl(int     a, byte    b) {int   c = mod(b, (int)   32); return (int)   ((a << c) | (a >>> (31 - c)));}
	public static int    rotl(int     a, short   b) {int   c = mod(b, (int)   32); return (int)   ((a << c) | (a >>> (31 - c)));}
	public static int    rotl(int     a, int     b) {int   c = mod(b, (int)   32); return (int)   ((a << c) | (a >>> (31 - c)));}

	public static byte   rotr(byte    a)            {return rotr(a, (byte)  1);}
	public static short  rotr(short   a)            {return rotr(a, (short) 1);}
	public static int    rotr(int     a)            {return rotr(a, (int)   1);}
	public static byte   rotr(byte    a, byte    b) {byte  c = mod(b, (byte)  8 ); return (byte)  ((a >>> c) | (a << (7  - c)));}
	public static short  rotr(byte    a, short   b) {short c = mod(b, (short) 16); return (short) ((a >>> c) | (a << (15 - c)));}
	public static int    rotr(byte    a, int     b) {int   c = mod(b, (int)   32); return (int)   ((a >>> c) | (a << (31 - c)));}
	public static short  rotr(short   a, byte    b) {short c = mod(b, (short) 16); return (short) ((a >>> c) | (a << (15 - c)));}
	public static short  rotr(short   a, short   b) {short c = mod(b, (short) 16); return (short) ((a >>> c) | (a << (15 - c)));}
	public static int    rotr(short   a, int     b) {int   c = mod(b, (int)   32); return (int)   ((a >>> c) | (a << (31 - c)));}
	public static int    rotr(int     a, byte    b) {int   c = mod(b, (int)   32); return (int)   ((a >>> c) | (a << (31 - c)));}
	public static int    rotr(int     a, short   b) {int   c = mod(b, (int)   32); return (int)   ((a >>> c) | (a << (31 - c)));}
	public static int    rotr(int     a, int     b) {int   c = mod(b, (int)   32); return (int)   ((a >>> c) | (a << (31 - c)));}
	
	public static byte   shiftl(byte    a)            {return shiftl(a, (byte)  1);}
	public static short  shiftl(short   a)            {return shiftl(a, (short) 1);}
	public static int    shiftl(int     a)            {return shiftl(a, (int)   1);}
	public static byte   shiftl(byte    a, byte    b) {return (byte)  (un(a) << un(b));}
	public static short  shiftl(byte    a, short   b) {return (short) (un(a) << un(b));}
	public static int    shiftl(byte    a, int     b) {return (int)   (un(a) << un(b));}
	public static short  shiftl(short   a, byte    b) {return (short) (un(a) << un(b));}
	public static short  shiftl(short   a, short   b) {return (short) (un(a) << un(b));}
	public static int    shiftl(short   a, int     b) {return (int)   (un(a) << un(b));}
	public static int    shiftl(int     a, byte    b) {return (int)   (un(a) << un(b));}
	public static int    shiftl(int     a, short   b) {return (int)   (un(a) << un(b));}
	public static int    shiftl(int     a, int     b) {return (int)   (un(a) << un(b));}

	public static byte   shiftr(byte    a)            {return shiftr(a, (byte)  1);}
	public static short  shiftr(short   a)            {return shiftr(a, (short) 1);}
	public static int    shiftr(int     a)            {return shiftr(a, (int)   1);}
	public static byte   shiftr(byte    a, byte    b) {return (byte)  (un(a) >>> un(b));}
	public static short  shiftr(byte    a, short   b) {return (short) (un(a) >>> un(b));}
	public static int    shiftr(byte    a, int     b) {return (int)   (un(a) >>> un(b));}
	public static short  shiftr(short   a, byte    b) {return (short) (un(a) >>> un(b));}
	public static short  shiftr(short   a, short   b) {return (short) (un(a) >>> un(b));}
	public static int    shiftr(short   a, int     b) {return (int)   (un(a) >>> un(b));}
	public static int    shiftr(int     a, byte    b) {return (int)   (un(a) >>> un(b));}
	public static int    shiftr(int     a, short   b) {return (int)   (un(a) >>> un(b));}
	public static int    shiftr(int     a, int     b) {return (int)   (un(a) >>> un(b));}

	public static byte   and(byte    a, byte    b) {return (byte)  (un(a) & un(b));}
	public static short  and(byte    a, short   b) {return (short) (un(a) & un(b));}
	public static int    and(byte    a, int     b) {return (int)   (un(a) & un(b));}
	public static short  and(short   a, byte    b) {return (short) (un(a) & un(b));}
	public static short  and(short   a, short   b) {return (short) (un(a) & un(b));}
	public static int    and(short   a, int     b) {return (int)   (un(a) & un(b));}
	public static int    and(int     a, byte    b) {return (int)   (un(a) & un(b));}
	public static int    and(int     a, short   b) {return (int)   (un(a) & un(b));}
	public static int    and(int     a, int     b) {return (int)   (un(a) & un(b));}
	public static byte   and(byte  ... a)          {int  t = 0; for(byte  b : a) t &= un(b); return (byte)  t;}
	public static short  and(short ... a)          {int  t = 0; for(short b : a) t &= un(b); return (short) t;}
	public static int    and(int   ... a)          {long t = 0; for(int   b : a) t &= un(b); return (int)   t;}

	public static byte   xor(byte    a, byte    b) {return (byte)  (un(a) ^ un(b));}
	public static short  xor(byte    a, short   b) {return (short) (un(a) ^ un(b));}
	public static int    xor(byte    a, int     b) {return (int)   (un(a) ^ un(b));}
	public static short  xor(short   a, byte    b) {return (short) (un(a) ^ un(b));}
	public static short  xor(short   a, short   b) {return (short) (un(a) ^ un(b));}
	public static int    xor(short   a, int     b) {return (int)   (un(a) ^ un(b));}
	public static int    xor(int     a, byte    b) {return (int)   (un(a) ^ un(b));}
	public static int    xor(int     a, short   b) {return (int)   (un(a) ^ un(b));}
	public static int    xor(int     a, int     b) {return (int)   (un(a) ^ un(b));}
	public static byte   xor(byte  ... a)          {int  t = 0; for(byte  b : a) t ^= un(b); return (byte)  t;}
	public static short  xor(short ... a)          {int  t = 0; for(short b : a) t ^= un(b); return (short) t;}
	public static int    xor(int   ... a)          {long t = 0; for(int   b : a) t ^= un(b); return (int)   t;}

	public static byte   or (byte    a, byte    b) {return (byte)  (un(a) | un(b));}
	public static short  or (byte    a, short   b) {return (short) (un(a) | un(b));}
	public static int    or (byte    a, int     b) {return (int)   (un(a) | un(b));}
	public static short  or (short   a, byte    b) {return (short) (un(a) | un(b));}
	public static short  or (short   a, short   b) {return (short) (un(a) | un(b));}
	public static int    or (short   a, int     b) {return (int)   (un(a) | un(b));}
	public static int    or (int     a, byte    b) {return (int)   (un(a) | un(b));}
	public static int    or (int     a, short   b) {return (int)   (un(a) | un(b));}
	public static int    or (int     a, int     b) {return (int)   (un(a) | un(b));}
	public static byte   or (byte  ... a)          {int  t = 0; for(byte  b : a) t |= un(b); return (byte)  t;}
	public static short  or (short ... a)          {int  t = 0; for(short b : a) t |= un(b); return (short) t;}
	public static int    or (int   ... a)          {long t = 0; for(int   b : a) t |= un(b); return (int)   t;}
}
