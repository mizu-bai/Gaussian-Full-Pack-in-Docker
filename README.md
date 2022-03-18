# Gaussian-Full-Pack-in-Docker

Package Gaussian and GaussView in Docker

## IMPORTANT INFO

Gaussian and GaussView are licensed programs and the executable files will not be added to this image.

Docker image created by this Dockerfile only prepares a compatible linux environment.

Assuming that you have owned legal licenses for Gaussian and GaussView.

## Usage

```sh
$ ./gaussian-16-launcher.pl [option]
```
Avaliable Options:


| Short  |    Long     |    Introduction    |
|:------:|:-----------:|:------------------:|
| `-st`  |  `--start`  |       Start        |
| `-sp`  |  `--stop`   |        Stop        |
|  `-r`  | `--restart` |      Restart       |
| `-cli` |             | Enter command line |
| `-gui` |             |   Open GaussView   |

## License

BSD 2-Clause License

Copyright (c) 2022, mizu-bai. All rights reserved.
