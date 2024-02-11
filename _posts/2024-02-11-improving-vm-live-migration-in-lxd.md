---
title: An idea on how to improve QEMU to QEMU VM live migration in LXD
author: gabrielmougard
date: 2024-02-11 00:01:00 +0800
categories: [LXD, Cloud]
tags: [development]
pin: true
hidden: false
ascii_illustration: "
<div class=\"diagram\">
    <pre> +-----------------+                 +-----------------+</pre>
    <pre> |    LXD Host A   |                 |   LXD Host B    |</pre>
    <pre> |                 |                 |                 |</pre>
    <pre> |                 |      Live       |                 |</pre>
    <pre> | +------------+  |    Migration    |  +------------+ |</pre>
    <pre> | |    QEMU    |  | --------------\\ |  |    QEMU    | |</pre>
    <pre> | | Hypervisor |  | \\-------------  |  | Hypervisor | |</pre>
    <pre> | +------------+  |                 |  +------------+ |</pre>
    <pre> |    /       \\    |                 |    /       \\    |</pre>
    <pre> |   /         \\   |                 |   /         \\   |</pre>
    <pre> | +---+     +---+ |                 | +---+     +---+ |</pre>
    <pre> | |VM1|     |VM2| |                 | |VM3|     |VM4| |</pre>
    <pre> | +---+     +---+ |                 | +---+     +---+ |</pre>
    <pre> +-----------------+                 +-----------------+</pre>
    <pre class=\"pink\">         |                                     |        </pre>
    <pre class=\"pink\">         +-------------+          +------------+        </pre>
    <pre class=\"pink\">                       |          |                     </pre>
    <pre class=\"pink\">                    +------------------+                </pre>
    <pre class=\"pink\">                    |     Network      |                </pre>
    <pre class=\"pink\">                    +------------------+                 </pre>
</div>
"
custom_html_excerpt: "
<p>
    In this document, we explore the nuances of live migration of virtual machines (VMs) in environments lacking shared storage, focusing on optimizing the `size.state` parameter in LXD. By introducing a conceptual shared volume, termed Ω, we investigate methods for refining partition functions and throttle rates to enhance migration efficiency and resource utilization. This study aims to automate parameter adjustments, reducing the need for manual intervention and thereby improving the user experience in live VM migrations. Our approach integrates advancements in QEMU mirroring with LXD management techniques to offer a streamlined migration process.
</p>
"
---

<iframe src="https://gabrielmougard.github.io/assets/pdf/2024-02-11-improving-vm-live-migration-in-lxd/output.pdf" width="100%" height="800" allow="autoplay"></iframe>
