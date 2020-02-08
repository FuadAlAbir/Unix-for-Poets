tr 'A-Z' 'a-z' | tr -sc 'a-z' '\012' > $$words 
tail +2 $$words > $$nextwords
tail +3 $$words > $$next2words
paste $$words $$nextwords $$next2words | sort | uniq -c | sort -nr
rm $$words $$nextwords $$next2words
