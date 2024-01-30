# openwebrx-rtl-sdr-blog

Easily run OpenWebRx+ with the RTL-SDR Blog driver in Docker!

## What does that mean?

- [OpenWebRx+](https://fms.komkon.org/OWRX/) is a web-based SDR radio. If you have compatible SDR hardware, you can use
  OpenWebRx+ to receive many types of transmissions. Because it's web-based, it can be operated remotely.
- [RTL-SDR Blog](https://www.rtl-sdr.com/buy-rtl-sdr-dvb-t-dongles/) is a specific brand
  of [RTL-SDR](https://www.rtl-sdr.com/about-rtl-sdr/) dongle.
- [Docker](https://www.docker.com/) is a popular tool for running software
  in [containers](https://www.docker.com/resources/what-container/).

## Why does this project exist?

I want a convenient way to run the latest version OpenWebRx+ with all the features enabled. To get all the features with
a normal installation, I would also have to install several other programs, some of which have to be built from source.
That means there are *a lot of manual steps* and *no automatic upgrades*. There are also potential compatibility issues
to deal with, either now or after future upgrades. Sure, I could do it that way, but it's not ideal.

I'd rather run OpenWebRx+ in a container that provides a clean, consistent, and correct environment for it.
Conveniently, the nice people behind OpenWebRx+ provide up-to-date images with all the features fully functional!
There's just one problem. I'm using an RTL-SDR Blog V4, which isn't compatible with the RTL-SDR driver in their images.

My solution was to create this project. It automates the process of downloading the OpenWebRx+ image and the RTL-SDR
Blog V4 driver, creating a new image containing both, and running the new image in a container. Easy!

## Prerequisites

- Operating system:
    - It will likely work with any modern Linux-like OS.
    - Not sure about Mac or Windows, but maybe?  It seems that people have trouble giving Docker containers access to USB
      devices on [Mac](https://github.com/docker/roadmap/issues/511) and [Windows](https://forums.docker.com/t/usb-ip-on-docker-desktop-wsl2-backend/135921)
      machines.  That may change in the future.
    - I'm using Ubuntu 22.04, and it works for me.
- [Docker Desktop](https://docs.docker.com/get-docker/) or a compatible equivalent.

## Usage

1. Download this project's code. You can
   use [git clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository),
   or [download a .zip file](https://docs.github.com/en/repositories/working-with-files/using-files/downloading-source-code-archives)
   and unzip it.
2. `cd` to the directory containing the code.
3. Run `./start.sh`. This might take a while the first time (or when a new version of OpenWebRx+ has been released)
   because it will download and build stuff.
4. (Optional) If you didn't already create an admin user, now would be a good time. Run `./create_admin_user.sh` and
   provide the new admin user's password when asked for it.

That's all there is to getting up and running!  Docker will create subdirectories named `etc` and `settings` for the
OpenWebRx+ settings.  It will also create a `tmp` directory for temporary files so received data won't be lost when
you restart openwebrx.

To stop OpenWebRx+, run `./stop.sh`.

## Image Distribution

OpenWebRx+ uses the [AGPL-3.0 license](https://github.com/luarvique/openwebrx/blob/master/LICENSE.txt), and the RTL-SDR
Blog driver uses the [GPL-2.0 license](https://github.com/rtlsdrblog/rtl-sdr-blog?tab=readme-ov-file#GPL-2.0-1-ov-file).
Sadly, these license are incompatible with each other. I'm not a lawyer, but I believe an image containing both could
reasonably be seen as a single program. After all, it would behave as a single program from a typical user's
perspective. The image would therefore have to use both licenses at the same time, which isn't possible. You can use the
images you create using this project, but you shouldn't share them.

In summary, **do not distribute the Docker images created by this project!**
