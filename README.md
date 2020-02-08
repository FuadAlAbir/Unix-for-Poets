<pre>
<b>Unix fox Poets</b>
Source: https://www.cs.upc.edu/~padro/Unixforpoets.pdf

<b>Exercises:</b>
1. Count words.
2. Sort words. [ascii, dictionary, rhyme]
3. Extract info from dictionary.
4. Ngram Statistics.
5. Concordance.


<b>Tools:</b>
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

<b>Glue:</b> | &lt; &gt;


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


<b>Exercise 2.1 More Counting: Merge the counts for upper and lower case</b>

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


<b>Exercise 2.2 More Counting: Count sequences of vowels</b>
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

<b>Exercise 3. Sorting Exercises</b>
<b>Sort the words in Genesis by freq</b>
<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | tr -sc 'a-z' '\012' | sort | uniq -c | sort -nr &gt; genesis_freq.hist</b>

<b>Sort them by rhyming order</b>
<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | tr -sc 'a-z' '\012' | sort | uniq -c | rev | sort | rev | sed 10q</b>
      1 
    341 a
      3 sheba
     11 beersheba
      1 seba
      1 kirjatharba
      8 sea
      4 yea
      1 lasha
      1 mesha
      
<b>Hint:</b>
<b>$ echo hello world | rev</b>
dlrow olleh
<b>$ echo hello world | rev | rev</b>
hello world


<b>Exercise 4. Bigrams (word pair)</b>
Algorithm:
    ~ tokenize by word
    ~ print word i and word i + 1 on the same line
    ~ count
<b>$ tr 'A-Z' 'a-z' &lt; genesis.txt | tr -sc 'A-Za-z' '\012' &gt; genesis.words</b>
<b>$ tail +2 genesis.words &gt; genesis.nextwords</b>
<b>$ paste genesis.words genesis.nextwords</b>
...
the     children
children        of
of      israel
israel  saying
saying  god
god     will
will    surely
surely  visit
visit   you
...
<b>$ paste genesis.words genesis.nextwords | sort | uniq -c | sort -nr &gt; genesis.bigrams</b>

<b>Exercise 4.1 Trigrams</b>
$ tail +2 genesis.nextwords &gt; genesis.afternextwords
$ paste genesis.words genesis.nextwords genesis.afternextwords | sort | uniq -c | sort -nr &gt; genesis.trigrams


<b>Exercise 5. Shell Script</b>
trigram.sh
tr 'A-Z' 'a-z' | tr -sc 'a-z' '\012' > $$words 
tail +2 $$words > $$nextwords
tail +3 $$words > $$next2words
paste $$words $$nextwords $$next2words | sort | uniq -c | sort -nr
rm $$words $$nextwords $$next2words

$ sh trigram.sh < genesis.txt > new.trigrams
</pre> 
