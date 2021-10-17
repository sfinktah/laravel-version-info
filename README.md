Simple BASH script to get laravel & nova version info for github issues.  Only supports `mysql` at this time, because I only had `mysql` to test with.

```
sfinktah@GF:/web/mob1$ ./versions.sh
Hostname: 127.0.0.1
Getting PHP Version via "curl -s localhost | egrep -o '\(PHP v[^)]+\)'" >
Getting Operating System and Version via "lsb_release -d -s" >
Getting Reproduction Repository via "echo n/a" >
Getting Browser type and version via "browser_check" >

*****
** Please open this link in your browser a few times: http://127.0.0.1:8123/
*****


Getting Nova Version via "grep version vendor/laravel/nova/composer.json | sed 's/.* //'" >
Getting Laravel Version via "grep 'const VERSION' vendor/laravel/framework/src/Illuminate/Foundation/Application.php | sed 's/.* //'" >
Getting Database Driver & Version via "mysqladmin --version" >



* Laravel Version Information obtained by https://github.com/sfinktah/laravel-version-info *
PHP Version: (PHP v7.4.24)
Operating System and Version: Ubuntu 20.04.3 LTS
Reproduction Repository: n/a
Browser type and version: User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36
Nova Version: "3.29.0"
Laravel Version: '8.64.0';
Database Driver & Version: mysqladmin  Ver 8.0.26-0ubuntu0.20.04.3 for Linux on x86_64 ((Ubuntu))
```
