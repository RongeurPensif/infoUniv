#b!in/bash
find dirmails - type f |xargs grep '@' |cut -d':'|uniq -c |sort -n