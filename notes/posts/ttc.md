---
heading: tiny tunnel chat
file: ttc
ext: crypt
status: incomplete
---


### Preface
Tiny Tunnel Chat(ttc) is a practical use of uttu outside of [concord](https://openconcord.org) and [swn](https://notu.dev/notes/swn), both of which are primarily text-based. TTC is ... small, so this document is proportionately small - it largely encompasses rambling notes taken when I initially wrote TTC.

### Notes
---

#### Sound on Linux

... is mostly pain.
The highest return investment (seems to be) integrating as close as possible to kernel APIs. 

**Useful Documents**
- [Linux Journal](https://www.linuxjournal.com/article/2793) 1994
- [Linux Sound Subsystem Documentation](https://www.kernel.org/doc/html/latest/sound/index.html) Current

**Hot links**
- [Logging to Kernel](https://www.kernel.org/doc/html/latest/core-api/printk-basics.html)
- [Alsa: Capture Mic Input](https://github.com/OpenPixelSystems/c-alsa-examples/blob/master/capture/main.c)

#### Encoding

---

[Wikipedia Chart](https://en.wikipedia.org/wiki/Comparison_of_audio_coding_formats)

> Going to go ahead with a virtual interface for encoding types - it's going to make maintenance a lot less painful.

Looks like mp3 is the way to go - everything else is either paywalled/proprietary or obsolete.
[Loss Tolerant RTP 4 MP3](https://www.rfc-editor.org/rfc/rfc5219)
