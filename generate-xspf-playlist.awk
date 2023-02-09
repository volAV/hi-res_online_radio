BEGIN {
    FS="[ \t]*[|][ \t]*"
    number = 0
    print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n\
<playlist version=\"1\" xmlns=\"http://xspf.org/ns/0/\">\n\
<title>Hi-Res Radio</title>\n\
<creator>volAV</creator>\n\
  <trackList>"
}


/\| http/{
    printf "\
    <track>\n\
      <location>%s</location>\n\
      <title>%s</title>\n\
      <annotation>%s</annotation>\n\
      <info>%s</info>\n\
      <trackNum>%s</trackNum>\n\
      <meta rel=\"genre\">%s</meta>\n\
    </track>\n", $7, $2, $5, $6, number=number+1, $3
    next
}

END {
    print "\
  </trackList>\n\
</playlist>"
}
