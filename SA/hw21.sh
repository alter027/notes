echo -e \
	"$( find . -type f -exec du -a {} + | sort -n -r | head -n 5 | awk '{ print FNR "." $0 }' )" \
	"\ndir num:$(ls -FR -l | grep '^d' | wc -l )" \
	"\nfile num:$(ls -FR -l | grep '^-' | wc -l )" \
	"\ntotal: $(du -s | awk '{print $1}' )"
