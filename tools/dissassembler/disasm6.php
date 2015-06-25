<?php

/**
 *    DISASM6 - A NES-oriented 6502 disassembler which produces asm6 code
 *    Created by Frantik 2011
 *
 */

define('LEFT_MARGIN',   '            ');
define('VERSION',       '1.4');

$time_start = microtime(true);

$opcodes = array(
// byte => legal, text, bytes, cycles, addressing mode
   0x00 => array( 0, 'BRK', 1, 0, 0),
   0x01 => array( 0, 'ORA', 2, 6, 7),
   0x02 => array( 1, 'KIL', 1, 0, 0),
   0x03 => array( 1, 'SLO', 2, 8, 7),
   0x04 => array( 1, 'NOP', 2, 3, 4),
   0x05 => array( 0, 'ORA', 2, 3, 4),
   0x06 => array( 0, 'ASL', 2, 5, 4),
   0x07 => array( 1, 'SLO', 2, 5, 4),
   0x08 => array( 0, 'PHP', 1, 3, 0),
   0x09 => array( 0, 'ORA', 2, 2, 0),
   0x0A => array( 0, 'ASL', 1, 2, 0),
   0x0B => array( 1, 'ANC', 2, 2, 0),
   0x0C => array( 1, 'NOP', 3, 4, 1),
   0x0D => array( 0, 'ORA', 3, 4, 1),
   0x0E => array( 0, 'ASL', 3, 6, 1),
   0x0F => array( 1, 'SLO', 3, 6, 1),
   0x10 => array( 0, 'BPL', 2, 3, 0),
   0x11 => array( 0, 'ORA', 2, 5, 8),
   0x12 => array( 1, 'KIL', 1, 0, 0),
   0x13 => array( 1, 'SLO', 2, 8, 8),
   0x14 => array( 1, 'NOP', 2, 4, 5),
   0x15 => array( 0, 'ORA', 2, 4, 5),
   0x16 => array( 0, 'ASL', 2, 6, 5),
   0x17 => array( 1, 'SLO', 2, 6, 5),
   0x18 => array( 0, 'CLC', 1, 2, 0),
   0x19 => array( 0, 'ORA', 3, 4, 3),
   0x1A => array( 1, 'NOP', 1, 2, 0),
   0x1B => array( 1, 'SLO', 3, 7, 3),
   0x1C => array( 1, 'NOP', 3, 4, 2),
   0x1D => array( 0, 'ORA', 3, 4, 2),
   0x1E => array( 0, 'ASL', 3, 7, 2),
   0x1F => array( 1, 'SLO', 3, 7, 2),
   0x20 => array( 0, 'JSR', 3, 6, 10),
   0x21 => array( 0, 'AND', 2, 6, 7),
   0x22 => array( 1, 'KIL', 1, 0, 0),
   0x23 => array( 1, 'RLA', 2, 8, 7),
   0x24 => array( 0, 'BIT', 2, 3, 4),
   0x25 => array( 0, 'AND', 2, 3, 4),
   0x26 => array( 0, 'ROL', 2, 5, 4),
   0x27 => array( 1, 'RLA', 2, 5, 4),
   0x28 => array( 0, 'PLP', 1, 4, 0),
   0x29 => array( 0, 'AND', 2, 2, 0),
   0x2A => array( 0, 'ROL', 1, 2, 0),
   0x2B => array( 1, 'ANC', 2, 2, 0),
   0x2C => array( 0, 'BIT', 3, 4, 1),
   0x2D => array( 0, 'AND', 3, 4, 1),
   0x2E => array( 0, 'ROL', 3, 6, 1),
   0x2F => array( 1, 'RLA', 3, 6, 1),
   0x30 => array( 0, 'BMI', 2, 2, 0),
   0x31 => array( 0, 'AND', 2, 5, 8),
   0x32 => array( 1, 'KIL', 1, 0, 0),
   0x33 => array( 1, 'RLA', 2, 8, 8),
   0x34 => array( 1, 'NOP', 2, 4, 5),
   0x35 => array( 0, 'AND', 2, 4, 5),
   0x36 => array( 0, 'ROL', 2, 6, 5),
   0x37 => array( 1, 'RLA', 2, 6, 5),
   0x38 => array( 0, 'SEC', 1, 2, 0),
   0x39 => array( 0, 'AND', 3, 4, 3),
   0x3A => array( 1, 'NOP', 1, 2, 0),
   0x3B => array( 1, 'RLA', 3, 7, 3),
   0x3C => array( 1, 'NOP', 3, 4, 2),
   0x3D => array( 0, 'AND', 3, 4, 2),
   0x3E => array( 0, 'ROL', 3, 7, 2),
   0x3F => array( 1, 'RLA', 3, 7, 2),
   0x40 => array( 0, 'RTI', 1, 6, 0),
   0x41 => array( 0, 'EOR', 2, 6, 7),
   0x42 => array( 1, 'KIL', 1, 0, 0),
   0x43 => array( 1, 'SRE', 2, 8, 7),
   0x44 => array( 1, 'NOP', 2, 3, 4),
   0x45 => array( 0, 'EOR', 2, 3, 4),
   0x46 => array( 0, 'LSR', 2, 5, 4),
   0x47 => array( 1, 'SRE', 2, 5, 4),
   0x48 => array( 0, 'PHA', 1, 3, 0),
   0x49 => array( 0, 'EOR', 2, 2, 0),
   0x4A => array( 0, 'LSR', 1, 2, 0),
   0x4B => array( 1, 'ALR', 2, 2, 0),
   0x4C => array( 0, 'JMP', 3, 3, 10),
   0x4D => array( 0, 'EOR', 3, 4, 1),
   0x4E => array( 0, 'LSR', 3, 6, 1),
   0x4F => array( 1, 'SRE', 3, 6, 1),
   0x50 => array( 0, 'BVC', 2, 3, 0),
   0x51 => array( 0, 'EOR', 2, 5, 8),
   0x52 => array( 1, 'KIL', 1, 0, 0),
   0x53 => array( 1, 'SRE', 2, 8, 8),
   0x54 => array( 1, 'NOP', 2, 4, 5),
   0x55 => array( 0, 'EOR', 2, 4, 5),
   0x56 => array( 0, 'LSR', 2, 6, 5),
   0x57 => array( 1, 'SRE', 2, 6, 5),
   0x58 => array( 0, 'CLI', 1, 2, 0),
   0x59 => array( 0, 'EOR', 3, 4, 3),
   0x5A => array( 1, 'NOP', 1, 2, 0),
   0x5B => array( 1, 'SRE', 3, 7, 3),
   0x5C => array( 1, 'NOP', 3, 4, 2),
   0x5D => array( 0, 'EOR', 3, 4, 2),
   0x5E => array( 0, 'LSR', 3, 7, 2),
   0x5F => array( 1, 'SRE', 3, 7, 2),
   0x60 => array( 0, 'RTS', 1, 6, 0),
   0x61 => array( 0, 'ADC', 2, 6, 7),
   0x62 => array( 1, 'KIL', 1, 0, 0),
   0x63 => array( 1, 'RRA', 2, 8, 7),
   0x64 => array( 1, 'NOP', 2, 3, 4),
   0x65 => array( 0, 'ADC', 2, 3, 4),
   0x66 => array( 0, 'ROR', 2, 5, 4),
   0x67 => array( 1, 'RRA', 2, 5, 4),
   0x68 => array( 0, 'PLA', 1, 4, 0),
   0x69 => array( 0, 'ADC', 2, 2, 0),
   0x6A => array( 0, 'ROR', 1, 2, 0),
   0x6B => array( 1, 'ARR', 2, 2, 0),
   0x6C => array( 0, 'JMP', 3, 5, 9),
   0x6D => array( 0, 'ADC', 3, 4, 1),
   0x6E => array( 0, 'ROR', 3, 6, 1),
   0x6F => array( 1, 'RRA', 3, 6, 1),
   0x70 => array( 0, 'BVS', 2, 2, 0),
   0x71 => array( 0, 'ADC', 2, 5, 8),
   0x72 => array( 1, 'KIL', 1, 0, 0),
   0x73 => array( 1, 'RRA', 2, 8, 8),
   0x74 => array( 1, 'NOP', 2, 4, 5),
   0x75 => array( 0, 'ADC', 2, 4, 5),
   0x76 => array( 0, 'ROR', 2, 6, 5),
   0x77 => array( 1, 'RRA', 2, 6, 5),
   0x78 => array( 0, 'SEI', 1, 2, 0),
   0x79 => array( 0, 'ADC', 3, 4, 3),
   0x7A => array( 1, 'NOP', 1, 2, 0),
   0x7B => array( 1, 'RRA', 3, 7, 3),
   0x7C => array( 1, 'NOP', 3, 4, 2),
   0x7D => array( 0, 'ADC', 3, 4, 2),
   0x7E => array( 0, 'ROR', 3, 7, 2),
   0x7F => array( 1, 'RRA', 3, 7, 2),
   0x80 => array( 1, 'NOP', 2, 2, 0),
   0x81 => array( 0, 'STA', 2, 6, 7),
   0x82 => array( 1, 'NOP', 2, 2, 0),
   0x83 => array( 1, 'SAX', 2, 6, 7),
   0x84 => array( 0, 'STY', 2, 3, 4),
   0x85 => array( 0, 'STA', 2, 3, 4),
   0x86 => array( 0, 'STX', 2, 3, 4),
   0x87 => array( 1, 'SAX', 2, 3, 4),
   0x88 => array( 0, 'DEY', 1, 2, 0),
   0x89 => array( 1, 'NOP', 2, 2, 0),
   0x8A => array( 0, 'TXA', 1, 2, 0),
   0x8B => array( 1, 'XAA', 2, 2, 0),
   0x8C => array( 0, 'STY', 3, 4, 1),
   0x8D => array( 0, 'STA', 3, 4, 1),
   0x8E => array( 0, 'STX', 3, 4, 1),
   0x8F => array( 1, 'SAX', 3, 4, 1),
   0x90 => array( 0, 'BCC', 2, 3, 0),
   0x91 => array( 0, 'STA', 2, 6, 8),
   0x92 => array( 1, 'KIL', 1, 0, 0),
   0x93 => array( 1, 'AHX', 2, 6, 8),
   0x94 => array( 0, 'STY', 2, 4, 5),
   0x95 => array( 0, 'STA', 2, 4, 5),
   0x96 => array( 0, 'STX', 2, 4, 6),
   0x97 => array( 1, 'SAX', 2, 4, 6),
   0x98 => array( 0, 'TYA', 1, 2, 0),
   0x99 => array( 0, 'STA', 3, 5, 3),
   0x9A => array( 0, 'TXS', 1, 2, 0),
   0x9B => array( 1, 'TAS', 1, 5, 0),
   0x9C => array( 1, 'SHY', 3, 5, 2),
   0x9D => array( 0, 'STA', 3, 5, 2),
   0x9E => array( 1, 'SHX', 3, 5, 3),
   0x9F => array( 1, 'AHX', 3, 5, 3),
   0xA0 => array( 0, 'LDY', 2, 2, 0),
   0xA1 => array( 0, 'LDA', 2, 6, 7),
   0xA2 => array( 0, 'LDX', 2, 2, 0),
   0xA3 => array( 1, 'LAX', 2, 6, 7),
   0xA4 => array( 0, 'LDY', 2, 3, 4),
   0xA5 => array( 0, 'LDA', 2, 3, 4),
   0xA6 => array( 0, 'LDX', 2, 3, 4),
   0xA7 => array( 1, 'LAX', 2, 3, 4),
   0xA8 => array( 0, 'TAY', 1, 2, 0),
   0xA9 => array( 0, 'LDA', 2, 2, 0),
   0xAA => array( 0, 'TAX', 1, 2, 0),
   0xAB => array( 1, 'LAX', 2, 2, 0),
   0xAC => array( 0, 'LDY', 3, 4, 1),
   0xAD => array( 0, 'LDA', 3, 4, 1),
   0xAE => array( 0, 'LDX', 3, 4, 1),
   0xAF => array( 1, 'LAX', 3, 4, 1),
   0xB0 => array( 0, 'BCS', 2, 2, 0),
   0xB1 => array( 0, 'LDA', 2, 5, 8),
   0xB2 => array( 1, 'KIL', 1, 0, 0),
   0xB3 => array( 1, 'LAX', 2, 5, 8),
   0xB4 => array( 0, 'LDY', 2, 4, 5),
   0xB5 => array( 0, 'LDA', 2, 4, 5),
   0xB6 => array( 0, 'LDX', 2, 4, 6),
   0xB7 => array( 1, 'LAX', 2, 4, 6),
   0xB8 => array( 0, 'CLV', 1, 2, 0),
   0xB9 => array( 0, 'LDA', 3, 4, 3),
   0xBA => array( 0, 'TSX', 1, 2, 0),
   0xBB => array( 1, 'LAS', 3, 4, 3),
   0xBC => array( 0, 'LDY', 3, 4, 2),
   0xBD => array( 0, 'LDA', 3, 4, 2),
   0xBE => array( 0, 'LDX', 3, 4, 3),
   0xBF => array( 1, 'LAX', 3, 4, 3),
   0xC0 => array( 0, 'CPY', 2, 2, 0),
   0xC1 => array( 0, 'CMP', 2, 6, 7),
   0xC2 => array( 1, 'NOP', 2, 2, 0),
   0xC3 => array( 1, 'DCP', 2, 8, 7),
   0xC4 => array( 0, 'CPY', 2, 3, 4),
   0xC5 => array( 0, 'CMP', 2, 3, 4),
   0xC6 => array( 0, 'DEC', 2, 5, 4),
   0xC7 => array( 1, 'DCP', 2, 5, 4),
   0xC8 => array( 0, 'INY', 1, 2, 0),
   0xC9 => array( 0, 'CMP', 2, 2, 0),
   0xCA => array( 0, 'DEX', 1, 2, 0),
   0xCB => array( 1, 'AXS', 2, 2, 0),
   0xCC => array( 0, 'CPY', 3, 4, 1),
   0xCD => array( 0, 'CMP', 3, 4, 1),
   0xCE => array( 0, 'DEC', 3, 6, 1),
   0xCF => array( 1, 'DCP', 3, 6, 1),
   0xD0 => array( 0, 'BNE', 2, 3, 0),
   0xD1 => array( 0, 'CMP', 2, 5, 8),
   0xD2 => array( 1, 'KIL', 1, 0, 0),
   0xD3 => array( 1, 'DCP', 2, 8, 8),
   0xD4 => array( 1, 'NOP', 2, 4, 5),
   0xD5 => array( 0, 'CMP', 2, 4, 5),
   0xD6 => array( 0, 'DEC', 2, 6, 5),
   0xD7 => array( 1, 'DCP', 2, 6, 5),
   0xD8 => array( 0, 'CLD', 1, 2, 0),
   0xD9 => array( 0, 'CMP', 3, 4, 3),
   0xDA => array( 1, 'NOP', 1, 2, 0),
   0xDB => array( 1, 'DCP', 3, 7, 3),
   0xDC => array( 1, 'NOP', 3, 4, 2),
   0xDD => array( 0, 'CMP', 3, 4, 2),
   0xDE => array( 0, 'DEC', 3, 7, 2),
   0xDF => array( 1, 'DCP', 3, 7, 2),
   0xE0 => array( 0, 'CPX', 2, 2, 0),
   0xE1 => array( 0, 'SBC', 2, 6, 7),
   0xE2 => array( 1, 'NOP', 2, 2, 0),
   0xE3 => array( 1, 'ISC', 2, 8, 7),
   0xE4 => array( 0, 'CPX', 2, 3, 4),
   0xE5 => array( 0, 'SBC', 2, 3, 4),
   0xE6 => array( 0, 'INC', 2, 5, 4),
   0xE7 => array( 1, 'ISC', 2, 5, 4),
   0xE8 => array( 0, 'INX', 1, 2, 0),
   0xE9 => array( 0, 'SBC', 2, 2, 0),
   0xEA => array( 0, 'NOP', 1, 2, 0),
   0xEB => array( 1, 'SBC', 2, 2, 0),
   0xEC => array( 0, 'CPX', 3, 4, 1),
   0xED => array( 0, 'SBC', 3, 4, 1),
   0xEE => array( 0, 'INC', 3, 6, 1),
   0xEF => array( 1, 'ISC', 3, 6, 1),
   0xF0 => array( 0, 'BEQ', 2, 2, 0),
   0xF1 => array( 0, 'SBC', 2, 5, 8),
   0xF2 => array( 1, 'KIL', 1, 0, 0),
   0xF3 => array( 1, 'ISC', 2, 8, 8),
   0xF4 => array( 1, 'NOP', 2, 4, 5),
   0xF5 => array( 0, 'SBC', 2, 4, 5),
   0xF6 => array( 0, 'INC', 2, 6, 5),
   0xF7 => array( 1, 'ISC', 2, 6, 5),
   0xF8 => array( 0, 'SED', 1, 2, 0),
   0xF9 => array( 0, 'SBC', 3, 4, 3),
   0xFA => array( 1, 'NOP', 1, 2, 0),
   0xFB => array( 1, 'ISC', 3, 7, 3),
   0xFC => array( 1, 'NOP', 3, 4, 2),
   0xFD => array( 0, 'SBC', 3, 4, 2),
   0xFE => array( 0, 'INC', 3, 7, 2),
   0xFF => array( 1, 'ISC', 3, 7, 2),
);


