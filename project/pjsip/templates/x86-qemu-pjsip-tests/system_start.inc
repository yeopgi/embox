"export PWD=/",
"export HOME=/",
"netmanager",

"mkdir -v /tmp",
"mkfs -q /dev/ram0 32768",
"mount -t ramfs /dev/ram0 /tmp",

"cp Jbtest.dat /tmp", // it's required for pjmedia_test
"cd /tmp",
//"pjlib_util",
//"pjlib_util_test",
"pjmedia_test",
"tish",
