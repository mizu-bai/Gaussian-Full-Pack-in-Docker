# Gaussian-Full-Pack-in-Docker

Package Gaussian and GaussView in Docker

## IMPORTANT INFO

Gaussian and GaussView are licensed programs and the executable files will not be added to this image.

Docker image created by this Dockerfile only prepares a compatible linux environment.

Assuming that you have owned legal licenses for Gaussian and GaussView.

## Usage

First, open `gaussian-16-launcher.pl`.

Then you will see such code:

```perl
# constants
$host    = "localhost";
$img_n   = "gaussian-16-full-pack";
$cntr_n  = "gaussian-16-full-pack";
$g16_dir = "path/to/g16/dir";
$gv_dir  = "path/to/gv/dir";
$ws      = "path/to/shared/dir";
```

Change the `$g16_dir` and `$gv_dir` to where your Gaussian 16 and GaussView are located, and `$ws` to which directory you want to share.

Now you can run it like

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
