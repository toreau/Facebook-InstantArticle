package Facebook::InstantArticle::Embed;
use Moose;
use namespace::autoclean;

extends 'Facebook::InstantArticle::BaseElement';

has 'content' => (
    isa => 'Str',
    is => 'rw',
    required => 1,
    default => '',
);

around BUILDARGS => sub {
    my $orig  = shift;
    my $class = shift;

    if ( @_ == 1 && !ref $_[0] ) {
        return $class->$orig( content => $_[0] );
    }
    else {
        return $class->$orig( @_ );
    }
};

has 'as_xml_gen' => (
    isa => 'Object',
    is => 'ro',
    lazy => 1,
    builder => '_build_as_xml_gen',
);

sub _build_as_xml_gen {
    my $self = shift;

    my $gen = XML::Generator->new( ':pretty' );

    return $gen->figure(
        { class => 'op-interactive' },
        $gen->iframe(
            \$self->content,
        ),
    );
}

1;