$registers = array(
   '2000' => 'PPUCTRL',
   '2001' => 'PPUMASK',
   '2002' => 'PPUSTATUS',
   '2003' => 'OAMADDR',
   '2004' => 'OAMDATA',
   '2005' => 'PPUSCROLL',
   '2006' => 'PPUADDR',
   '2007' => 'PPUDATA',

   '4000' => 'SQ1_VOL',
   '4001' => 'SQ1_SWEEP',
   '4002' => 'SQ1_LO',
   '4003' => 'SQ1_HI',
   '4004' => 'SQ2_VOL',
   '4005' => 'SQ2_SWEEP',
   '4006' => 'SQ2_LO',
   '4007' => 'SQ2_HI',
   '4008' => 'TRI_LINEAR',
   '400A' => 'TRI_LO',
   '400B' => 'TRI_HI',
   '400C' => 'NOISE_VOL',
   '400E' => 'NOISE_LO',
   '400F' => 'NOISE_HI',
   '4010' => 'DMC_FREQ',
   '4011' => 'DMC_RAW',
   '4012' => 'DMC_START',
   '4013' => 'DMC_LEN',
   '4014' => 'OAM_DMA',
   '4015' => 'SND_CHN',
   '4016' => 'JOY1',
   '4017' => 'JOY2',

);

