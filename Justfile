ci:
  check

serve:
  zola check
  zola serve

push: 
  env PAGER='' git branch -l 
  git branch -t upstream/main
  git push upstream HEAD

pr:
  gh pr create 

deploy:
  gh pr create --base main --target gh-pages
