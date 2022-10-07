# Problem 1 - Substring with Concatenation of All Words

## 2.1. Question

You are given a string `s` and an array of strings `words`. All the strings of `words` are of **the same length.**

A **concatenated substring** in s is a substring that contains all the strings of any permutation of words concatenated.

For example, if `words = ["ab","cd","ef"]`, then `"abcdef"`, `"abefcd"`, `"cdabef"`, `"cdefab"`, `"efabcd"`, and `"efcdab"` are all concatenated strings. `"acdbef"` is not a concatenated substring because it is not the concatenation of any permutation of `words`.

Return the starting indices of all the concatenated substrings in s. You can return the answer **in any order.**

Example 1:

```
Input: s = "barfoothefoobarman", words = ["foo","bar"]
Output: [0,9]
Explanation: Since words.length == 2 and words[i].length == 3, the concatenated substring has to be of length 6.
The substring starting at 0 is "barfoo". It is the concatenation of ["bar","foo"] which is a permutation of words.
The substring starting at 9 is "foobar". It is the concatenation of ["foo","bar"] which is a permutation of words.
The output order does not matter. Returning [9,0] is fine too.
```

Example 2:

```
Input: s = "wordgoodgoodgoodbestword", words = ["word","good","best","word"]
Output: []
Explanation: Since words.length == 4 and words[i].length == 4, the concatenated substring has to be of length 16.
There is no substring of length 16 is s that is equal to the concatenation of any permutation of words.
We return an empty array.
```

Example 3:

```
Input: s = "barfoofoobarthefoobarman", words = ["bar","foo","the"]
Output: [6,9,12]
Explanation: Since words.length == 3 and words[i].length == 3, the concatenated substring has to be of length 9.
The substring starting at 6 is "foobarthe". It is the concatenation of ["foo","bar","the"] which is a permutation of words.
The substring starting at 9 is "barthefoo". It is the concatenation of ["bar","the","foo"] which is a permutation of words.
The substring starting at 12 is "thefoobar". It is the concatenation of ["the","foo","bar"] which is a permutation of words.
```

**Constraints**

1 <= s.length <= 104  
1 <= words.length <= 5000  
1 <= words[i].length <= 30  
s and words[i] consist of lowercase English letters.

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
