set follow-fork-mode child

define ucharprint
echo "
set $c = (unsigned short*)$arg0
while ( *$c )
  if ( *$c > 0x7f )
    printf "[%x]", *$c
  else
    printf "%c", *$c
  end
  set $c++
end
echo "\n
end
