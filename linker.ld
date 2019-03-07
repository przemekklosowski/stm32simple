MEMORY
{
/* stack and reset vectors at 0x0, aliased to FLASH or RAM, dep. on BOOT pins*/
 FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 64K
 RAM  (xrw) : ORIGIN = 0x20000000, LENGTH = 20K
}
