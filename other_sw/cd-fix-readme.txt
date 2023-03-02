CD Reconstruction from several damaged copies

version 1, 2003/06/10
 
Idea:
 Let's take good sectors from different copies of CD and make one good copy.

CloneCD:
 I used CloneCD 4 to read/write images.
 Reverse-engineered CloneCD file formats:
  *.img is sequence of sectors per 930h bytes (18h fluff+800h data+118h fluff)
  *.sub is sequence of sectors per 60h bytes
  *.ccd is something necessary for CloneCD
  *.log must be saved after reading cd, contains info about bad sectors
 If you don't have CloneCD, you can simply improve this program to work with 
  files from your program or possibly contact me to do it :)

Function:
 Program compares valid sectors from all images. If some sectors were lost
 but others are valid and identical, we probably 100% fixed this sector.
 If other sectors differ, each particular bit in sector is set to most 
 probable (typical) value and sector is reported to be dangerous
 (probably <99% fixed).
 If sector is lost in all images, it is lost also in final image
 (which is reported).
 
Usage:
 Run cd-fix.exe and see.
 You can merge any number of images (at least one) into one destination image.

Autor:
 Dee
 http://dee.cz
