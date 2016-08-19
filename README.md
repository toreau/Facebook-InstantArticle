# NAME

Facebook::InstantArticle - Helper class for generating Facebook Instant Articles
markup.

# DESCRIPTION

Facebook::InstantArticle is a simple helper class for generating Facebook
Instant Articles markup.

At the moment it doesn't support all of the features, and both the internal and
external API are subject to change in upcoming releases, so use with care.

# SYNOPSIS

    use Facebook::InstantArticle;
    use DateTime;

    my $now = DateTime->now,

    my $ia = Facebook::InstantArticle->new(
        language    => 'en',
        url         => 'http://www.example.com/2016/08/17/some-article',
        title       => 'Some title',
        subtitle    => 'Got one?',
        kicker      => 'Nobody needs a kicker, but...',
        description => 'Usually the ingress of the article',
        published   => "$now",
        modified    => "$now",
    );

    $ia->add_author(
        name        => 'Me Myself',
        description => 'A little bit about myself',
    );

    $ia->add_author(
        name        => 'Someone Else',
        description => 'A little bit about someone else',
    );

    $ia->add_lead_asset_image(
        source  => 'http://www.example.com/some_image.png',
        caption => 'Nice image, eh?',
    );

    # or

    $ia->add_lead_asset_video(
        source  => 'http://www.example.com/some_video.mp4',
        caption => 'Nice video, eh?',
    );

    $ia->add_paragraph(
        'Will be wrapped in a P element, conversion of inner HTML might be
         done, explained later in this documentation.'
    );

    $ia->add_image(
        source          => 'http://www.example.com/some_image.png',
        caption         => 'Nice picture, eh?',
        enable_comments => 1, # default false
        enable_likes    => 1, # default false
    );

    $ia->add_video(
        source  => 'http://www.example.com/some_video.mp4',
        caption => 'Nice video, eh?',
    );

    say $ia->to_string;

# AUTHOR

Tore Aursand <toreau@gmail.com>

# COPYRIGHT

Copyright 2016- Tore Aursand

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
