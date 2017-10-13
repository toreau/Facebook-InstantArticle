# NAME

Facebook::InstantArticle - Helper class for generating Facebook Instant Articles
markup.

# DESCRIPTION

Facebook::InstantArticle is a simple helper class for generating [Facebook
Instant Articles markup](https://developers.facebook.com/docs/instant-articles/reference).

At the moment it doesn't support all of the features, and both the internal and
external API are subject to change in upcoming releases, so use with care.

# SYNOPSIS

    use Facebook::InstantArticle;
    use DateTime;

    my $now = DateTime->now,

    my $ia = Facebook::InstantArticle->new(
        language          => 'en',
        url               => 'http://www.example.com/2016/08/17/some-article',
        title             => 'Some title',
        subtitle          => 'Got one?',
        kicker            => 'Nobody needs a kicker, but...',
        published         => "$now",
        modified          => "$now",
        auto_ad_placement => 0, # defaults to true
        style             => 'MyStyleName',
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

# METHODS

## add\_lead\_asset\_image

Adds a lead asset image to the article.

    $ia->add_lead_asset_image(
        source  => 'http://www.example.com/lead_image.png',
        caption => 'Something wicked this way comes...',
    );

## add\_lead\_asset\_video

Adds a lead asset video to the article.

    $ia->add_lead_asset_video(
        source  => 'http://www.example.com/lead_video.mp4',
        caption => 'Something wicked this way comes...',
    );

## add\_author

Adds an author to the article.

    $ia->add_author(
        name => 'Oscar Wilde',
    );

## add\_paragraph

Adds a paragraph to the article.

    $ia->add_paragraph( 'This is a paragraph' );

## add\_image

Adds an image to the article.

    $ia->add_image(
        source  => 'http://www.example.com/image.png',
        caption => 'Some caption...',
    );

## add\_video

Adds a video to the article.

    $ia->add_video(
        source  => 'http://www.example.com/video.mp4',
        caption => 'Some caption...',
    );

## add\_slideshow

Adds a Facebook::InstantArticle::Slideshow object to the article.

    my $ss = Facebook::InstantArticle::Slideshow->new;

    $ss->add_image(
        source  => 'http://www.example.com/image_01.png',
        caption => 'Image #1',
    );

    $ss->add_image(
        source  => 'http://www.example.com/image_02.png',
        caption => 'Image #2',
    );

    $ia->add_slideshow( $ss );

## add\_credit

Adds a credit to the article.

    $ia->add_credit( 'Thanks for helping me write this article, someone!' );

## add\_copyright

Adds a copyright to the article.

    $ia->add_copyright( 'Copyright 2016, Fubar Inc.' );

## add\_list

Adds a Facebook::InstantArticle::List object to the article.

    $ia->add_list(
        ordered  => 1, # default 0
        elements => [ 'Element #1', 'Element #2', 'Element 3' ],
    );

## add\_blockquote

Adds a blockquote to the article.

    $ia->add_blockquote( 'This is blockquoted.' );

## add\_embed

Adds an embed to the article.

    $ia->add_embed( 'code' );

## add\_heading

Adds a heading to the article BODY.

    $ia->add_heading(
        level => 1,
        text  => 'Heading',
    );

## add\_map

Adds a map to the article BODY.

    $ia->add_map(
        latitude  => 56.1341342,
        longitude => 23.253474,
    );

## add\_analytics

Adds an analytics iframe to the article body.

## to\_string

Generates the instant article and returns it as a string.

# AUTHOR

Tore Aursand <toreau@gmail.com>

# COPYRIGHT

Copyright 2016 - Tore Aursand

# LICENSE

This library is free software; you can redistribute it and/or modify it under
the same terms as Perl itself.
