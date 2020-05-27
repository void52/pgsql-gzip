:
: NOTE : 01 : [[

update after the version problems (see NOTE : 00 below) :

so originally : apt install postgresql-server-dev-all
and compilation of pgsql-gzip
only works if PG is newest version already, on host
... so now the dependency should be met, before installing pgsql-gzip, like this :

apt install postgresql-server-dev-10
(or 11 for current PROD)

]]


:
: NOTE : 00 : [[


from here ...
---------

fire@wasp:~/aimondo$ scp -i ~/aimondo/key.solomon -P 3306 /opt/bitbucket/products.controllers.new_things/AC-2132.pgsql-gzip_for_unfiltered_response/pgsql-gzip-master.zip sburt@hdb.aimondo.com:/home/sburt/tmp/
pgsql-gzip-master.zip                                                                                                                                                    100%   15KB  92.9KB/s   00:00    


in DEV HDB container ...
--------------------

root@hdb-dev:/home/sburt# apt update

Ign http://deb.debian.org jessie InRelease
Get:1 http://security.debian.org jessie/updates InRelease [44.9 kB]        
Get:2 http://deb.debian.org jessie-updates InRelease [16.3 kB]                                                                                                                                            
Get:3 http://apt.postgresql.org jessie-pgdg InRelease [61.5 kB]                                                                                                                                           
Get:4 http://deb.debian.org jessie Release.gpg [1,652 B]                                                                                                                                                  
Get:5 http://deb.debian.org jessie Release [77.3 kB]                                                                                                                                                      
Get:6 http://security.debian.org jessie/updates/main amd64 Packages [978 kB]                                                                                                                              
Get:7 http://deb.debian.org jessie-updates/main amd64 Packages [20 B]                                                                                                                                     
Get:8 http://deb.debian.org jessie/main amd64 Packages [9,098 kB]                                                                                                                                         
Get:9 http://apt.postgresql.org jessie-pgdg/main amd64 Packages [230 kB]                                                                                                                                  
Fetched 10.5 MB in 21s (496 kB/s)                                                                                                                                                                         
Reading package lists... Done
Building dependency tree       
Reading state information... Done
166 packages can be upgraded. Run 'apt list --upgradable' to see them.
W: Size of file /var/lib/apt/lists/deb.debian.org_debian_dists_jessie-updates_main_binary-amd64_Packages.gz is not what the server reported 20 23046
root@hdb-dev:/home/sburt# 


root@hdb-dev:/home/sburt# apt install postgresql-server-dev-all

Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following extra packages will be installed:
  libpq-dev libpq5 postgresql-client-10 postgresql-client-11 postgresql-client-12 postgresql-client-9.5 postgresql-client-9.6 postgresql-server-dev-10 postgresql-server-dev-11 postgresql-server-dev-12
  postgresql-server-dev-9.5 postgresql-server-dev-9.6
Suggested packages:
  postgresql-doc-12 postgresql-11 postgresql-doc-11 postgresql-12 postgresql-9.5 postgresql-doc-9.5 postgresql-9.6 postgresql-doc-9.6
The following NEW packages will be installed:
  postgresql-client-11 postgresql-client-12 postgresql-client-9.5 postgresql-client-9.6 postgresql-server-dev-10 postgresql-server-dev-11 postgresql-server-dev-12 postgresql-server-dev-9.5
  postgresql-server-dev-9.6 postgresql-server-dev-all
The following packages will be upgraded:
  libpq-dev libpq5 postgresql-client-10
3 upgraded, 10 newly installed, 0 to remove and 163 not upgraded.
Need to get 11.5 MB of archives.
After this operation, 46.0 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main libpq-dev amd64 12.3-1.pgdg80+1 [139 kB]
Get:2 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main libpq5 amd64 12.3-1.pgdg80+1 [174 kB]
Get:3 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-client-10 amd64 10.13-1.pgdg80+1 [1,428 kB]
Get:4 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-client-11 amd64 11.8-1.pgdg80+1 [1,467 kB]
Get:5 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-client-12 amd64 12.3-1.pgdg80+1 [1,409 kB]
Get:6 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-client-9.5 amd64 9.5.22-1.pgdg80+1 [1,254 kB]
Get:7 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-client-9.6 amd64 9.6.18-1.pgdg80+1 [1,346 kB]
Get:8 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-server-dev-10 amd64 10.13-1.pgdg80+1 [881 kB]
Get:9 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-server-dev-11 amd64 11.8-1.pgdg80+1 [860 kB]
Get:10 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-server-dev-12 amd64 12.3-1.pgdg80+1 [921 kB]
Get:11 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-server-dev-9.5 amd64 9.5.22-1.pgdg80+1 [720 kB]
Get:12 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-server-dev-9.6 amd64 9.6.18-1.pgdg80+1 [785 kB]
Get:13 http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg/main postgresql-server-dev-all all 215.pgdg80+1 [69.0 kB]
Fetched 11.5 MB in 0s (16.6 MB/s)                      
debconf: delaying package configuration, since apt-utils is not installed
(Reading database ... 30566 files and directories currently installed.)
Preparing to unpack .../libpq-dev_12.3-1.pgdg80+1_amd64.deb ...
Unpacking libpq-dev (12.3-1.pgdg80+1) over (11.1-1.pgdg80+1) ...
Preparing to unpack .../libpq5_12.3-1.pgdg80+1_amd64.deb ...
Unpacking libpq5:amd64 (12.3-1.pgdg80+1) over (11.1-1.pgdg80+1) ...
Preparing to unpack .../postgresql-client-10_10.13-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-client-10 (10.13-1.pgdg80+1) over (10.6-1.pgdg80+1) ...
Selecting previously unselected package postgresql-client-11.
Preparing to unpack .../postgresql-client-11_11.8-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-client-11 (11.8-1.pgdg80+1) ...
Selecting previously unselected package postgresql-client-12.
Preparing to unpack .../postgresql-client-12_12.3-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-client-12 (12.3-1.pgdg80+1) ...
Selecting previously unselected package postgresql-client-9.5.
Preparing to unpack .../postgresql-client-9.5_9.5.22-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-client-9.5 (9.5.22-1.pgdg80+1) ...
Selecting previously unselected package postgresql-client-9.6.
Preparing to unpack .../postgresql-client-9.6_9.6.18-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-client-9.6 (9.6.18-1.pgdg80+1) ...
Selecting previously unselected package postgresql-server-dev-10.
Preparing to unpack .../postgresql-server-dev-10_10.13-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-server-dev-10 (10.13-1.pgdg80+1) ...
Selecting previously unselected package postgresql-server-dev-11.
Preparing to unpack .../postgresql-server-dev-11_11.8-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-server-dev-11 (11.8-1.pgdg80+1) ...
Selecting previously unselected package postgresql-server-dev-12.
Preparing to unpack .../postgresql-server-dev-12_12.3-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-server-dev-12 (12.3-1.pgdg80+1) ...
Selecting previously unselected package postgresql-server-dev-9.5.
Preparing to unpack .../postgresql-server-dev-9.5_9.5.22-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-server-dev-9.5 (9.5.22-1.pgdg80+1) ...
Selecting previously unselected package postgresql-server-dev-9.6.
Preparing to unpack .../postgresql-server-dev-9.6_9.6.18-1.pgdg80+1_amd64.deb ...
Unpacking postgresql-server-dev-9.6 (9.6.18-1.pgdg80+1) ...
Selecting previously unselected package postgresql-server-dev-all.
Preparing to unpack .../postgresql-server-dev-all_215.pgdg80+1_all.deb ...
Unpacking postgresql-server-dev-all (215.pgdg80+1) ...
Processing triggers for libc-bin (2.19-18+deb8u10) ...
Processing triggers for postgresql-common (195.pgdg80+1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
debconf: falling back to frontend: Readline
Building PostgreSQL dictionaries from installed myspell/hunspell packages...
Removing obsolete dictionary files:
Setting up libpq5:amd64 (12.3-1.pgdg80+1) ...
Setting up libpq-dev (12.3-1.pgdg80+1) ...
Setting up postgresql-client-10 (10.13-1.pgdg80+1) ...
Setting up postgresql-client-11 (11.8-1.pgdg80+1) ...
update-alternatives: using /usr/share/postgresql/11/man/man1/psql.1.gz to provide /usr/share/man/man1/psql.1.gz (psql.1.gz) in auto mode
Setting up postgresql-client-12 (12.3-1.pgdg80+1) ...
update-alternatives: using /usr/share/postgresql/12/man/man1/psql.1.gz to provide /usr/share/man/man1/psql.1.gz (psql.1.gz) in auto mode
Setting up postgresql-client-9.5 (9.5.22-1.pgdg80+1) ...
Setting up postgresql-client-9.6 (9.6.18-1.pgdg80+1) ...
Setting up postgresql-server-dev-10 (10.13-1.pgdg80+1) ...
Setting up postgresql-server-dev-11 (11.8-1.pgdg80+1) ...
Setting up postgresql-server-dev-12 (12.3-1.pgdg80+1) ...
Setting up postgresql-server-dev-9.5 (9.5.22-1.pgdg80+1) ...
Setting up postgresql-server-dev-9.6 (9.6.18-1.pgdg80+1) ...
Setting up postgresql-server-dev-all (215.pgdg80+1) ...
Processing triggers for libc-bin (2.19-18+deb8u10) ...
root@hdb-dev:/home/sburt# 


root@hdb-dev:/home/sburt/tmp# unzip pgsql-gzip-master.zip
root@hdb-dev:/home/sburt/tmp# mv pgsql-gzip-master ../src/


root@hdb-dev:/home/sburt/src/pgsql-gzip-master# make
gcc -std=gnu99 -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Werror=vla -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -g -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -fPIC -pie -fno-omit-frame-pointer -fPIC -I. -I./ -I/usr/include/postgresql/12/server -I/usr/include/postgresql/internal -I/usr/include/x86_64-linux-gnu  -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -I/usr/include/libxml2  -I/usr/include/mit-krb5  -c -o pg_gzip.o pg_gzip.c
gcc -std=gnu99 -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Werror=vla -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -g -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -fPIC -pie -fno-omit-frame-pointer -fPIC -shared -o gzip.so pg_gzip.o -L/usr/lib/x86_64-linux-gnu  -Wl,-z,relro -Wl,-z,now  -L/usr/lib/x86_64-linux-gnu/mit-krb5 -Wl,--as-needed  -L/usr/lib/x86_64-linux-gnu -lz  
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# ll
total 160
drwxr-xr-x 6 root  root   4096 May 27 10:58 .
drwxr-xr-x 3 sburt sburt  4096 May 27 10:56 ..
drwxr-xr-x 2 root  root   4096 Apr 22 17:17 ci
drwxr-xr-x 4 root  root   4096 Apr 22 17:17 debian
-rw-r--r-- 1 root  root    558 Apr 22 17:17 Dockerfile
-rw-r--r-- 1 root  root     49 Apr 22 17:17 .dockerignore
-rw-r--r-- 1 root  root    344 Apr 22 17:17 .editorconfig
drwxr-xr-x 2 root  root   4096 Apr 22 17:17 expected
-rw-r--r-- 1 root  root    209 Apr 22 17:17 .gitignore
-rw-r--r-- 1 root  root    569 Apr 22 17:17 gzip--1.0.sql
-rw-r--r-- 1 root  root    115 Apr 22 17:17 gzip.control
-rwxr-xr-x 1 root  root  34408 May 27 10:58 gzip.so
-rw-r--r-- 1 root  root   1083 Apr 22 17:17 LICENSE.md
-rw-r--r-- 1 root  root   1433 Apr 22 17:17 Makefile
-rw-r--r-- 1 root  root   1168 Apr 22 17:17 META.json
-rw-r--r-- 1 root  root   5400 Apr 22 17:17 pg_gzip.c
-rw-r--r-- 1 root  root  46288 May 27 10:58 pg_gzip.o
-rw-r--r-- 1 root  root   3885 Apr 22 17:17 README.md
drwxr-xr-x 2 root  root   4096 Apr 22 17:17 sql
-rw-r--r-- 1 root  root   1340 Apr 22 17:17 .travis.yml
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# make install
/bin/mkdir -p '/usr/lib/postgresql/12/lib'
/bin/mkdir -p '/usr/share/postgresql/12/extension'
/bin/mkdir -p '/usr/share/postgresql/12/extension'
/usr/bin/install -c -m 755  gzip.so '/usr/lib/postgresql/12/lib/gzip.so'
/usr/bin/install -c -m 644 .//gzip.control '/usr/share/postgresql/12/extension/'
/usr/bin/install -c -m 644 .//gzip--1.0.sql  '/usr/share/postgresql/12/extension/'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# 


WHY 12 ??


root@hdb-dev:/home/sburt/src/pgsql-gzip-master# su hdb_aimondo
hdb_aimondo@hdb-dev:/home/sburt/src/pgsql-gzip-master$ psql hdb
psql (12.3 (Debian 12.3-1.pgdg80+1), server 10.6 (Debian 10.6-1.pgdg80+1))
Type "help" for help.

hdb=# create extension gzip ;
ERROR:  could not open extension control file "/usr/share/postgresql/10/extension/gzip.control": No such file or directory
hdb=# \q

see AC-2132 and AC-2134 !!


root@hdb-dev:/home/sburt/src/pgsql-gzip-master# make uninstall
rm -f '/usr/lib/postgresql/12/lib/gzip.so'
rm -f '/usr/share/postgresql/12/extension'/gzip.control
rm -f '/usr/share/postgresql/12/extension'/gzip--1.0.sql
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# 

so ...

/bin/mkdir -p '/usr/lib/postgresql/10/lib'
/bin/mkdir -p '/usr/share/postgresql/10/extension'
/bin/mkdir -p '/usr/share/postgresql/10/extension'
/usr/bin/install -c -m 755  gzip.so '/usr/lib/postgresql/10/lib/gzip.so'
/usr/bin/install -c -m 644 .//gzip.control '/usr/share/postgresql/10/extension/'
/usr/bin/install -c -m 644 .//gzip--1.0.sql  '/usr/share/postgresql/10/extension/'



root@hdb-dev:/home/sburt/src/pgsql-gzip-master# /bin/mkdir -p '/usr/lib/postgresql/10/lib'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# /bin/mkdir -p '/usr/share/postgresql/10/extension'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# /bin/mkdir -p '/usr/share/postgresql/10/extension'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# /usr/bin/install -c -m 755  gzip.so '/usr/lib/postgresql/10/lib/gzip.so'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# /usr/bin/install -c -m 644 .//gzip.control '/usr/share/postgresql/10/extension/'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# /usr/bin/install -c -m 644 .//gzip--1.0.sql  '/usr/share/postgresql/10/extension/'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# 


but ...

hdb=# create extension gzip ;
ERROR:  incompatible library "/usr/lib/postgresql/10/lib/gzip.so": version mismatch
DETAIL:  Server is version 10, library is version 12.
hdb=# \q

so ...

exit
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# make clean
rm -f gzip.so   libgzip.a  libgzip.pc
rm -f pg_gzip.o pg_gzip.bc
rm -rf results/ regression.diffs regression.out tmp_check/ tmp_check_iso/ log/ output_iso/


rm -f '/usr/lib/postgresql/10/lib/gzip.so'
rm -f '/usr/share/postgresql/10/extension'/gzip.control
rm -f '/usr/share/postgresql/10/extension'/gzip--1.0.sql

root@hdb-dev:/home/sburt/src/pgsql-gzip-master# rm -f '/usr/lib/postgresql/10/lib/gzip.so'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# rm -f '/usr/share/postgresql/10/extension'/gzip.control
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# rm -f '/usr/share/postgresql/10/extension'/gzip--1.0.sql


root@hdb-dev:/home/sburt/src/pgsql-gzip-master# dpkg -l | grep postgres
ii  pgdg-keyring                       2018.2                           all          keyring for apt.postgresql.org
ii  postgresql                         10+191.pgdg80+1                  all          object-relational SQL database (supported version)
ii  postgresql-10                      10.6-1.pgdg80+1                  amd64        object-relational SQL database, version 10 server
ii  postgresql-client-10               10.13-1.pgdg80+1                 amd64        front-end programs for PostgreSQL 10
ii  postgresql-client-11               11.8-1.pgdg80+1                  amd64        front-end programs for PostgreSQL 11
ii  postgresql-client-12               12.3-1.pgdg80+1                  amd64        front-end programs for PostgreSQL 12
ii  postgresql-client-9.5              9.5.22-1.pgdg80+1                amd64        front-end programs for PostgreSQL 9.5
ii  postgresql-client-9.6              9.6.18-1.pgdg80+1                amd64        front-end programs for PostgreSQL 9.6
ii  postgresql-client-common           195.pgdg80+1                     all          manager for multiple PostgreSQL client versions
ii  postgresql-common                  195.pgdg80+1                     all          PostgreSQL database-cluster manager
ii  postgresql-doc                     10+191.pgdg80+1                  all          documentation for the PostgreSQL database management system
ii  postgresql-doc-10                  10.6-1.pgdg80+1                  all          documentation for the PostgreSQL database management system
ii  postgresql-server-dev-10           10.13-1.pgdg80+1                 amd64        development files for PostgreSQL 10 server-side programming
ii  postgresql-server-dev-11           11.8-1.pgdg80+1                  amd64        development files for PostgreSQL 11 server-side programming
ii  postgresql-server-dev-12           12.3-1.pgdg80+1                  amd64        development files for PostgreSQL 12 server-side programming
ii  postgresql-server-dev-9.5          9.5.22-1.pgdg80+1                amd64        development files for PostgreSQL 9.5 server-side programming
ii  postgresql-server-dev-9.6          9.6.18-1.pgdg80+1                amd64        development files for PostgreSQL 9.6 server-side programming
ii  postgresql-server-dev-all          215.pgdg80+1                     all          extension build tool for multiple PostgreSQL versions

root@hdb-dev:/home/sburt/src/pgsql-gzip-master# pg_config --version
PostgreSQL 12.3 (Debian 12.3-1.pgdg80+1)

... oh dear ...


apt remove postgresql-server-dev-all ... did not fix ...

... now ...

root@hdb-dev:/home/sburt/src/pgsql-gzip-master# sudo apt remove --auto-remove postgresql-server-dev-9.6
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  postgresql-server-dev-9.6
0 upgraded, 0 newly installed, 1 to remove and 163 not upgraded.
After this operation, 4,157 kB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 35441 files and directories currently installed.)
Removing postgresql-server-dev-9.6 (9.6.18-1.pgdg80+1) ...
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# sudo apt remove --auto-remove postgresql-server-dev-9.5 ; sudo apt remove --auto-remove postgresql-server-dev-12 ; sudo apt remove --auto-remove postgresql-server-dev-11
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  postgresql-server-dev-9.5
0 upgraded, 0 newly installed, 1 to remove and 163 not upgraded.
After this operation, 3,835 kB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 34785 files and directories currently installed.)
Removing postgresql-server-dev-9.5 (9.5.22-1.pgdg80+1) ...
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  postgresql-server-dev-12
0 upgraded, 0 newly installed, 1 to remove and 163 not upgraded.
After this operation, 4,920 kB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 34154 files and directories currently installed.)
Removing postgresql-server-dev-12 (12.3-1.pgdg80+1) ...
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  postgresql-server-dev-11
0 upgraded, 0 newly installed, 1 to remove and 163 not upgraded.
After this operation, 4,334 kB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 33321 files and directories currently installed.)
Removing postgresql-server-dev-11 (11.8-1.pgdg80+1) ...
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# 

