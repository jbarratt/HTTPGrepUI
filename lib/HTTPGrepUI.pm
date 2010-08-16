package HTTPGrepUI;
use Dancer ':syntax';
use HTTPGrep;

our $VERSION = '0.1';
my $hg = HTTPGrep->new_with_options();

get '/' => sub {
    $hg->reconnect_redis();
    template 'index' => { hg => $hg };
};

get '/searches/:search/keys/:key' => sub {
    $hg->reconnect_redis();
    content_type 'text/plain';
    join("\n", $hg->r->smembers("last_match:" . params->{search} . ":" . params->{key}));
};

get '/searches/:search/live' => sub {
    $hg->reconnect_redis();
    content_type 'text/plain';
    join("\n", $hg->r->smembers("live_match:" . params->{search}));
};

true;
