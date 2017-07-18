Some Ubuntu distributions come with the unzip package, so if dealing with a zip file 
you can do a  "unzip <filename>.zip -d <output directory>"
e.g. unzip httpd.www.zip -d /var/www/html/<some_output_dir>

If it is not installed do a "sudo apt-get install unzip"
----------------------------------
Another compressions is the tar.gz  which is a little more complicated to remember:

tar xvzf <file>.tar.gz

x = extract
v = verbose
z = gzip
f = use archive file or device ARCHIVE(i think this option is the last, so that the <file>.tar.gz is the input for this option)


