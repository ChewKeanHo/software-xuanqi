# XuanQi (周健豪·玄器) | (Holloway) Chew, Kean Ho's Software

```
      0000000000    0000           0000
         000 0000                  0000
     00 000000000   0000            00000
     00  00000000   0000         00000000000000000000
     000  0   000   0000  0000000000000000000000000000
     00000000 000   0000 00000      000  000
    00 000000 000                 000  00000
   00         000   0000         0000  00000
 00         00000              00000000000
              00    0000       0000000000
                               00000000   00
          00        0000           000   00000
    00    00000     0000         00000000000000
   000000000000000  0000         000000000 0000
  00  0000000       0000          000       00
00 0 0000000000
  00   0000000      0000        00000   00000000
  000000 00000000             000   0000000 0000
  00 00000000       0000      00   000  00 0000
  0000  0000000000  0000       0000000  0000000
  00       0000000             00000 00  0
      000           0000        0    000 0000
       0000000      0000            00000000000000
    0000000                000000000000000000000000
      00000         0000    000    000 0000
     000000000000   0000          000   0000000
  00  0000   00000              0000      00000
 00   000000        0000     0000000000000000000000
    0000000                  000   0000000    00000
    000000000       0000      00  0000  00   00000
     0  00  000               0000000   000000000
      0000          0000      00000     000
```

