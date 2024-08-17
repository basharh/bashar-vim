let s:buffer_git_path = finddir('.git/..', expand('%:p:h').';')
"let &makeprg='(cd ' . s:buffer_git_path . ' && npm run build -- --noEmit --pretty false)'
"

" change to use node_modules/typescript/bin/tsc if it causes issues
let &makeprg='tsc --noEmit --pretty false --project ' . s:buffer_git_path
let &errorformat='%f(%l\\\,%c): error TS%n: %m'
"src/__tests__/graphql/main/progress/progress.test.ts(45,5): error TS2552: Cannot find name 'test1'. Did you mean 'test'?
