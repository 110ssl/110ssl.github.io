if [ $# != 1 ] ; then
    echo "Usage: ./pub.sh commit_comments"
	exit 1
fi

gitbook build
if $0 != 0 ; then
	echo "gitbook build faild!"
	exit 2
fi

git checkout master
cp -r _book/* .
git add .
git commit -m $1
git push origin master
git checkout dev
