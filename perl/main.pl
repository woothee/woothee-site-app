#!/usr/bin/env perl
use Mojolicious::Lite;
# enables "strict","warnings","utf8","Perl 5.10 feature"

use JSON;
use Woothee;

get '/' => sub {
    my $self = shift;
    $self->render(text => 'ok');
};

get '/_ah/health' => sub {
    my $self = shift;
    $self->render(text => 'ok');
};

get '/parse' => sub {
    my $self = shift;
    my $ua = $self->param('ua');
    $self->res->headers->header('Access-Control-Allow-Origin' => '*');
    $self->render(json => Woothee->parse( $ua ) );
};

get '/api' => sub {
    my $self = shift;
    my $ua = $self->param('ua');
    my $data = +{
        version => $Woothee::VERSION,
        result => Woothee->parse( $ua )
      };
    $self->res->headers->header('Access-Control-Allow-Origin' => '*');
    $self->render(json => $data);
};

app->start;
