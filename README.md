# Introduction

> Steganography is the practice of concealing a message within another message
> or a physical object. In computing/electronic contexts, a computer file, message,
> image, or video is concealed within another file, message, image, or video.

Where cryptography is the art of concealing messages from prying eyes, steganography
tries to hide the fact that a message was sent at all.

Imagine intercepting a letter with one line, "uryyb jbeyq". One would be astute to
suspect that some form of encryption was involved. Indeed, "uryyb jbeyq" is an
encryption of "hello world" under [ROT13](https://en.wikipedia.org/wiki/ROT13).

Imagine now, intercepting another letter with one line, "hello world". Perfectly
literate content, albeit somewhat nonsensical. Even the most suspecting observer,
however, might never have guessed that in all that blank space sat an entire message
written in invisible ink.

That is the power of steganography - there is nothing to intercept if one does not
even register the possibility of a hidden message. Steganography in general, and in
digital steganography especially, attempts to hide one thing in another by means of
camouflage, in ways similar to how a chameleon blends into its surroundings.

For more information on steganography, watch [this](https://youtu.be/TWEXCYQKyDc).

# Overview

Chameleon is a collection of MATLAB scripts and functions that perform steganographic
operations. These tools allow users to embed and recover all kinds of binary files in
and from photographic images. For a video demo, click here.

#### The following types of binaries can be embedded using Chameleon:

1. Document files (Word, Excel, PDF, etc...)
2. Media files (JPG, MP3, MP4, etc...)
3. Source codes (C, Python, Rust, etc...)
4. Small programs or executables
5. *Any* byte-representable computer file


Why would anyone need something like that? Glad you asked!

One reasonable motivation is being able to feel like a [hacker](https://github.com/EnriqueKhai).
Hide you school homework, grandfather's address or text files containing secret keys
inside an image of a cute puppy and send it to your friends! Have them clone this git
repository and - *viola!* - you have your own secret communication channel!

# Steganography

Currently these modes of operations have been implemented/ are planned:

1. LSB Encode
2. LSB Decode
3. DCT Encode (dev...)
4. DCT Decode (dev...)

# Technical Notes

### Chameleon - Decode

To retrieve a piece of binary from an image that was steganographically
modified, one needs to know *how* the binary file was embedded in the
first place. That varies from implementation to implementation.

This necessarily implies that Chameleon can only extract binaries from
images that (1) have binaries embedded by Chameleon itself **or**; (ii)
had binaries embedded in **exactly** the same way as Chameleon would have
done it (very unlikely).

Chameleon embeds binaries in a lightweight way. The first 64 bits are
reserved for header information - a 64-bit integer **N** denotes the size
of the original binary embedded. The next **N** bits are form the
serialized binary exactly.

### Image size.

In Chameleon's implementation, binary files can only be embedded in images
that are **at least** 8x larger. To be safe, ensure that images are at least
10x larger.

### Support for Python3.

I have no intention of re-developing Chameleon in another (more popular)
programming language. Unfortunately, I am a student and have no time to
do that.
