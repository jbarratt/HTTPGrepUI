package HTTPGrepUI;
use Dancer ':syntax';
use HTTPGrep;

our $VERSION = '0.2';
my $hg = HTTPGrep->new_with_options();

get '/' => sub {
    $hg->reconnect_redis();
    template 'index' => { hg => $hg };
};

get '/searches/:search/classes/:class' => sub {
    $hg->reconnect_redis();
    content_type 'text/plain';
    join("\n", $hg->get_results(search => params->{search}, class => params->{class}));
};

get '/classes/:class' => sub {
    $hg->reconnect_redis();
    content_type 'text/plain';
    join("\n", $hg->get_results(class => params->{class}));
};

get '/searches/:search' => sub {
    $hg->reconnect_redis();
    content_type 'text/plain';
    join("\n", $hg->get_results(search => params->{search}));
};


true;
