---
title: Bytes, opcodes, and the macarena... Understanding Your CPU's simple dance moves, part 1
author: gabrielmougard
date: 2023-09-02 22:38:00 +0800
categories: [Hardware, CPU]
tags: [hardware]
pin: true
hidden: false
ascii_illustration: "
<div class=\"diagram\">                                                                                         
    <pre  class=\"blue\">                             ####                                             </pre>                  
    <pre  class=\"blue\">                            ##  ##                                            </pre>                  
    <pre  class=\"blue\">                             ###/          #                                  </pre>                  
    <pre  class=\"blue\">                              #(    (#     #                                  </pre>                  
    <pre  class=\"blue\">                              #(    (#     #   #####                          </pre>                  
    <pre  class=\"blue\">                        #.    #(    (#     #  ##  ##                          </pre>                  
    <pre  class=\"blue\">                        #.    #(    ,#     #    *#                            </pre>                  
    <pre  class=\"blue\">                        #.    #(    (#     #     #                            </pre>                  
    <pre  class=\"blue\">                                                                              </pre>                  
    <pre  class=\"blue\">                    ##################################                        </pre>                  
    <pre  class=\"blue\">   ##              ##                                ##                ##     </pre>                  
    <pre  class=\"blue\"> ##  ###########   ##                           #.*  ##   #############  (*   </pre>                  
    <pre  class=\"blue\">  ####             ##       ............ .....       ##               ####    </pre>                  
    <pre  class=\"blue\">                   ##      #                  #      ##                       </pre>                  
    <pre  class=\"blue\">                   ##      #                  #      ##                       </pre>                  
    <pre  class=\"blue\">      ###          ##      #                  #      ##                       </pre>                  
    <pre  class=\"blue\">     ##  #######   ##      #                  #      ##   #####(*############ </pre>                  
    <pre  class=\"blue\">      ####         ##      #                  #      ##                       </pre>                  
    <pre  class=\"blue\">                   ##      #                  #      ##        ######         </pre>                  
    <pre  class=\"blue\">                   ##      #                  #      ##        ##%###         </pre>                  
    <pre  class=\"blue\">                   ##      .##################/      ##                       </pre>                  
    <pre  class=\"blue\">      ##########   ##                                ##   #############.      </pre>                  
    <pre  class=\"blue\">                   ##                                ##                       </pre>                  
    <pre  class=\"blue\">                    ##################################,                       </pre>                  
    <pre  class=\"blue\">                                                                              </pre>                  
    <pre  class=\"blue\">                        #.    #(    (#     #     #                            </pre>                  
    <pre  class=\"blue\">                        #.    #(    /#     #     #                            </pre>                  
    <pre  class=\"blue\">                        #.   ###(   (#     #     #                            </pre>                  
    <pre  class=\"blue\">                        #.  ##  ##  (#     #     #                            </pre>                  
    <pre  class=\"blue\">                        #.   ####   (#  ###(##                                </pre>                  
    <pre  class=\"blue\">                        #.          (#  ######                                </pre>                  
    <pre  class=\"blue\">                                    (#                                        </pre>                  
    <pre  class=\"blue\">                                    ##                                        </pre>
</div>
"
custom_html_excerpt: "
<p>
    Ever wondered what goes on inside your computer's brain when you double-click that program icon? No, it's not magic or computer elves doing the heavy lifting. My dear Watson, we are about to dive into the rabbit hole that makes Alice's Wonderland look like a sandbox! Welcome to the curious world of CPU instructions, syscalls, and the wizardry that makes your computer tick—or should I say, click? After weeks of sifting through the academic fluff, murky forums, and cryptic tech papers, I've emerged like a code-warrior with dozens of pages of notes. I’ve pieced together what happens from the moment your finger hits the mouse to when the screen finally bows to your command. So, let’s talk shop and unravel this high-tech yarn together, shall we?
</p>
"
---

## Unmasking the CPU: It's not rocket science, it's binary hopscotch!

Alright, sit tight and fasten your mental seatbelts! Ever looked at your computer and thought it must be running on unicorn tears and starlight? Well, spoiler alert: it’s not. The shocking reality is that your computer is more of a 'what you see is what you get' kind of machine. Seriously, we’ve all been overthinking it! The CPU, the almighty control freak of your computer—the shazam alakablam, the big cheese—strips away all the fluff and operates on what are basically the digital equivalent of Morse code: binary instructions!

The CPU's lineage traces back to a 'less is more' icon, the Intel 4004, birthed in the late '60s by an Italian physicist, Federico Faggin. Imagine it: a 4-bit system as uncomplicated as grandma's meatloaf recipe! While our modern CPUs are a bit fancier, they’ve inherited a lot of that good ol’ simplicity. Machine code, the CPU's native tongue, is a conga line of these binary instructions, as straightforward as a series of high-fives.

The 'orders' that CPUs follow aren't complex algorithms or arcane spells. Think of it as a two-step dance: first comes a byte (or maybe two) that declares, 'Hey, we're doing the Macarena!' (that's your opcode), followed by the actual dance moves your CPU needs to shake its silicon groove thing (the essential data). This sequence of 'dance instructions' is what we fondly dub as machine code. And because not all of us are fluent in Binary-ese, there’s assembly language—a user-friendly shorthand that translates our human awkwardness into CPU charisma. Rest assured, it eventually gets turned back into the CPU's native tongue of 1s and 0s.

[work in progress...]