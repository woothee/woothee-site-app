#!/usr/bin/env perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/extlib/lib/perl5";
use lib "$FindBin::Bin/lib";

use Plack::Builder;
use WootheeDemo;

use File::Basename qw//;

my $site_dir = File::Basename::dirname( __FILE__ ) . '/../site';

builder {
    enable "Plack::Middleware::Static",  path => qr{^/(index\.html$|javascripts/|stylesheets/)}, root => $site_dir;
    WootheeDemo->psgi();
};
