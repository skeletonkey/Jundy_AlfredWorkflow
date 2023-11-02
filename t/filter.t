use Test2::V0;
 
use Jundy::AlfredWorkflow::Filter;

$| = 1;

# display
my @tests = (
    {
        expected => '{"items":[{"title":"No notes found","subtitle":"Please try a different search","arg":""}]}',
        name => 'No data',
        test => {
            empty => { title => 'No notes found', subtitle => 'Please try a different search'},
            data => [],
        },
    },
    {
        expected => '{"items":[{"title":"one","subtitle":"1","arg":".1"}]}',
        name => '1 item',
        test => {
            empty => { title => 'No notes found', subtitle => 'Please try a different search'},
            data => [
                { title => "one", subtitle => "1", arg => ".1", },
            ],
        },
    },
    {
        expected => '{"items":[{"title":"one","subtitle":"1","arg":".1"},{"title":"two","subtitle":"2","arg":".2"}]}',
        name => '2 items',
        test => {
            empty => { title => 'No notes found', subtitle => 'Please try a different search'},
            data => [
                { title => "one", subtitle => "1", arg => ".1", },
                { title => "two", subtitle => "2", arg => ".2", },
            ],
        },
    },
    {
        expected => '{"items":[{"title":"one","subtitle":"1","arg":".1"},{"title":"two","subtitle":"2","arg":".2"},{"title":"three","subtitle":"3","arg":""}]}',
        name => '3 items, 1 without an arg',
        test => {
            empty => { title => 'No notes found', subtitle => 'Please try a different search'},
            data => [
                { title => "one", subtitle => "1", arg => ".1", },
                { title => "two", subtitle => "2", arg => ".2", },
                { title => "three", subtitle => "3", },
            ],
        },
    },
);

my $temp_stdout;
foreach my $test (@tests) {
    close STDOUT;
    open STDOUT, '>', \$temp_stdout || die "Unable to open STDOUT: $!\n";
    Jundy::AlfredWorkflow::Filter::display($test->{test});
    is($temp_stdout, $test->{expected}, $test->{name});
}
 
done_testing;