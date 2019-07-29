/*
URLify: Write a method to replace all spaces in a string with '%20'. You may assume that the string
has sufficient space at the end to hold the additional characters, and that you are given the "true"
length of the string. (Note: If implementing in Java, please use a character array so that you can
perform this operation in place.)

A common approach in string manipulation problems is to edit the string starting from the end and working
backwards. This is useful because we have an extra buffer at the end, which allows us to change characters
without worrying about what we're overwriting.
*/

#include <iostream>
using namespace std;

int main()
{
  int trueSize = 14;
  char str[] = "Mr, John Smith---------------------------------";
  int spaces = 0;
  for (int i = 0; i< trueSize; i ++){
      if (str[i] == ' '){
          spaces += 1;
      }
  }
  int finalStringSize = trueSize + spaces * 2;
  int j = finalStringSize;
  for (int i=trueSize; i > 0 ; i --){
      if (str[i] == ' '){
        str[j] = '0';
        str[j - 1] = '2';
        str[j - 2] = '%';
        j -= 3;
      }else{
        str[j] = str[i];
        j -= 1;
      }
  }
  cout << str;
  return 0;
}
