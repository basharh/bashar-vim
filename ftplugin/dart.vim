" I need the my dart-errors script to change the dart error output to something
" that errorformat can understand
let &makeprg='cd %:p:h && dart-errors $(git rev-parse --show-toplevel)'
let &errorformat='%t - %f:%l:%c - %m'

