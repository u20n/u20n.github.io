#!/bin/sh


# we'd normally just use urss <github.com/u20n/urss> for this, but that's only html -> rss
# with the mixed txt and list nature of txt://u2on, that's not acceptable

echo "<rss version=\"0.92\"><channel><title>txt://u2on</title><link>https://www.notu.dev/txt</link><desc>Collected writings</desc>"

for t in docs/txt/*
do
  echo "<item>"
  read -r title < $t
  echo "<title>!CDATA[[$title]]</title>"
  echo "<link>www.notu.dev/txt/$(basename $t .txt)</link>"
  echo "<desc>!CDATA[[$(cat $t | tr -d '\n')]]</desc>"
  echo "</item>"
done

echo "</channel></rss>"
