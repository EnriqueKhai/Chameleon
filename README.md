# Introduction

> Steganography is the practice of concealing a message within another message
> or a physical object. In computing/electronic contexts, a computer file, message,
> image, or video is concealed within another file, message, image, or video.

Where cryptography is the art of concealing messages from prying eyes, steganography
tries to hide the fact that a message was sent at all. Applications of steganography
range from [digital watermarking](https://en.wikipedia.org/wiki/Digital_watermarking)
to securing communication channels.

For more information on steganography, watch [this](https://youtu.be/TWEXCYQKyDc).

# Overview

Chameleon is a collection of MATLAB scripts and functions that perform steganographic
operations. These tools allow users to embed and recover all kinds of binary files in
and from photographic images. For a video demo, click here.

### The following binary files can be embedded using Chameleon:

1. Word documents, excel files and PDF reports.
2. C-executables and small programs.
3. Another image!
4. *Any* byte-representable computer file.


Why would anyone need something like that? Glad you asked!

One reasonable motivation is being able to feel like a hacker. Hide you school homework,
grandfather's address or text files containing secret keys inside an image of a cute puppy
and send it to your friends! Have them clone this git repository and - *viola!* - you
have your own secret communication channel!

Also, you can hide all sorts of stuff from the FBI! Why you would do that is beyond me,
though if by happenstance you ever find such a need please do not contact me...
