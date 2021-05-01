# Introduction

> Steganography is the practice of concealing a message within another message
> or a physical object. In computing/electronic contexts, a computer file, message,
> image, or video is concealed within another file, message, image, or video.

Where cryptography is the art of concealing messages from prying eyes, steganography
tries to hide the fact that a message was sent at all. Imaging writing a letter to
your friend, and between the lines you write another message in invisible ink. From
the outside looking in, no one would ever guess that something was going on under the
hood! That is the power of steganography in a nutshell.

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
