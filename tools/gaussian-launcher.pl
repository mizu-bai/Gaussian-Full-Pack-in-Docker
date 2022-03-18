#!/usr/bin/env perl

use Switch;

# constants
$host    = "localhost";
$img_n   = "gaussian-16-full-pack";
$cntr_n  = "gaussian-16-full-pack";
$g16_dir = "path/to/g16/dir";
$gv_dir  = "path/to/gv/dir";
$ws      = "path/to/shared/dir";

# usage info
$ui = <<EOF;
Usage:

    \$ ./gaussian-16-launcher.pl [option]

Avaliable Options:

    -st     --start      Start
    -sp     --stop       Stop
    -r      --restart    Restart
    -cli                 Enter command line
    -gui                 Open GaussView
EOF

# options
%opt_hash = (
    st  => ["--start", "-st"],
    sp  => ["--stop", "-sp"],
    r   => ["--restart", "-r"],
    cli => "-cli",
    gui => "-gui",
);

# subroutines 
sub chk_sts {
     `docker ps` =~ $cntr_n ? 1 : 0;
}

sub gl_st {
    $st_cmd = <<EOF;
docker run -dt --rm \\
    -v $g16_dir:/opt/g16 \\
    -v $gv_dir:/opt/gv \\
    -v $ws:/opt/GaussianWorkspace \\
    -v /tmp/.X11-unix:/tmp/.X11-unix \\
    --name $cntr_n \\
    -e DISPLAY=host.docker.internal:0 \\
    $img_n
EOF
    if (chk_sts == 1) {
        warn "There is already a Gaussian container running!\n";
    } else {
        print "Starting Gaussian container: $cntr_n, id: " . `$st_cmd`;
    }
}

sub gl_sp {
    $sp_cmd = "docker stop $cntr_n";
    if (chk_sts == 0) {
        warn "No Gaussian container is running!\n";
    } else {
        print "Stopping Gaussian container: " . `$sp_cmd`;
    }
}

sub gl_cli {
    die "Before entering command line, start a Gaussian container first.\n" if chk_sts == 0;
    $cli_cmd = "docker exec -it $cntr_n /bin/bash -c 'source /root/.bash_profile && cd /opt/GaussianWorkspace && bash'";
    exec $cli_cmd;
}

sub gl_gui {
    die "To open GaussView, start a Gaussian container first.\n" if chk_sts == 0;
    $gui_cmd = "docker exec $cntr_n /bin/bash -c 'source /root/.bash_profile && gv -mesagl' & > /dev/null &";
    exec $gui_cmd;
}

# execute options
sub gl_exec {
    `xhost + $host` if `xhost` !~ $host;
    die $ui if ($#_ != 0);
    $opt = shift;
    switch ($opt) {
        case ($opt_hash{st})  { gl_st; }
        case ($opt_hash{sp})  { gl_sp; }
        case ($opt_hash{r})   { gl_sp; gl_st; }
        case ($opt_hash{cli}) { gl_cli; }
        case ($opt_hash{gui}) { gl_gui; }
        else { die "No such option \"$opt\"!\n" }
    }
}

gl_exec @ARGV;
