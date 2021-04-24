set -e

npm run build

cd dist

git init
git add -A
git commit -m 'deploy'

git branch -M main
git remote add origin https://github.com/Irina357/form_test.git
git push -u origin main

cd -