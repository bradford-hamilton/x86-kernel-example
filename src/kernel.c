// Clear screen and print message
void kmain(void)
{
  const char* str = "Neato kernel!";
  char* vid_ptr = (char*)0xb8000; // Video memory begins here
  unsigned int i = 0;
  unsigned int j = 0;

  // Clear screen - there are 25 lines each of 80 colums
  // Each element takes 2 bytes - so write emptry chars
  // everywhere with a black background.
  while (j < 80 * 25 * 2) {
    // Blank character
    vid_ptr[j] = ' ';
    // Attribute byte - light grey on black screen
    vid_ptr[j+1] = 0x07;
    j = j + 2;
  }

  j = 0;

  // Write string to video memory
  while (str[j] != '\0') {
    // The character's ascii
    vid_ptr[i] = str[j];
    // Attribute byte - give character black bg & light grey fg
    vid_ptr[i+1] = 0x07;
    ++j;
    i = i + 2;
  }

  return;
}
