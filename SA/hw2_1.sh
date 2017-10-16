echo -e 
	"$(ls -FR | grep '^-' | awk '{print $9}' | sort -nr | head -n 5)"
#	"\ndir num: $(ls -FR | grep [/]$ | wc -l)" \
#	"\nfile num: $(ls -FR | grep [^/]$ | wc -l)" \
#	"\ntotal: $(du -s)"




# ls -la /home/alter027/Desktop

# ls -F | grep [^/]$ | wc -l

# dir num
# ls -FR | grep [/]$ | wc -l

# file num
# ls -FR | grep [^/]$ | wc -l

# total size
# du -sh

# the top five size
# du -a /home | sort -n -r | head -n 5

# get all file under the dir
# ls -lA -R | grep '^-' ^C
