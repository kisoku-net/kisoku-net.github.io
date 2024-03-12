ci:
  zola check

serve:
  zola check
  zola serve

push: 
  env PAGER='' git branch -l 
  git branch -t origin/main
  git push origin HEAD

pr:
  gh pr create 

deploy:
  git branch -D gh-pages || true
  git checkout -t origin/gh-pages
  git branch -u origin/main
  git pull
  zola build --output-dir=docs --force
  echo 'kisoku.net' > docs/CNAME
  git add docs
  git commit -m "deploy: updating gh-pages from main $(date -I)"
  git push origin gh-pages --force-with-lease