// used for branch opcodes
function addressOffset($value, $offset)
{
   $offset = hexdec($offset);
   $offset += 2; // length of brance command
   if ($offset > 0x80)
   {
      $offset = $offset - 0x100;
   }
   else
   {
      //$offset += 2;
   }
   return str_pad(dechex($value +  $offset), 4, '0', STR_PAD_LEFT);
}

function isValidLabel($addr)
{
   global $origin;

   $newaddr = hexdec($addr);

   return ($newaddr >= $origin && $newaddr < 0xFFFA);
}

function addValidLabel($addr, &$labels)
{
   if (isValidLabel($addr) && !isset($labels[$addr]))
   {
      $labels[$addr] = true;
      return true;
   }

   return false;
}


function addVector($vector, $str, &$labels)
{
   if (isset($labels[$vector]))
   {
      if ($labels[$vector] === true)
      {
         $labels[$vector] = $str;
      }
      elseif (is_array($labels[$vector]))
      {
         if( !in_array($str, $labels[$vector]))
         {
            $labels[$vector][] = $str;
         }
      }
      elseif ($labels[$vector] !== $str)
      {
         $labels[$vector] = array($labels[$vector], $str);
      }
   }
   else
   {
      $labels[$vector] = $str;
   }
}

function wordStr($str)
{
   return dechex_pad(ord($str[1])) . dechex_pad(ord($str[0]));
}