... and ...

root@hdb-dev:/home/sburt/src/pgsql-gzip-master#  /usr/bin/pg_config --version
PostgreSQL 12.3 (Debian 12.3-1.pgdg80+1)
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# pg_dump --version
pg_dump (PostgreSQL) 10.13 (Debian 10.13-1.pgdg80+1)


... hmmm ...


root@hdb-dev:/home/sburt/src/pgsql-gzip-master# apt remove -y postgresql-client-9.6 ; apt remove -y postgresql-client-9.5 ; apt remove -y postgresql-client-12 ; apt remove -y postgresql-client-11
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  postgresql-client-9.6
0 upgraded, 0 newly installed, 1 to remove and 163 not upgraded.
After this operation, 5,856 kB disk space will be freed.
(Reading database ... 32512 files and directories currently installed.)
Removing postgresql-client-9.6 (9.6.18-1.pgdg80+1) ...
Processing triggers for postgresql-common (195.pgdg80+1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
debconf: falling back to frontend: Readline
Building PostgreSQL dictionaries from installed myspell/hunspell packages...
Removing obsolete dictionary files:
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  postgresql-client-9.5
0 upgraded, 0 newly installed, 1 to remove and 163 not upgraded.
After this operation, 5,279 kB disk space will be freed.
(Reading database ... 32224 files and directories currently installed.)
Removing postgresql-client-9.5 (9.5.22-1.pgdg80+1) ...
Processing triggers for postgresql-common (195.pgdg80+1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
debconf: falling back to frontend: Readline
Building PostgreSQL dictionaries from installed myspell/hunspell packages...
Removing obsolete dictionary files:
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  postgresql-client-12
0 upgraded, 0 newly installed, 1 to remove and 163 not upgraded.
After this operation, 5,961 kB disk space will be freed.
(Reading database ... 31948 files and directories currently installed.)
Removing postgresql-client-12 (12.3-1.pgdg80+1) ...
update-alternatives: using /usr/share/postgresql/11/man/man1/psql.1.gz to provide /usr/share/man/man1/psql.1.gz (psql.1.gz) in auto mode
dpkg: warning: while removing postgresql-client-12, directory '/usr/share/postgresql/12' not empty so not removed
Processing triggers for postgresql-common (195.pgdg80+1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
debconf: falling back to frontend: Readline
Building PostgreSQL dictionaries from installed myspell/hunspell packages...
Removing obsolete dictionary files:
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages will be REMOVED:
  postgresql-client-11
0 upgraded, 0 newly installed, 1 to remove and 163 not upgraded.
After this operation, 6,425 kB disk space will be freed.
(Reading database ... 31636 files and directories currently installed.)
Removing postgresql-client-11 (11.8-1.pgdg80+1) ...
update-alternatives: using /usr/share/postgresql/10/man/man1/psql.1.gz to provide /usr/share/man/man1/psql.1.gz (psql.1.gz) in auto mode
Processing triggers for postgresql-common (195.pgdg80+1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 76.)
debconf: falling back to frontend: Readline
Building PostgreSQL dictionaries from installed myspell/hunspell packages...
Removing obsolete dictionary files:
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# 

... and ...

root@hdb-dev:/home/sburt/src/pgsql-gzip-master#  /usr/bin/pg_config --version
PostgreSQL 10.13 (Debian 10.13-1.pgdg80+1)

... and ...

root@hdb-dev:/home/sburt/src/pgsql-gzip-master# dpkg -l | grep postgres
ii  pgdg-keyring                       2018.2                           all          keyring for apt.postgresql.org
ii  postgresql                         10+191.pgdg80+1                  all          object-relational SQL database (supported version)
ii  postgresql-10                      10.6-1.pgdg80+1                  amd64        object-relational SQL database, version 10 server
ii  postgresql-client-10               10.13-1.pgdg80+1                 amd64        front-end programs for PostgreSQL 10
ii  postgresql-client-common           195.pgdg80+1                     all          manager for multiple PostgreSQL client versions
ii  postgresql-common                  195.pgdg80+1                     all          PostgreSQL database-cluster manager
ii  postgresql-doc                     10+191.pgdg80+1                  all          documentation for the PostgreSQL database management system
ii  postgresql-doc-10                  10.6-1.pgdg80+1                  all          documentation for the PostgreSQL database management system
ii  postgresql-server-dev-10           10.13-1.pgdg80+1                 amd64        development files for PostgreSQL 10 server-side programming
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# 

...
so
!!
ok
may
bo
ok
...

so remake ...

root@hdb-dev:/home/sburt/src/pgsql-gzip-master# make
gcc -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -g -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -fPIC -pie -fno-omit-frame-pointer -fPIC -I. -I./ -I/usr/include/postgresql/10/server -I/usr/include/postgresql/internal -I/usr/include/x86_64-linux-gnu  -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -I/usr/include/libxml2  -I/usr/include/mit-krb5  -c -o pg_gzip.o pg_gzip.c
gcc -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -g -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -fPIC -pie -fno-omit-frame-pointer -fPIC -shared -o gzip.so pg_gzip.o -L/usr/lib/x86_64-linux-gnu  -Wl,-z,relro -Wl,-z,now  -L/usr/lib/x86_64-linux-gnu/mit-krb5 -Wl,--as-needed  -L/usr/lib/x86_64-linux-gnu -lz  
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# 


root@hdb-dev:/home/sburt/src/pgsql-gzip-master# make install
/bin/mkdir -p '/usr/lib/postgresql/10/lib'
/bin/mkdir -p '/usr/share/postgresql/10/extension'
/bin/mkdir -p '/usr/share/postgresql/10/extension'
/usr/bin/install -c -m 755  gzip.so '/usr/lib/postgresql/10/lib/gzip.so'
/usr/bin/install -c -m 644 .//gzip.control '/usr/share/postgresql/10/extension/'
/usr/bin/install -c -m 644 .//gzip--1.0.sql  '/usr/share/postgresql/10/extension/'
root@hdb-dev:/home/sburt/src/pgsql-gzip-master#
root@hdb-dev:/home/sburt/src/pgsql-gzip-master# su hdb_aimondo
hdb_aimondo@hdb-dev:/home/sburt/src/pgsql-gzip-master$ psql hdb
psql (10.13 (Debian 10.13-1.pgdg80+1), server 10.6 (Debian 10.6-1.pgdg80+1))
Type "help" for help.

hdb=# create extension gzip ;
CREATE EXTENSION
hdb=# 



:
: NOTE : 01 : [[

update after the version problems (see NOTE : 00 above) :

so originally : apt install postgresql-server-dev-all
and compilation of pgsql-gzip
only works if PG is newest version already, on host
... so now the dependency should be met, before installing pgsql-gzip, like this :

apt install postgresql-server-dev-10
(or 11 for current PROD)

]]