[![banner](/.internals/trademarks/banner_1200x100.svg)](#)

*Tame the Chaos of Content Production.*

Dependency hell, brittle toolchains, security concerns, and geopolitical
complexities; These should not disrupt your workflow. XuanQi offers a
powerful alternative: highly portable software that guarantees reliable,
consistent reproduction of your content anywhere, anytime, with full
customizability.

Built on the principles of consistency, decentralized supply chains, and
simplicity, XuanQi ensures true data sovereignty. Your data and its
production processor remain reproducible and maintainable, without
introducing critical dependencies or compromising future development.

Its design principles are:

1. **You Maintain Absolute Control** - No more unexpected changes to terms,
   conditions, or business policies after you've committed.
2. **Maximum Customizability** - Build content programmatically, free from
   restrictive abstract assumptions and vendor lock-in processes.
3. **Decentralized Supply Chains** - Operate completely free from
   geopolitical disruptions and unreasonable restrictions.
4. **Inherently Modular** - Simplify management of external components and
   resources built with various technologies.
5. **Reliable Reproducibility** - Reproduce any content reliably anywhere
   with shell triggers.
6. **Minimal Learning Cost** - Just reuse your `POSIX Shell` scripting
   knowledge. No new programming language required.
7. **Easy Integration** - Integrate with any `CI` using just simple
   commands.

XuanQi is capable of handling various content generation related tasks in a
repository. It has:

* **Filesystem Nodes Based Router** - focus on mapping each file/directory
  node creation instead of technology-specific focused.
* **Use the Entire Repository** - no need to pre-duplicate resources nodes
  just to accommodate a specific technology's limitations.
* **High Customizability** - the routers are POSIX `Shell` scripts so go
  wild with selecting your techologies and production decisions.
* **Not Output Restrictions** - it just execute the router shell script and
  nothing else.

**XuanQi - Just Build The Contents Seamlessly.**




## Verifying Content Integrity

[![banner](/.internals/trademarks/banner_1200x100.svg)](#)

To secure the content from unauthorized modification by anyone, down to the bit
level (`0|1`), all files are cryptographically signed using one or more
cryptography tools such as but not limited to:

* [GnuPG](https://gnupg.org); AND/OR
* [OpenSSL](https://www.openssl.org/).

The public key and the associated certificate are attached. Only the main owner
keeps and maintains the private keys. To verify the content's integrity:



### GnuPG

You should also download the following from the same portal:

1. the package's GPG/PGP detached signature (the associated `.asc` file); AND
2. the signing public key (`public-key.gpg`)


#### Download and Install GnuPG

For GnuPG software, you can source it from the
[GnuPG official website](https://gnupg.org/). Follow the instructions therein to
properly install it.


#### Confirming Key Origin

The command to display the key's fingerprint is:

```
$ gpg --no-default-keyring --fingerprint --show-keys /path/to/public-key.gpg
```

Then look for:

```
pub   ed25519 2020-01-13 [C]
      49B7 8787 4910 7ED9 C456  267A CFD3 316C 2987 3FB5
```

If it matches, that means the public key is indeed from the original owner
itself.

Otherwise, treat this as a sign of tampering: switch to a new mirror and restart
the verification.


#### Verify the Package Integrity

To verify the package integrity, the command is as follows:

```
$ gpg --no-default-keyring --keyring /path/to/public-key.gpg --verify [PACKAGE].asc [PACKAGE]
```

If GnuPG reports a good signature, the content is intact.

Otherwise, the package is tainted and you **MUST** remove it at all costs. Try
downloading from another mirror and restart the content integrity verification.



### OpenSSL

1. Install [OpenSSL](https://www.openssl.org) software if not present.
2. Download the target file and its detached signature file (the `.sig`/`.sign`
   file with the same filename).
3. Download the public certificate file (`.pem`) containing the public key
   within.
4. Place them next to each other in the directory.
5. Open a terminal and execute the following command:

```
$ openssl dgst -verify /path/to/pubkey.pem -signature /path/to/file.sig /path/to/file
```




## Artificial Intelligence (A.I.) Decrees

[![banner](/.internals/trademarks/banner_1200x100.svg)](#)

Please refer to [AI_DECREES.md](AI_DECREES.md) for the project's policy on the
use of Artificial Intelligence.




## Maintainers' Notes

[![banner](/.internals/trademarks/banner_1200x100.svg)](#)

Please refer to [CONTRIBUTING.md](CONTRIBUTING.md) for contributing &
maintenances guidelines.




## License

[![banner](/.internals/trademarks/banner_1200x100.svg)](#)

* [Agreed GIMP License](.internals/terms-of-services/GimpORG-License.pdf)
* [Agreed GIMP Privacy Policy](.internals/privacy-policy/GimpORG-Privacy-Policy.pdf)
* [Agreed Inkscape License](.internals/terms-of-services/Inkscape-License.pdf)
* [Agreed Inkscape Privacy Policy](.internals/privacy-policy/Inkscape-Privacy-Policy.pdf)

This entire repository is licensed under [BSD Zero Clause License](LICENSE.txt).
To ensure better understanding of this license, the following sub-sections will
briefly describe how to deploy the content.

For registered non-profit organizations (NGO), you are considered a
`Commercial Entity` the same as any for-profit organization by default. However,
you will be eligible for the NGO disbursement grant and receive exception
privileges from the creator(s).



### Attribution

This license **DOES NOT** mandate attribution requirement. Unless absolutely
needed, you may attribute back to the creator(s) as follows:

```
Title: (Holloway) Chew, Kean Ho's XuanQi (周健豪·玄器)
Creators: (Holloway) Chew, Kean Ho
Packaged-By: (Holloway) Chew, Kean Ho
Contact: hello@chewkeanho.com
SKU: chewkeanho-software-xuanqi
UUID: A1C8B6B1-CF6F-435B-9ECE-60AA15E7240D
DOI: 10.5281/zenodo.24331455
License: BSD Zero Clause License (https://opensource.org/licenses/0BSD)
Repository Made On: 2025-10-13
Repository Made From: Malaysia, South East Asia
Procure: https://github.com/ChewKeanHo/software-xuanqi
```




### Ownership - Personal

> [!NOTE]
>
> This targets any customer wanting to own a copy of the content and then only
> he/she is using it without sharing with any 3rd-party entity; AND **WITHOUT**
> any monetary intention such as but not limited to:
>
> * Saving a local copy and then viewing via his/her own mobile device(s); OR
> * Saving a local copy and then viewing via his/her own personal computer; OR
> * Saving a local copy for artificial intelligence data training purposes.

You are **ALLOWED** without any restriction.



### Ownership - Commercial

> [!NOTE]
>
> This targets any customer wanting to own a copy of the content and then only
> he/she is using it without sharing with any 3rd-party entity; AND **WITH** any
> monetary intention such as but not limited to:
>
> * Saving a local copy for enhancing his/her company's procurement list; OR
> * Saving a local copy for commercial artificial intelligence data training
>   purposes.

You are **ALLOWED** without any restriction.



### Reference - Personal & Commercial

> [!NOTE]
>
> This targets any customer wanting to refer or to provide a guide for sourcing
> the original content for any 3rd-party entity **without directly displaying
> any portion of the original content**; **WITHOUT** any monetary intention such
> as but not limited to:
>
> * Academic research and paper writing; OR
> * New content creation linking to the original content **WITHOUT displaying
>   any of the original content** for his/her own streaming platform; OR
> * Content production and collection linking to original content **WITHOUT
>   displaying any of the original content**; OR
> * Web portfolio project linking to the original content **WITHOUT displaying
>   any of the original content**; OR
> * Event materials linking the original content **WITHOUT displaying any of the
>   original content**; OR
> * Meeting materials linking the original content **WITHOUT displaying any of
>   the original content**; OR
> * Advertisement contents linking the original content **WITHOUT displaying any
>   of the original content**.

You are **ALLOWED** without any restriction.



### Integration - Personal

> [!NOTE]
>
> This targets any customer wanting to directly **display portions and NOT ALL**
> of the original content **as it is OR without any composing remixes or
> modifications retaining the original intent, art direction and messages** into
> his/her content creation; **WITHOUT** any monetary intention such as but not
> limited to:
>
> * New content creation with displaying portion(s) of the original content for
>   his/her own streaming platform **without any monetary gain**; OR
> * Content production and collection with displaying portion(s) of the original
>   content **without any monetary gain**; OR
> * Web portfolio project with displaying portion(s) of the original content
>   **without any monetary gain**; OR
> * Event materials with displaying portion(s) of the original content
>   **without any monetary gain**; OR
> * Meeting materials with displaying portion(s) of the original content
>   **without any monetary gain**.

You are **ALLOWED** without any restriction.



### Integration - Commercial

> [!NOTE]
>
> This targets any customer wanting to directly **display portions and NOT ALL**
> of the original content **as it is OR without any composing remixes or
> modifications retaining the original intent, art direction and messages** into
> his/her content creation; **WITH** any monetary intention such as but not
> limited to:
>
> * New content creation with displaying portion(s) of the original content for
>   his/her own streaming platform; OR
> * Content production and collection with displaying portion(s) of the original
>   content; OR
> * Web portfolio project with displaying portion(s) of the original content; OR
> * Event materials with displaying portion(s) of the original content; OR
> * Meeting materials with displaying portion(s) of the original content; OR
> * Advertisement materials with displaying portion(s) of the original content.

You are **ALLOWED** without any restriction.



### Composition Remix - Personal

> [!NOTE]
>
> This targets any customer wanting to own and then **modify the original
> content extensively preserving or altering the original intent, art direction,
> or message** for composing his/her new content creation; **WITHOUT** any
> monetary intention such as but not limited to:
>
> * New content creation with digitally modified and processed original content
>   integration for his/her own streaming platform **WITHOUT** any profits
>   including advertisement commission; OR
> * Personal content production and collection with digitally modified and
>   processed original content integration for his/her own streaming platform
>   **WITHOUT** any profits including advertisement commission; OR
> * Personal web portfolio project with digitally modified and processed
>   original content integration for his/her own streaming platform **WITHOUT**
>   any profits including advertisement commission; OR
> * Social media meme content creation with digitally modified and processed
>   original content integration for his/her own streaming platform **WITHOUT**
>   any profits including advertisement commission.

You are **ALLOWED** without any restriction.



### Composition Remix - Commercial

> [!NOTE]
>
> This targets any customer wanting to own and then **modify the original
> content extensively preserving or altering the original intent, art direction,
> or message** for composing his/her new content creation; **WITH** any monetary
> intention such as but not limited to:
>
> * New content creation with digitally modified and processed original content
>   integration for his/her own streaming platform; OR
> * Personal content production and collection with digitally modified and
>   processed original content integration for his/her own streaming platform;
>   OR
> * Personal web portfolio project with digitally modified and processed
>   original content integration for his/her own streaming platform; OR
> * Social media meme content creation with digitally modified and processed
>   original content integration for his/her own streaming platform.

You are **ALLOWED** without any restriction.



### Broadcast or Resell Redistribution - Personal

> [!NOTE]
>
> This targets any customer wanting to share, to broadcast, to re-distribute,
> to sell, or to re-sell the original, **modified, OR derived** content
> **WITHOUT** any monetary intention such as but not limited to:
>
> * Sharing with family members; OR
> * Streaming the content via any streaming platform with private viewer
>   access; OR
> * Displaying the content in his/her gallery with privately invited guests; OR
> * Displaying the content in private, free entry open spaces like living room;
>   OR
> * Owning a copy of the original content and serving it as downloadable content
>   on a website in a private network (e.g. self-hosted home network); OR
> * Sharing the original content across social media or messaging applications
>   like email or instant messenger.

You are **ALLOWED** without any restriction.



### Broadcast or Resell Redistribution - Commercial

> [!NOTE]
>
> This targets any customer wanting to share, to broadcast, to re-distribute,
> to sell, or to re-sell the original, **modified, OR derived** content
> **WITH** any monetary intention such as but not limited to:
>
> * Streaming the content via any streaming platform with public or private
>   viewer access; OR
> * Displaying the content in any company's public events with free or payable
>   guest invites; OR
> * Displaying the content in any company's internal/private events with free or
>   payable guest invites; OR
> * Owning a copy of the original content and serving it as free OR payable
>   downloadable content on his/her website in any network (Internet, Intranet,
>   or private networks); OR
> * Sharing the original content across social media or messaging applications
>   like email or instant messenger; OR
> * Distributing the original content via multiple profit-earning streaming
>   platforms.

You are **ALLOWED** without any restriction.
