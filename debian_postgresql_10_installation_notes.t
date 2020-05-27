:
: NOTE : 01 : [[

update after the version problems (see NOTE : 00 below) :

so originally :

  apt install postgresql-server-dev-all

and the compilation of pgsql-gzip only works if PG is newest version already, on host
... so now the dependency should be met, before installing pgsql-gzip, like this :

  apt install postgresql-server-dev-10

]]


:
: NOTE : 00 : [[

scp -i *** -P *** ***/pgsql-gzip-master.zip ***:***/                                                                                                                                                   100%   15KB  92.9KB/s   00:00    


in debian container ...
-------------------

apt update

apt install postgresql-server-dev-all

unzip pgsql-gzip-master.zip

mv pgsql-gzip-master ../src/

cd ../src

make
gcc -std=gnu99 -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Werror=vla -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -g -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -fPIC -pie -fno-omit-frame-pointer -fPIC -I. -I./ -I/usr/include/postgresql/12/server -I/usr/include/postgresql/internal -I/usr/include/x86_64-linux-gnu  -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -I/usr/include/libxml2  -I/usr/include/mit-krb5  -c -o pg_gzip.o pg_gzip.c
gcc -std=gnu99 -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Werror=vla -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -g -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -fPIC -pie -fno-omit-frame-pointer -fPIC -shared -o gzip.so pg_gzip.o -L/usr/lib/x86_64-linux-gnu  -Wl,-z,relro -Wl,-z,now  -L/usr/lib/x86_64-linux-gnu/mit-krb5 -Wl,--as-needed  -L/usr/lib/x86_64-linux-gnu -lz  

make install
/bin/mkdir -p '/usr/lib/postgresql/12/lib'
/bin/mkdir -p '/usr/share/postgresql/12/extension'
/bin/mkdir -p '/usr/share/postgresql/12/extension'
/usr/bin/install -c -m 755  gzip.so '/usr/lib/postgresql/12/lib/gzip.so'
/usr/bin/install -c -m 644 .//gzip.control '/usr/share/postgresql/12/extension/'
/usr/bin/install -c -m 644 .//gzip--1.0.sql  '/usr/share/postgresql/12/extension/'

WHY 12 not 10 ??

psql (12.3 (Debian 12.3-1.pgdg80+1), server 10.6 (Debian 10.6-1.pgdg80+1))
***=# create extension gzip ;
ERROR:  could not open extension control file "/usr/share/postgresql/10/extension/gzip.control": No such file or directory

... make install to right places ...

***=# create extension gzip ;
ERROR:  incompatible library "/usr/lib/postgresql/10/lib/gzip.so": version mismatch
DETAIL:  Server is version 10, library is version 12.

... oh dear ...

make clean

... postgresql-server-dev-all puts all versions and pg_config chooses 12 !

pg_config --version
PostgreSQL 12.3 (Debian 12.3-1.pgdg80+1)

dpkg -l | grep postgres
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

... so ...

apt remove --auto-remove postgresql-server-dev-all

... did not fix ...




... now ...

apt remove --auto-remove postgresql-server-dev-9.6
apt remove --auto-remove postgresql-server-dev-9.5
apt remove --auto-remove postgresql-server-dev-12
apt remove --auto-remove postgresql-server-dev-11


... and ...

/usr/bin/pg_config --version
PostgreSQL 12.3 (Debian 12.3-1.pgdg80+1)

... but eg ...

pg_dump --version
pg_dump (PostgreSQL) 10.13 (Debian 10.13-1.pgdg80+1)

... hmmm ...

apt remove -y postgresql-client-9.6
apt remove -y postgresql-client-9.5
apt remove -y postgresql-client-12
apt remove -y postgresql-client-11

... and ...

/usr/bin/pg_config --version
PostgreSQL 10.13 (Debian 10.13-1.pgdg80+1)

...
so
!!
ok
may
bo
ok
...

so ...

make
gcc -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -g -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -fPIC -pie -fno-omit-frame-pointer -fPIC -I. -I./ -I/usr/include/postgresql/10/server -I/usr/include/postgresql/internal -I/usr/include/x86_64-linux-gnu  -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -I/usr/include/libxml2  -I/usr/include/mit-krb5  -c -o pg_gzip.o pg_gzip.c
gcc -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -g -g -O2 -fstack-protector-strong -Wformat -Werror=format-security -fPIC -pie -fno-omit-frame-pointer -fPIC -shared -o gzip.so pg_gzip.o -L/usr/lib/x86_64-linux-gnu  -Wl,-z,relro -Wl,-z,now  -L/usr/lib/x86_64-linux-gnu/mit-krb5 -Wl,--as-needed  -L/usr/lib/x86_64-linux-gnu -lz  

make install
/bin/mkdir -p '/usr/lib/postgresql/10/lib'
/bin/mkdir -p '/usr/share/postgresql/10/extension'
/bin/mkdir -p '/usr/share/postgresql/10/extension'
/usr/bin/install -c -m 755  gzip.so '/usr/lib/postgresql/10/lib/gzip.so'
/usr/bin/install -c -m 644 .//gzip.control '/usr/share/postgresql/10/extension/'
/usr/bin/install -c -m 644 .//gzip--1.0.sql  '/usr/share/postgresql/10/extension/'

then ...

psql (10.13 (Debian 10.13-1.pgdg80+1), server 10.6 (Debian 10.6-1.pgdg80+1))
Type "help" for help.

***=# create extension gzip ;
CREATE EXTENSION

all ok

]]