// make sure hex values have leading zeros
function dechex_pad($dec , $len = 2)
{

   if ($dec > 0xFF)
   {
      $len = 4;
   }
   elseif ($dec > 0xFFFF)
   {
      $len = 6;
   }

   return str_pad(dechex($dec), $len, '0', STR_PAD_LEFT);
}

// make sure binary values have leading zeros
function decbin_pad($dec , $len = 8)
{

   if ($dec > 0xFF)
   {
      $len = 16;
   }
   elseif ($dec > 0xFFFF)
   {
      $len = 32;
   }

   return str_pad(decbin($dec), $len, '0', STR_PAD_LEFT);
}

function commentLine($len = 80)
{
   return ";" . str_repeat('-', $len - 1) . "\n";
}

function commentHeader($text, $initialNL = true, $initialLine = true)
{
   $ret = ($initialNL ? "\n" : '') . ($initialLine ? commentLine() : '');
   $ret .= "; $text";
   $ret .= "\n" . commentLine();

   return $ret;
}

function strToHex($str, $fancy = false)
{
   $len = strlen($str);

   $ret = '';

   for($i = 0; $i < $len; $i++)
   {
      $ret .= ($fancy ? '$' : '') . dechex_pad(ord($str[$i]));

      if ($i < $len - 1)
      {  $ret .= ($fancy ? ',' : '') . " ";
      }
   }

   return $ret;
}



function getHeaderInfo($file)
{
	$oldloc = ftell($file);

   $head = fread($file, 0x4);

   if ($head == "NES" . chr(0x1A))
   {
      $info = new stdClass;

      $info->head = $head;
      $info->prg = ord(fread($file, 1));
      $info->chr = ord(fread($file, 1));
      $info->ctrl_1 = ord(fread($file, 1));
      $info->ctrl_2 = ord(fread($file, 1));
      $info->tail = fread($file, 8);

      $info->mirroring = $info->ctrl_1 & bindec('00000001');
      $info->sram = ($info->ctrl_1 & bindec('0000010')) >> 1;
      $info->trainer = ($info->ctrl_1 & bindec('00000100')) >> 2;
      $info->fourscreen = ($info->ctrl_1 & bindec('00001000')) >> 3;

      $info->romtype = $info->ctrl_2 & bindec('00000011');

      $info->mapper = (($info->ctrl_1 & bindec('11110000')) >> 4)
         + $info->ctrl_2 & bindec('00001111');

      return $info;

   }
   else
   {
      fseek($file, $oldloc);
      return false;
   }
}

function processHeaderInfo($info)
{
   global $labelLen;

   $pad = 30 + $labelLen;
   $ret = '';
   if (is_object($info))
   {
      //$ret .= commentLine();
      $ret .= commentHeader("iNES Header");
      $ret .= str_pad(LEFT_MARGIN . '.db "NES", $1A', $pad) . " ; Header\n";
      $ret .= str_pad(LEFT_MARGIN . ".db $info->prg", $pad) . " ; $info->prg x 16k PRG banks\n";
      $ret .= str_pad(LEFT_MARGIN . ".db $info->chr", $pad) . " ; $info->chr x 8k CHR banks\n";
      $ret .= str_pad(LEFT_MARGIN . ".db %" . decbin_pad($info->ctrl_1), $pad) . " ; Mirroring: " . ($info->mirroring ? 'Vertical' : 'Horizontal') . "\n";
      $ret .= str_repeat(" ", $pad) . " ; SRAM: " . ($info->sram ? 'Enabled' : 'Not used') . "\n";
      $ret .= str_repeat(" ", $pad) . " ; 512k Trainer: " . ($info->trainer ? 'Enabled' : 'Not used') . "\n";
      $ret .= str_repeat(" ", $pad) . " ; 4 Screen VRAM: " . ($info->fourscreen ? 'Enabled' : 'Not used') . "\n";
      $ret .= str_repeat(" ", $pad) . " ; Mapper: " . $info->mapper . "\n";

      switch($info->romtype)
      {
         case 0:
            $romtype = 'NES';
         break;
         case 1:
            $romtype = 'VS Unisystem';
         break;
         case 2:
            $romtype = 'Playchoice 10';
         break;
      }
      $ret .= str_pad(LEFT_MARGIN . ".db %" . decbin_pad($info->ctrl_2), $pad) . " ; RomType: " . $romtype . "\n";

      $ret .= str_pad(LEFT_MARGIN . ".hex " . strToHex(substr($info->tail,0,4)), $pad) . " ; iNES Tail \n";
      $ret .= str_pad(LEFT_MARGIN . ".hex " . strToHex(substr($info->tail,4)), $pad) . "  \n";

      return $ret;
   }

   return false;
}

function toLittleEndianStr($str)
{
   return $str[2] . $str[3] . " " . $str[0] . $str[1];
}

function processVectors($nmi, $reset, $break)
{
   global $labelLen;

   $marginLen = strlen(LEFT_MARGIN);
   $pad = 30 + $marginLen;

   $ret = commentHeader('Vector Table');
   $line1 = str_pad("vectors:", $marginLen);
   $line1 .= ".dw nmi";
   $ret = $ret . str_pad($line1, $pad) . ' ; $fffa: ' . toLittleEndianStr($nmi) . "     Vector table\n";
   $ret .= str_pad(LEFT_MARGIN . ".dw reset", $pad) . ' ; $fffc: ' . toLittleEndianStr($reset) . "     Vector table\n";
   $ret .= str_pad(LEFT_MARGIN . ".dw irq", $pad) . ' ; $fffe: ' . toLittleEndianStr($break) . "     Vector table\n";

   return $ret;
}

function baseToDec($str)
{
	switch ($str{0})
	{
		case '0':
			if ($str[1] !== 'x')
			{	break;
			}
			else
			{
				return hexdec(substr($str,2));
			}
		break;

		case '$':
			return hexdec(substr($str,1));
		break;

		case '$':
			return bindec(substr($str,1));
		break;
	}
	return $str;
}

function readLabels($filename)
{
   $str = file_get_contents($filename);
   $arr = array();
   $str  = preg_replace('%;.*$%m', '', $str);

   $len = 0;
   if (preg_match_all('%^\s*([a-zA-Z0-9_\-\+\@]*)\s*\=\s*([\$\%]*)([a-fA-F0-9]*)%m', $str, $matches))
   {
      foreach($matches[0] as $n => $v)
      {  $matches[1][$n] = trim($matches[1][$n]);

         $thislen = strlen($matches[1][$n]);

         if ($thislen > $len)
         {
            $len = $thislen;
         }

         if (strlen($matches[1][$n]) > 0)
         {
            if ($matches[2][$n] == '')
            {  $matches[3][$n] = dechex_pad($matches[3][$n]);
            }

            if ($matches[2][$n] == '%')
            {
               $matches[3][$n] = dechex_pad(bindec($matches[3][$n]));
            }

            $arr[strtolower($matches[3][$n])] =  $matches[1][$n];
         }
      }
   }

   $arr['maxLength'] = $len;

   return $arr;
}

