org=${1:-"asobosf"}
repo=${2:-"website"}
branch=${3:-"master"}

rm -rf deploy
git clone -b $branch --single-branch git@github.com:$org/$repo.git deploy

pushd deploy >/dev/null

git checkout -b deploy

bower install

git add -A .
git commit -am 'update gh-pages'
git push -u origin deploy:gh-pages --force

popd >/dev/null