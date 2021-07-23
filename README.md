![image](https://user-images.githubusercontent.com/42400406/126765638-442ecb72-0af7-40cc-ad98-ab8c6448ed44.png)

> Image by [Arnold Straub](https://unsplash.com/@arnoldstraub)

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
and from photographic images. For a video demo, click [here](https://www.loom.com/share/7897c8f1db04414599a7aa56204ede5a).

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

Need to hide a secret? Well, you can!

# Steganography

For a video demo on how to use Chameleon, click [here](https://www.loom.com/share/7897c8f1db04414599a7aa56204ede5a).

Currently these modes of operations have been implemented/ are planned:

1. LSB Encode
2. LSB Decode
3. DCT Encode (pending...)
4. DCT Decode (pending...)

# Technical Notes

### Chameleon - Encode

Chameleon embeds binaries in a lightweight manner. A 64-bit integer
`num_bytes` denotes the size of the original binary embedded. Within the
modified image, the LSBs of the first 64 pixels form the
[serialized](https://github.com/EnriqueKhai/Chameleon/blob/main/serialize.m)
`num_bytes` exactly. The LSBs of the next `num_bytes` * 8 pixels form the
[serialized](https://github.com/EnriqueKhai/Chameleon/blob/main/serialize.m)
binary exactly.

### Chameleon - Decode

To retrieve a piece of binary from an image that was steganographically
modified, one needs to know *how* the binary file was embedded in the
first place. That varies from implementation to implementation.

This necessarily implies that Chameleon can only extract binaries from
images that (i) contain binaries embedded by Chameleon itself **or**; (ii)
contain binaries that were embedded in **exactly** the same way as
Chameleon would have embedded it (very unlikely).

### Image size.

Currently, binary files can only be embedded in images that are **at least**
8x larger. To be safe, ensure that images are at least 10x larger.

Here, the *size* of an image refers to the product of its dimensions in pixels
multiplied by the number of color channels available. An RGB image (so 3 channels)
with dimensions 100px by 200px will have a size of 100 * 200 * 3 = 60,000 bytes.

### Support for Python3.

I have no intention of re-developing Chameleon in another (more popular)
programming language. Unfortunately, I am a student and have no time to
do that.
