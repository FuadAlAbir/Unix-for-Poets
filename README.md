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


<b>Exercise 1: Count words in text</b>
<b>$ sed 10q < genesis.txt</b>
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
</pre> 
