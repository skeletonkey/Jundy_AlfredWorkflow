use Test2::V0;
 
# require_ok("Jundy::AlfredWorkflow::HTTP");
use Jundy::AlfredWorkflow::HTTP;

# url_encoding
my @tests = (
    {
        expected => '%20%21%22%23%24%25%26%27%28%29%2A%2B%2C%2F%3A%3B%3D%3F%40%5B%5D',
        test => ' !"#$%&\'()*+,/:;=?@[]',
    },
    {
        expected => 'Foo%20Bar',
        test => 'Foo Bar',
    },
    {
        expected => '%3Fsomething%3Dnothing',
        test => '?something=nothing',
    },
    {
        expected => 'Isn%27t%20this%20where%20we%20came%20in%3F',
        test => q+Isn't this where we came in?+,
    },
    {
        expected => 'Nothing_to_incode',
        test => 'Nothing_to_incode',
    },
);

foreach my $test (@tests) {
    is(Jundy::AlfredWorkflow::HTTP::url_encode($test->{test}), $test->{expected}, $test->{test});
}
 
done_testing;