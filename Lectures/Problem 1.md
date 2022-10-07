# Problem 1 - Substring with Concatenation of All Words

## 2.1. Question

Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated **according to the following rules:**

1. Each row must contain the digits 1-9 without repetition.
2. Each column must contain the digits 1-9 without repetition.
3. Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.

Note:

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.

Example 1:

![](Imgs/problem_1.png)

Input: board =
[["5","3",".",".","7",".",".",".","."]  
,["6",".",".","1","9","5",".",".","."]  
,[".","9","8",".",".",".",".","6","."]  
,["8",".",".",".","6",".",".",".","3"]  
,["4",".",".","8",".","3",".",".","1"]  
,["7",".",".",".","2",".",".",".","6"]  
,[".","6",".",".",".",".","2","8","."]  
,[".",".",".","4","1","9",".",".","5"]  
,[".",".",".",".","8",".",".","7","9"]]  
Output: true

Example 2:

Input: board =
[["8","3",".",".","7",".",".",".","."]  
,["6",".",".","1","9","5",".",".","."]  
,[".","9","8",".",".",".",".","6","."]  
,["8",".",".",".","6",".",".",".","3"]  
,["4",".",".","8",".","3",".",".","1"]  
,["7",".",".",".","2",".",".",".","6"]  
,[".","6",".",".",".",".","2","8","."]  
,[".",".",".","4","1","9",".",".","5"]  
,[".",".",".",".","8",".",".","7","9"]]  
Output: false  
Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.

**Constraints**

board.length == 9  
board[i].length == 9  
board[i][j] is a digit 1-9 or '.'

## 2.2. Solution

```dart
class Solution {
    Map<String, int> wordCount = {};
    late int wordLength;
    late int substringSize;
    late int sizeOfWords;

    bool check(int i, String s) {
        // Copy the original dictionary to use for this index
        Map<String, int> remaining = {...wordCount};
        int wordsUsed = 0;

        // Each iteration will check for a match in words
        for (int j = i; j < i + substringSize; j += wordLength) {
            String sub = s.substring(j, j + wordLength);

            if (remaining[sub] != null) {
                remaining[sub] = remaining[sub]! - 1;
                wordsUsed++;
            } else {
                break;
            }
        }

        return wordsUsed == sizeOfWords;

    }

    List<int> findSubstring(String s, List<String> words) {
        int n = s.length;
        sizeOfWords = words.length;
        wordLength = words[0].length;
        substringSize = wordLength * sizeOfWords;

        for (String word in words) {
            if(wordCount.containsKey(word)) {
                wordCount[word] = wordCount[word]! + 1;
            } else {
                wordCount[word] = 1;
            }
        }

        List<int> answer = [];
        for (int i = 0; i < n - substringSize + 1; i++) {
            if (check(i, s)) {
                answer.add(i);
            }
        }

        return answer;

    }
}
```
