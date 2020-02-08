<pre>
Unix fox Poets
Source: https://www.cs.upc.edu/~padro/Unixforpoets.pdf

Exercises:
1. Count words.
2. Sort words. [ascii, dictionary, rhyme]
3. Extract info from dictionary.
4. Ngram Statistics.
5. Concordance.


Tools:
* grep (search for pattern - re)
* sort
* uniq -c (count duplicates)
* tr (translate characters)
* wc (word count)
* sed (edit string)
* awk (simple programming language)
* cut
* paste
* comm
* join

<b>Exercise 0. File READ-WRITE</b>
<b>Read the file genesis.txt & print first 10 lines.</b>
<b>$ sed 10q < genesis.txt</b>

<b>Do some operations and write the result in a file.</b>
<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | tr -sc 'a-z' '\012' | sort | uniq -c &gt; word_count.txt</b>

<b>Note that, &lt; is used for READ and &gt; is used for WRITE.</b>


<b>Exercise 1. Count words in text</b>
<b>$ sed 10q &lt; genesis.txt</b>
Book 01        Genesis

01:001:001 In the beginning God created the heaven and the earth.

01:001:002 And the earth was without form, and void; and darkness was
           upon the face of the deep. And the Spirit of God moved upon
           the face of the waters.

01:001:003 And God said, Let there be light: and there was light.

<b>$ tr -sc 'A-Za-z' '\012' &lt; genesis.txt | sed 10q</b>

Book
Genesis
In
the
beginning
God
created
the
heaven

<b>$ tr -sc 'A-Za-z' '\012' &lt; genesis.txt | sort | sed 5q</b>

a
a
a
a

<b>$ tr -sc 'A-Za-z' '\012' &lt; genesis.txt | sort | uniq -c | sed 10q</b>
      1 
    339 a
      2 A
      3 abated
      8 Abel
      1 Abelmizraim
      1 Abidah
      4 abide
      1 Abide
      1 Abimael

<b>SOLUTION:</b>
<b>$ tr -sc 'A-Za-z' '\012' &lt; genesis.txt | sort | uniq -c</b>


<b>Exercise 2. More Counting Exercises</b>
<b>2.1 Merge the counts for upper and lower case</b>

<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | sed 10q</b>
book 01        genesis

01:001:001 in the beginning god created the heaven and the earth.

01:001:002 and the earth was without form, and void; and darkness was
           upon the face of the deep. and the spirit of god moved upon
           the face of the waters.

01:001:003 and god said, let there be light: and there was light.

<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | tr -sc 'a-z' '\012' | sort | uniq -c | sed 10q</b>
      1 
    341 a
      3 abated
      8 abel
      1 abelmizraim
      1 abidah
      5 abide
      1 abimael
     24 abimelech
      3 able

<b>SOLUTION:</b>
<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | tr -sc 'a-z' '\012' | sort | uniq -c</b>


<b>2.2 Count sequences of vowels</b>
<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | tr -sc 'aeiou' '\012' | sort | uniq -c | sed 100q</b>
      1 
  12795 a
    150 aa
     65 ae
    793 ai
     99 ao
    277 au
  16119 e
    993 ea
      1 eau
    679 ee
      8 eei
    277 ei
     78 eo
     15 eou
     24 eu
      5 eue
   6707 i
     44 ia
    266 ie
    115 io
      4 iou
      1 iu
   7953 o
     90 oa
     24 oe
     57 oi
      2 oii
    276 oo
   1254 ou
   1868 u
     20 ua
     33 ue
     62 ui
     
<b>SOLUTION:</b>
<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | tr -sc 'aeiou' '\012' | sort | uniq -c</b>

</pre> 
