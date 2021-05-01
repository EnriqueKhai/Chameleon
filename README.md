# Introduction

> Steganography is the practice of concealing a message within another message
> or a physical object. In computing/electronic contexts, a computer file, message,
> image, or video is concealed within another file, message, image, or video.

Where cryptography is the art of concealing messages from prying eyes, steganography
tries to hide the fact that a message was sent at all.

Imagine intercepting a letter with one line, "uryyb jbeyq". One would be astute to
suspect that some form of encryption was involved. Indeed, "uryyb jbeyq" is an
encryption of "hello world" under ROT13.

Imagine now, intercepting another letter with one line, "hello world". Perfectly
literate content, albeit somewhat nonsensical. Even the most suspecting observer
might not have guessed that in all that blank space sat one entire message written
in invisible ink.

That is the power of steganography; there is nothing to intercept if one does not
even register the possibility of a hidden message. Steganography in general, and in
digital steganography especially, attempts to hide one thing in another by means of
camouflage, in ways similar to how a chameleon blends into its surroundings.

For more information on steganography, watch [this](https://youtu.be/TWEXCYQKyDc).

# Overview

Chameleon is a collection of MATLAB scripts and functions that perform steganographic
operations. These tools allow users to embed and recover all kinds of binary files in
and from photographic images. For a video demo, click here.

### The following types of binaries can be embedded using Chameleon:

1. Document files (Word, Excel, PDF, etc...).
2. Media files (JPG, MP3, MP4, etc...).
3. Source codes (C, Python, Rust, etc...).
4. Small programs or executables.
5. *Any* byte-representable computer file.


Why would anyone need something like that? Glad you asked!

One reasonable motivation is being able to feel like a [hacker](https://github.com/EnriqueKhai).
Hide you school homework, grandfather's address or text files containing secret keys
inside an image of a cute puppy and send it to your friends! Have them clone this git
repository and - *viola!* - you have your own secret communication channel!

Also, you could hide all sorts of stuff from the FBI! Why you would need to do that is beyond
me, but it is what it it.
