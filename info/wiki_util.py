# -*- coding: utf-8 -*-

from __future__ import print_function

import sys
import codecs
import wikipedia

query = sys.argv[1:]

print('Searching for "%s"'%' '.join(query))
result = wikipedia.search(' '.join(query))

if len(result) == 0:
    print('No match for "%s"' % ' '.join(query))
    sys.exit(1)

title = result[0]
print('"%s" found'%title)
content = wikipedia.page(title).content

with codecs.open('%s.txt'%' '.join(query), 'w', 'utf-8') as f:
    f.write(content)
print('Wrote "%s.txt"'%' '.join(query))
