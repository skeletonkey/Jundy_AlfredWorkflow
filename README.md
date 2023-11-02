# Jundy AlfredWorkflow

Perl Module to help with creating Alfred Workflows.

## Description

A collection of code to help with creating Alfred Workflows using Perl.

The main goal is to reduce the number of modules that are required; hence, this 'module' is presented in different submodules.  The entire library can be required as a typical installed module on the system or the required code can be copied into the Workflow's code base.

### Adding required code to the Workflow

Currently, this is accomplished by manually copying the required code into a Workflow's base dir.  Any updates need to be applied manually.

This places the burden on the Workflow creator, but has the advantage that the user doesn't need to do anything: no installing Perl modules, no dealing with sub-repositories.

Manual installation steps will be added once best practices become apparent.

## Functionality

The base module currently only exists to provide the version number.

### Submodules

#### Filter

Functions to help the Script Filter object.

##### display

Take in a list and print out the item list for the filtered drop down.

```perl
my $data = {
    empty => { title => 'No notes found', subtitle => 'Please try a different search'},
    data => [
        { title => "one", subtitle => "1", arg => ".1", },
        { title => "two", subtitle => "2", arg => ".2", },
        { title => "three", subtitle => "3", },
    ],
};
Jundy::AlfredWorkflow::Filter::display($data);
```

#### HTTP

Provide HTTP operations.

##### Requirements

`curl` is required when using most of the HTTP operations.

##### url_encode

Take a string and encode special characters. This is not an exhaustive list but it should cover required characters. No external modules are used to reduce code size and installation requirements.

```perl
my $encoded = Jundy::AlfredWorkflow::HTTP::url_encode("Foo bar");
# $encode == "Foo%20bar"
```




