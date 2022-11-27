SlowLoris test for a bunch of Common Lisp webservers
====================================================

Read more about Slowloris type of DoS attack here

This repository was created to check if Woo server is vulnerable to this kind of attacks:
https://github.com/fukamachi/woo/issues/100

For tests I've used apache benchmark, running it as:

```
ab -c 20 -n 10000 http://51.250.85.16:9001/
```

And this tool for performing a Slowloris attack agains the webserver:
https://github.com/shekyan/slowHttpTest


Woo baseline
------------

### 1 thread

```
Concurrency Level:      1
Time taken for tests:   19.456 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      114000 bytes
HTML transferred:       12000 bytes
Requests per second:    51.40 [#/sec] (mean)
Time per request:       19.456 [ms] (mean)
Time per request:       19.456 [ms] (mean, across all concurrent requests)
Transfer rate:          5.72 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        7    9   2.0      9      31
Processing:     7   10  10.5      9     336
Waiting:        7   10   1.8      9      31
Total:         15   19  10.7     18     344

Percentage of the requests served within a certain time (ms)
  50%     18
  66%     19
  75%     20
  80%     20
  90%     22
  95%     25
  98%     28
  99%     31
 100%    344 (longest request)
```

### 10 threads

```
Concurrency Level:      10
Time taken for tests:   3.367 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      114000 bytes
HTML transferred:       12000 bytes
Requests per second:    297.04 [#/sec] (mean)
Time per request:       33.666 [ms] (mean)
Time per request:       3.367 [ms] (mean, across all concurrent requests)
Transfer rate:          33.07 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        6   21 102.3     11    1043
Processing:     7   12  17.9     11     337
Waiting:        7   12  17.8     11     337
Total:         15   33 103.9     22    1055

Percentage of the requests served within a certain time (ms)
  50%     22
  66%     23
  75%     24
  80%     24
  90%     26
  95%     28
  98%     33
  99%   1043
 100%   1055 (longest request)
```

### 100 threads

```
Concurrency Level:      100
Time taken for tests:   4.999 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1140000 bytes
HTML transferred:       120000 bytes
Requests per second:    2000.47 [#/sec] (mean)
Time per request:       49.988 [ms] (mean)
Time per request:       0.500 [ms] (mean, across all concurrent requests)
Transfer rate:          222.71 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        8   24   5.8     23      50
Processing:    11   26  14.0     24     332
Waiting:        9   25  13.7     24     332
Total:         21   49  16.2     48     361

Percentage of the requests served within a certain time (ms)
  50%     48
  66%     52
  75%     56
  80%     57
  90%     62
  95%     66
  98%     71
  99%     79
 100%    361 (longest request)
```


Hunchentoot baseline
--------------------

### 1 connect

```
Concurrency Level:      1
Time taken for tests:   21.163 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      140000 bytes
HTML transferred:       12000 bytes
Requests per second:    47.25 [#/sec] (mean)
Time per request:       21.163 [ms] (mean)
Time per request:       21.163 [ms] (mean, across all concurrent requests)
Transfer rate:          6.46 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        7   11  45.9      9    1036
Processing:     8   10   2.8      9      59
Waiting:        7   10   2.8      9      59
Total:         15   21  46.0     18    1046

Percentage of the requests served within a certain time (ms)
  50%     18
  66%     19
  75%     19
  80%     20
  90%     22
  95%     24
  98%     28
  99%     29
 100%   1046 (longest request)
```

### 10 connections

```
Concurrency Level:      10
Time taken for tests:   2.247 seconds
Complete requests:      1000
Failed requests:        0
Total transferred:      140000 bytes
HTML transferred:       12000 bytes
Requests per second:    445.12 [#/sec] (mean)
Time per request:       22.466 [ms] (mean)
Time per request:       2.247 [ms] (mean, across all concurrent requests)
Transfer rate:          60.86 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        7   11   2.3     10      26
Processing:     7   11   2.4     11      26
Waiting:        7   11   2.3     11      26
Total:         15   22   3.5     22      38

Percentage of the requests served within a certain time (ms)
  50%     22
  66%     23
  75%     23
  80%     24
  90%     26
  95%     29
  98%     36
  99%     37
 100%     38 (longest request)
```


### 100 connections

```
Concurrency Level:      100
Time taken for tests:   4.963 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1400000 bytes
HTML transferred:       120000 bytes
Requests per second:    2014.77 [#/sec] (mean)
Time per request:       49.633 [ms] (mean)
Time per request:       0.496 [ms] (mean, across all concurrent requests)
Transfer rate:          275.46 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        9   24  12.1     23    1048
Processing:    11   25   6.6     24     267
Waiting:        9   25   6.1     24      54
Total:         22   49  14.7     48    1072

Percentage of the requests served within a certain time (ms)
  50%     48
  66%     53
  75%     55
  80%     57
  90%     63
  95%     68
  98%     73
  99%     75
 100%   1072 (longest request)
```
