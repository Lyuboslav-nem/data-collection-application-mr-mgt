# Low-Poly vs Realistic Art Style in Mixed Reality Gaming

Mixed reality defense game prototypes developed for the Master's thesis
**"Does Geometric Simplification Reduce Presence? A Between-Subjects Comparison
of Low-Poly and Realistic Art Styles in Mixed Reality Gaming"**
by Lyuboslav Stefanov Nemtsov, Breda University of Applied Sciences, 2026.

## Overview

This repository contains the two experimental Meta Quest 3 application builds
used in the study, along with supporting documentation. Both builds implement
an identical five-minute mixed reality defense game — participants defend a
virtual treasure chest from incoming enemies using weapons acquired from
spawning stations — and differ only in the visual fidelity of their 3D assets.

- **Low-poly build** — deliberately simplified geometry with reduced polygon
  counts and visible faceted surfaces.
- **Realistic build** — higher-polygon geometry with detailed textures,
  rendered within the computational constraints of the Meta Quest 3.

All gameplay mechanics, spawn logic, difficulty progression, and environmental
layout are identical across conditions. The two builds were used in a
between-subjects experiment (N = 30) measuring presence via the Witmer-Singer
Presence Questionnaire (UQO revised version).

## Repository Contents
README.md
/builds/
LowPoly_Build.apk        Android Package for the low-poly condition
Realistic_Build.apk      Android Package for the realistic condition

## Requirements

- Meta Quest 3 or Meta Quest 3S
- Developer Mode enabled on the headset
  ([instructions from Meta](https://developer.oculus.com/documentation/native/android/mobile-device-setup/))
- A PC with the following tool installed:
  [Meta Quest Developer Hub (MQDH)](https://developer.oculus.com/meta-quest-developer-hub/)
- USB-C cable to connect the headset to the PC
- Approximately 3m × 3m of clear physical play space

## Initial Setup (In-Headset)

When the application first launches, the virtual game objects (treasure chest,
weapon stations, spawn points) will appear in default positions that may not
match your physical play space. Before starting gameplay:

1. **Reposition game objects** by holding the **Meta button** (the oval button
   with the Meta logo on the right controller) while physically moving the
   controller. This lets you translate and anchor the virtual objects to match
   your real-world play area.
2. **Survey your surroundings** and confirm that all spawn points are
   accessible and that you have clear movement space in all directions.
3. **Begin gameplay** by walking to any weapon station and grabbing a weapon
   using the controller trigger. The game starts only once the first weapon
   has been picked up — this allows you to acclimate to the mixed reality
   environment at your own pace before enemies begin spawning.

## Credits

- **Thesis author and lead designer:** Lyuboslav Stefanov Nemtsov
- **Programming collaborator:** Daniel Smuļko
  (core gameplay systems — weapon spawning, enemy behaviour, destruction
  systems, win/lose condition logic)
- **Supervisor:** Linda Effinger, MSc, Breda University of Applied Sciences
- **Second supervisor:** Lindsey Bouwels
- **Testing environment:** BUas Experience Lab

3D assets were sourced from publicly available asset libraries licensed for
non-commercial educational and research use. Full asset attribution is
documented in the thesis.

## Licence

The application code in this repository is made available for
**non-commercial academic use only**. Redistribution, modification for
commercial purposes, or incorporation into commercial products is not
permitted without written permission from the author.

Third-party assets bundled into the APK builds are subject to their original
licences as documented in the thesis appendix. Users installing these builds
agree to use them solely for research, educational, or personal evaluation
purposes.

Built with the [Unity Engine](https://unity.com/) (version 6000.3.0f1) using
Meta's [OpenXR SDK](https://developer.oculus.com/documentation/unity/unity-gs-overview/)
and [XR Interaction Toolkit](https://docs.unity3d.com/Packages/com.unity.xr.interaction.toolkit@latest).

## Contact

For questions about the study, access to raw data, or replication inquiries,
please contact the author via the thesis institution (Breda University of
Applied Sciences, Academy for AI, Games and Media).