function outputLabels($arr, $text)
{
   global $origin;

   $ret = commentHeader($text);

   foreach ($arr as $n => $v)
   {
      if ($n == 'maxLength')
      {
         continue;
      }

      if (hexdec($n) < $origin)
      {
         $ret .= str_pad($v , 20) . ' = $' . $n . "\n";
      }
   }

   return $ret;

}

function outputHelp($text = false)
{
   global $argv;
   $dasm =  pathinfo($argv[0], PATHINFO_BASENAME);

   echo <<<ENDOFSTRING
Usage:

disasm6 <file> [-t <file>] [-o #] [-l <file>] [-cdl <file>] [-cdlo #] [-d] [-i]
         [-h] [-c] [-p #] [-r] [-lc] [-fs #] [-cs #] [-fe #] [-ce <#>] [-len #]

  <file>                The file to disassemble
  t     target <file>   Target output filename (default is input filename.asm)
  o     origin #        Set the program origin.
                           (default: 0x8000 for 32k roms, 0xC000 for 16k roms)
  l     labels <file>   Load user defined labels from file
  cdl   cdl <file>      Use a code/data log generated by FCEUX
  cdlo  cdloffset #     Set the offset of the cdl file
  d     nodetect        Disable 16kb prg size detection
  i	  ignoreheader    Do not look for iNES header
  h     noheader        Do not include iNES header (if found) in disassembly
  c     chr             Export CHR-ROM as file and include in disassembly
  p     passes #        Maximum number of passes (default: 9)
  r     registers       Use default NES registers
  lc    lowercase       Use lowercase mnemonics
  fs    filestart		   Start reading at a specific file location
  cs    codestart		   Start reading at a specific code location
  fe    fileend         Stop reading at a specific file location
  ce    codeend         Stop reading at a specific code location
  len   length			   Number of bytes to read
ENDOFSTRING;

   echo "\n" . ($text ? "\nERROR: $text\n" : '');
   exit;
}

function isCounterLabel($addr, $labels)
{
   $addr= dechex_pad($addr);

   if (isset($labels[$addr]))
   {
      if (preg_match('%^([^\+\-]+)[\+\-][0-9]+%', $labels[$addr]))
      {
         return false;
      }

      return true;
   }
   return false;

}

// Program start

$head =  "DISASM6 v" . VERSION ." - A NES-oriented 6502 disassembler - Created by Frantik 2011";
echo "\n$head\n" . str_repeat('-', 80) . "\n";



if (!isset($argv[1]))
{
   outputHelp();
}
elseif (!file_exists($argv[1]))
{
   outputHelp("File not found\n");
}
else
{
   $filename = $argv[1];
}

$origin = 0x8000;
$showHeader = true;
$includeChr = false;
$includeReg = false;
$originOverride = false;
$noDetect = false;
$shortname = pathinfo($filename, PATHINFO_FILENAME);
$labelFile = false;
$cdlFilename = false;
$ignoreHeader = false;
$fileStart = 0;
$fileStartOverride = false;
$fileLength = 0x10000;
$lengthOverride = false;
$fileEnd = 0;
$fileEndOverride = false;
$codeStart = 0;
$codeStartOverride = false;
$codeEnd = 0;
$codeEndOverride = false;
$cdlOffset = 0;

$lastPass = 9;

$marginLen = strlen(LEFT_MARGIN);

// check command line params
for ($i = 2; $i < $argc; $i++)
{
   $nextParam = false;

   if (isset($argv[$i + 1]) && substr($argv[$i + 1],0,1) != '-')
   {  $nextParam = $argv[$i + 1];
   }

   switch (strtolower($argv[$i]))
   {
      case "-o":
      case "-origin":

         if (!$nextParam)
         {  outputHelp("Must specify a valid origin");
         }

         $origin = baseToDec($argv[++$i]);
         $originOverride = true;
      break;

		case "-cs":
      case "-codestart":

         if (!$nextParam)
         {  outputHelp("Must specify a valid code start location ");
         }

         $codeStart = baseToDec($argv[++$i]);
         $codeStartOverride = true;

      break;

		case "-fs":
      case "-filestart":

         if (!$nextParam)
         {  outputHelp("Must specify a valid file start location ");
         }

         $fileStart = baseToDec($argv[++$i]);
         $fileStartOverride = true;
      break;

      case '-len':
      case '-length':
         if (!$nextParam)
         {  outputHelp("Must specify a valid length to read");
         }

         $fileLength = baseToDec($argv[++$i]);  // this will be tweaked later
         $lengthOverride = true;
      break;

		case "-fe":
      case "-fileend":

         if (!$nextParam)
         {  outputHelp("Must specify a valid file end location ");
         }

         $fileEnd = baseToDec($argv[++$i]);
         $fileEndOverride = true;
      break;

      case "-ce":
      case "-codeend":

         if (!$nextParam)
         {  outputHelp("Must specify a valid code end location ");
         }

         $fileLength = baseToDec($argv[++$i]); // will NOT be tweaked since lengthOverride isn't enable
         $codeEndOverride = true;
      break;


      case "-h":
      case '-noheader';
         $showHeader = false;
      break;

      case "-i":
      case '-ignoreheader';
         $ignoreHeader = true;
      break;

      case "-c":
      case "-chr":
         $includeChr = true;
      break;

      case '-r':
      case '-registers':
         $includeReg = true;
      break;

      case '-t':
      case '-target':
         if (!$nextParam)
         {  outputHelp("You must specify a target file");
         }

         $shortname = pathinfo(preg_replace("%[^a-zA-Z0-9_\-\. ]%", '', $argv[++$i]), PATHINFO_FILENAME);

      break;

      case '-p':
      case '-passes':
         if (!$nextParam || !is_numeric($nextParam))
         {  outputHelp("You must specify a number of passes");
         }

         $lastPass = (int)$argv[++$i];
      break;

      case '-nodetect':
      case '-d':
         $noDetect = true;
      break;

      case '-l':
      case '-labels':
         if (!$nextParam || !file_exists($nextParam))
         {  outputHelp("You must specify a valid file");
         }

         $labelFile = $argv[++$i];
      break;


      case '-cdl':
         if (!$nextParam || !file_exists($nextParam))
         {  outputHelp("You must specify a valid file");
         }

         $cdlFilename = $argv[++$i];
      break;

      case '-cdlo':
      case '-cdloffset':
         if (!$nextParam)
         {  outputHelp("You must specify a valid offset for the CDL");
         }

         $cdlOffset = baseToDec($argv[++$i]);
      break;


      case '-lc':
      case '-lowercase':
         foreach ($opcodes as $n => $v)
         {
            $opcodes[$n][1] = strtolower($opcodes[$n][1]);
         }
      break;

   }

}


if ($fileEndOverride)
{
	$fileLength = $fileStart + $fileEnd;
	$lengthOverride = true;
}



$file = fopen($filename, 'r');

$pass = 1;

$oldLabels = false;
$olderLabels = false;



$initLabels = array(
   'fffa' => "vectors",
   'fffc' => true,
   'fffe' => true,
 );

if ($includeReg)
{
   $initLabels += $registers;
}

$labelLen = 0;
if ($labelFile !== false)
{
   $fileLabels = readLabels($labelFile);
   $labelLen = $fileLabels['maxLength'] - 10;
   $labelLen = $labelLen < 0 ? 0: $labelLen;
   unset ($fileLabels['maxLength']);

   $initLabels += $fileLabels;

}

$cdlFile = false;
if ($cdlFilename !== false)
{
   $cdlFile = fopen($cdlFilename, 'r');
   $cdlByte = 0;
}


$header = false;
$theOldLabel = '';

$theText = commentHeader(pathinfo($filename, PATHINFO_BASENAME) . " disasembled by DISASM6 v" . VERSION, false);
//$invalidCounter = 0;

$prgBank = 0;
$theLabel = '';


//  This loop is done 4 times, once per pass.
//  The first pass we just collect addesses
//  The next passes we look for new addresses
//
//  The las pass we build the actual output
while ($pass <= $lastPass)
{
   if ($pass < 3)
   {  $labels = $initLabels;
   }
   $prgLabels = $initLabels;

   $counter = $origin;

   if ($fileStartOverride && !$codeStartOverride)
   {
   	fseek($file, $fileStart);
   }

   if (!$ignoreHeader)
   {
   	$headerInfo = getHeaderInfo($file);
   }
   else
   {
   	$headerInfo = false;
   }

   if ($codeStartOverride)
   {
   	fseek($file, $fileStart);
   }

   if ($headerInfo)
   {	$oldPrg = $headerInfo->prg;
   }
   else
   {

   }


   // do this stuff only on the first pass
   if ($pass == 1)
   {
      $oldDidDrawLine = false;
      $oldLabels = $labels;

      // check for 16k roms
      if (!$noDetect)
      {  $newPrg = false;
         if ($headerInfo && $headerInfo->prg == 2)
         {
            $prg0 = fread($file, 0x4000);
            $prg1 = fread($file, 0x4000);
            fseek($file, $fileStart + 0x10);

            if ($prg0 === $prg1 && $headerInfo->mapper == 0)
            {  echo "PRG Banks 0 and 1 are identical, 16k PRG suspected, use -d to disable check\n";
               $newPrg = 1;

               $origin = $originOverride ? $origin : 0xc000;

               if ($cdlFilename !== false)
               {
               	$cdlOffset += 0x4000;
               }
            }
         }
         elseif ($headerInfo && $headerInfo->prg == 1)
         {
            $origin = $originOverride ? $origin : 0xc000;
         }
      }


      echo "Using Origin: 0x" . dechex_pad($origin) . "\n\n";


      if ($headerInfo !== false)
      {
         echo 'NES Header Found - ' .  ($showHeader ? 'included in disassembly' : 'not included') ."\n";
      }

      if ($labelFile !== false)
      {
         echo "Using user defined labels\n";
      }

      if ($includeReg)
      {
         echo "Using NES registers\n";
      }

      if ($cdlFilename !== false)
      {
         echo "Using code/data log\n";
      }

      if ($fileStartOverride && !$codeStartOverride)
      {
      	echo "Starting at file location 0x" . dechex_pad($fileStart) ."\n";
      }

      if ($codeStartOverride)
      {
      	$fileStart = $codeStart - $origin + ($headerInfo ? 10 : 0);
         $origin = $codeStart;
         $originOverride = true;

			$fileStartOverride = true;
			fseek($file, $fileStart);

			$cdlOffset += $fileStart - ($headerInfo ? 10 : 0);


			echo "Starting at code location $" . dechex_pad($fileStart)."\n";
      }

      if ($lengthOverride)
      {
      	echo "Reading 0x" . dechex_pad($fileLength) . " bytes\n";

			$fileLength += $origin - ($headerInfo ? 0x10 : 0);
      }


      if ($includeChr && $headerInfo !== false)
      {
         //echo "Using CHR-ROM\n";
      }

      echo "\n";
   }

	if ($cdlFilename !== false)
   {
		fseek($cdlFile, $cdlOffset);
   }

   // if 16k rom, update prg info
   if ($newPrg)
   {
      $headerInfo->prg = $newPrg;
   }

   // do this stuff only on the lass pass
   if ($pass == $lastPass)
   {

      if ($labelFile !== false)
      {
            $theText .= outputLabels($fileLabels, "User Defined Labels");
      }

      if ($includeReg)
      {
         $theText .= outputLabels($registers, "Registers");
      }

      $header = processHeaderInfo($headerInfo);

      if ($header !== false && $showHeader)
      {
         $theText .= $header;
      }

      $theText .= commentHeader("Program Origin");
      $theText .= str_pad(LEFT_MARGIN . ".org $" . dechex_pad($counter), 30 + $labelLen) . " ; Set program counter\n";
      $theText .= commentHeader('ROM Start');

   }

   // read the file
   // each pass of this loop completes one line of output

   $counter = $origin;
   echo "Starting pass $pass " . ($pass == $lastPass ? "(final) " : '' ) . "... ";

   while (!feof($file) && $counter < $fileLength)
   {
   	$add = false;
      $invalidText = "Invalid Opcode";
      $didDrawLine = false;

      // handle mapper 2
      if ($headerInfo
         && $headerInfo->mapper == 2
         && $counter  == 0xC000
         && $prgBank < ($headerInfo->prg - 1)
      )
      {
         $counter = 0x8000;
         $prgBank++;

         if ($pass == $lastPass)
         {  $theText .= commentHeader("PRG Bank $prgBank");
            $theText .= LEFT_MARGIN . ".base 0x8000\n";
            $theText .= commentLine();
         }
         continue;

      }

      // handle vectors

      if ($pass < $lastPass && $counter == 0xFFFA)
      {
         $nmi = wordStr(fread($file, 2));
         $reset = wordStr(fread($file, 2));
         $break = wordStr(fread($file, 2));

         addVector($nmi, "nmi", $labels);
         addVector($reset, "reset", $labels);
         addVector($break, "irq", $labels);

         $prgLabels[$nmi] = true;
         $prgLabels[$reset] = true;
         $prgLabels[$break] = true;

         $counter  += 6;
         continue;
      }
      elseif($pass == $lastPass && $counter == 0xFFFA)
      {
         $theText .= processVectors($nmi, $reset, $break);
         fread($file, 6);

         $counter  += 6;

         continue;
      }

      //read opcode
      $opcode = ord(fread($file, 1));

      /*if ($counter < 0xc210 && $counter > 0xc1e0)
      {
         echo dechex($counter) . " " . dechex($opcode) . " " . dechex($cdlByte) ." | ";
      }*/


      $isInvalid = $opcodes[$opcode][0];
      $mnemonic = $opcodes[$opcode][1];
      $byteLen = $opcodes[$opcode][2];
      $addressingType = $opcodes[$opcode][4];

      $isDataByte = false;
      $dataStr = 'Suspected data';

      // check code/data log - if data, don' process as an opcode
      if ($cdlFilename !== false)
      {
         $newCdlByte = ord(fread($cdlFile, 1)) ;


         // draw line between data and code
         if ($pass == $lastPass
            && !$oldDidDrawLine
            && $counter !== $origin
            && $newCdlByte !== 0
            && (($newCdlByte & bindec('00000011')) != ($cdlByte & bindec('00000011')))
         )
         {
            $theText .= "\n" . commentLine();

            $didDrawLine = true;
         }

         // check if the CDL byte is known, if known, copy, otherwise do some checks
         if ($newCdlByte !== 0)
         {
            $cdlByte = $newCdlByte;
         }
         // if byte is zero and we're at a program label, assume code
         elseif (isset($oldPrgLabels[dechex_pad($counter)]))
         {
            $cdlByte = bindec('00000001');
         }
         // if byte is zero and we're at a label, but not program, assume data (only on 2nd pass)
         elseif (isset($oldLabels[dechex_pad($counter)]) && $pass > 1)
         {
            $cdlByte = bindec('00000010');
         }
         // else assume program code


         // data byte
         if (($cdlByte & bindec('00000010')) >> 1)
         {

            $counter_pad = dechex_pad($counter);

            if (isCounterLabel($counter, $oldLabels))
            {
               $theOldLabel = $oldLabels[$counter_pad] === true
                  ? '__' . $counter_pad
                  : $oldLabels[$counter_pad];

               //$theOldLabel = preg_replace('%^([^\+\-]+)[\+\-][0-9]+%', '$1', $theOldLabel);
            }

            if (substr($theOldLabel, -9) == 'JumpTable')
            {

               $byteLen = 2;
               $mnemonic = '.word';
               $addressingType = 11;
               $isInvalid = 0;
               //fseek($file, ftell($file) - 1);



            }
            elseif (substr($theOldLabel, -8) == 'RTSTable')
            {

               $byteLen = 2;
               $mnemonic = '.word';
               $addressingType = 12;
               $isInvalid = 0;

            }/*
            elseif (substr($theOldLabel, -8) == 'TableLow')
            {
               $byteLen = 1;
               $mnemonic = '.byte';
               $addressingType = 13;
               $isInvalid = 0;
            }
            elseif (substr($theOldLabel, -9) == 'TableHigh')
            {
               $byteLen = 1;
               $mnemonic = '.byte';
               $addressingType = 14;
               $isInvalid = 0;
            }  */
            else
            {
               $byteLen = 4;
               //echo substr($theLabel, -11);
               $mnemonic = '';
               $addressingType = -1;
               $isInvalid = 1;
            }
            $isDataByte  = true;
            $dataStr = 'Data';
         }
      }


      $readBytes = $byteLen - 1;
      $bytes = '';
      $byteStr = '';
      $trailer = '';
      $hextext = dechex_pad($opcode);

      $byteArr = array($hextext);


      // read 1 or 2 byte paramters for the opcode
      if ($readBytes > 0)
      {
         if ($pass >= 1)
         {
            // check to see if a label exists in this opcode.. if so then usually it's data
            for ($i = 1; $i <= $readBytes; $i++)
            {

               if (isCounterLabel($counter + $i, $oldLabels)
               //if (isset($oldLabels[dechex_pad($counter + $i)])
                  || $counter + $i >= 0xFFFA
                  || ($counter + $i >= $fileLength)
                  || ($headerInfo && $headerInfo->mapper == 2 && $counter + $i > 0xBFFF && $prgBank < $headerInfo->prg - 1)
                ) // if counter in the vectors

               {
                  $invalidCounter = 0;
                  $readBytes =  $i - 1;
                  $isInvalid = 1;
                  $byteLen = $i;
                  $addressingType = -1;
                  continue;
               }
            }
         }

         if ($readBytes > 0) // if readbytes is still > 0 after above
         {
            $bytes = fread($file, $readBytes);

            if ($cdlFilename !== false)
            {
               $cdlBytes = fread($cdlFile, $readBytes);
            }

            for($j = 0; $j < $readBytes; $j++)
            {
               $byteArr[] = dechex_pad(ord($bytes[$j]));
               $hextext .= ' ' . $byteArr[$j+1];
            }

            if ($addressingType == 12)
            {
               $byteStr = (isset($byteArr[1]) ? $byteArr[1]:'') . $byteArr[0];
               $byteStr = dechex_pad(hexdec($byteStr) + 1);
               //echo " $counter $addressingType $byteStr ";
               //print_r($byteArr);
            }
            elseif ($addressingType == 11)
            {
               $byteStr = (isset($byteArr[1]) ? $byteArr[1]:'') . $byteArr[0];
            }
            else
            {
               $byteStr = (isset($byteArr[2]) ? $byteArr[2]:'') . $byteArr[1];
            }
         }
      }

      // ASM6 seems to do some optimization and won't allow absolute addr mode
      // when using $00xx.. it turns it into $xx
      // so instead we'll use .hex
      if ($readBytes ==  2
         && substr($byteStr,0,2)  == "00"
         && $addressingType > 0
         && $addressingType < 9
         // && $addressingType != 9
         && $addressingType != 3)
      {
         $isInvalid = 1;
         $invalidText = "Bad Addr Mode";
      }

      // add label to list
      $oldByteStr = $byteStr;
      $lbl = '$';

      if ($addressingType > 0
         && isValidLabel($byteStr)
      )
      {
         $lbl = '__';

         if ($pass < $lastPass && $isInvalid !== 1)
         {



            addValidLabel($byteStr, $labels);
            //$labels[$byteStr] = true;
         }
      }

      $oldByteStr = $byteStr;

//    $byteStrDec = (dechex_pad($byteStr);
      $newByteStr = $lbl . $byteStr;

      if (isset($oldLabels[$byteStr]))
      {
         $oldLabel = $oldLabels[$byteStr];

         $newByteStr = $oldLabel === true
            ?  $newByteStr
            :  $oldLabel;
      }

      // lets check for various addressing types to figure out how to format the text
      switch($addressingType)
      {

         case 0: // Implicit/Accumulator/Immediate
            $byteStr = ($readBytes > 0 ? '#$' . $byteStr : '');
         break;

         case 12:
         case 11:
         case 10:
            if (!$isInvalid)
            {  addValidLabel($byteStr, $prgLabels);
            }
         case 1: // Absolute
         case 4: // Zero Page

            $byteStr = $newByteStr;

            if ($addressingType == 12)
            {
               $byteStr .= "-1";
            }

         break;

         case 2: // Absolute X
         case 5: // Zero Page X
            $byteStr = $newByteStr . ',x';
         break;

         case 3: // Absolute Y
         case 6: // Zero Page Y
            $byteStr = $newByteStr . ',y';
         break;

         case 7: // Indrect X
            $byteStr = '(' . $newByteStr . ',x)';
         break;

         case 8: // Indirect Y
            $byteStr = '(' . $newByteStr . '),y';
         break;

         case 9: // Indirect Jump
            $byteStr = '(' . $newByteStr . ')';
         break;

      }

      // now lets cover specific mnemonics

      switch($mnemonic)
      {
         // handle branches
         case 'BCC':
         case 'BCS':
         case 'BEQ':
         case 'BMI':
         case 'BNE':
         case 'BPL':
         case 'BVC':
         case 'BVS':

            $addr = addressOffset($counter, $oldByteStr );

            $isInvalidBranch = false;

            if (hexdec($oldByteStr) == 0x7F || hexdec($oldByteStr) == 0xFF)
            {
               $isInvalidBranch = true;
            }

            if ($pass < $lastPass && !$isInvalid && !$isInvalidBranch)
            {
               addValidLabel($addr, $labels);
               addValidLabel($addr, $prgLabels);
            }

            if (!$isInvalidBranch && isValidLabel($addr))
            {  if (isset($labels[$addr]) && $labels[$addr] !== true)
               {
                  $byteStr = $labels[$addr];
               }
               else
               {

                  $byteStr = '__' . $addr;
               }
            }
            else
            {
               $isInvalid = true;
               $invalidText = "Illegal Branch";
            }

         break;

         // add some space after RTS/JMP
         case 'RTS':
         case 'RTI':
         case 'JMP':
            if (!$isInvalid)
            {  $trailer = "\n" . commentLine();
               $didDrawLine = true;
            }
         break;

      }

      // only deal with output on last pass
      if ($pass == $lastPass)
      {
         if ($isInvalid)
         {
            $oldMnemonicStr = $addressingType == -1 ? $dataStr : ($invalidText . " - " . $mnemonic .' '. $byteStr);
            $mnemonic = ".hex";
            $byteStr = $hextext;

         }
         $counter_pad = dechex_pad($counter);
         if (array_key_exists($counter_pad, $oldLabels))
         {
            $leng = 1;
            if (is_array($oldLabels[$counter_pad]))
            {  $leng = count($oldLabels[$counter_pad]);

            }


            for ($i = 0;  $i < $leng; $i++)
            {
               if (is_array($oldLabels[$counter_pad]))
               {
                  $theLabel = $oldLabels[$counter_pad][$i];
               }
               else
               {
                  $theLabel = $oldLabels[$counter_pad] === true
                     ? '__' . $counter_pad
                     : $oldLabels[$counter_pad];

               }

               // if label has a + or - in it but doesn't start with one
               // then don't show it
               // if not 0 or false
               if (strpos($theLabel, '+') || strpos($theLabel, '-'))
               {
                  $theText .=  LEFT_MARGIN;
                  continue;
               }

               switch($theLabel)
               {
                  case "irq":
                     $theText .= commentHeader("irq/brk vector", !($oldDidDrawLine || $didDrawLine), !($oldDidDrawLine || $didDrawLine));
                  break;

                  case "nmi":
                  case "reset":
                     $theText .= commentHeader("$theLabel vector", !($oldDidDrawLine || $didDrawLine), !($oldDidDrawLine || $didDrawLine));
                  break;

               }

               if (strlen($theLabel) >= $marginLen - 1)
               {
                  $theText .= ($oldDidDrawLine || $didDrawLine || ($counter == $origin) ? '' : "\n")
                     .  "$theLabel:\n" . LEFT_MARGIN;
               }
               else
               {
                  $theText .= str_pad($theLabel . ':', $marginLen);
               }

            }

         }
         else
         {
            $theText .= LEFT_MARGIN;
         }

         //$line = array_key_exists(dechex_pad($counter), $oldLabels) ? '__' . dechex_pad($counter) .':' : '       ';
         $line = '';
         $line .= $mnemonic .' '. $byteStr;

         //$labelLen
         $line = str_pad($line, 30 - $marginLen + $labelLen);

         $line .= ' ; $' . dechex_pad($counter) . ": " .$hextext;
         $line = str_pad($line, ($isDataByte ? 54 : 50) - $marginLen + $labelLen);
         $line .= ($isInvalid ?  $oldMnemonicStr : '');
         $line .= "\n" . $trailer;

         $theText .= $line;

      }
      $counter += $byteLen;
      $oldDidDrawLine = $didDrawLine;
   }  // end line by line loop



   if ($pass < $lastPass && $oldLabels !== false && $labels == $oldLabels)
   {
      $lastPass = $pass + 1;
   }
   /*elseif($pass < $lastPass)
   {
      echo "$pass < $lastPass && $oldLabels !== false && $labels == $oldLabels (" . print_r($labels == $oldLabels,true);
      file_put_contents('out', print_r($labels,true) . print_r($oldLabels, true));
      file_put_contents('out2', print_r(array_diff_assoc($labels, $oldLabels),true));
   }*/

   if ($pass < $lastPass)
   {
      $olderLabels = $oldLabels;

      $oldLabels = $labels;
      $oldPrgLabels = $prgLabels;

      rewind($file);
   }

   echo "complete\n";
   $pass++;
}

if ($includeChr && $headerInfo !== false)
{

   fseek($file, $oldPrg * 0x4000 + 0x10);

   $chr = '';


   while (!feof($file))
   {
      $chr .= fread($file,1024);

   }

   $theText .= "\n" . commentLine();
   $theText .= "; CHR-ROM";
   $theText .= "\n" . commentLine();

   $incLine = LEFT_MARGIN . ".incbin " . $shortname.'.chr';
   $theText .= str_pad($incLine, 30 + $labelLen) . " ; Include CHR-ROM\n";

   file_put_contents($shortname.'.chr', $chr);
   echo "\nCHR-ROM exported as $shortname.chr";


}elseif ($includeChr)
{
	echo "\nCHR-ROM cannot be exported without iNES header data";
	if ($ignoreHeader)
	{
		"\nTry disabling -ignoreheader if you wish to export CHR-ROM data";
	}
}

file_put_contents($shortname.'.asm', $theText);


$time_end = microtime(true);
$time = round($time_end - $time_start,3);

echo "\nDisassembly $shortname.asm generated in $time seconds\n\n";
