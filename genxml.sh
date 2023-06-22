#!/bin/sh


# we'd normally just use urss <github.com/u20n/urss> for this, but that's only html -> rss
# with the mixed txt and list nature of txt://u2on, that's not acceptable

echo "<rss version=\"0.92\"><channel><title>txt://u2on</title><link>https://www.notu.dev/txt</link><description>Collected writings</description>"

for t in docs/txt/*.txt
do
  echo "<item>"
  read -r title < $t
  echo "<title>$title</title>"
  echo "<link>https://www.notu.dev/txt/$(basename $t)</link>" 
  echo "<pubDate>$(date -d "$(tail -1 $t | cut -d ' ' -f3)" +"%a, %d %b %Y")</pubDate>"
  echo "<description><![CDATA[$(cat $t)]]></description>"
  echo "</item>"
done

echo "</channel></rss>"
