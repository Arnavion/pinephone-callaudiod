A replacement for [callaudiod](https://gitlab.com/mobian1/callaudiod) for the Pine64 PinePhone device.

Pulseaudio v17 and Pipewire v1.2 changed the way audio profiles are generated, which upstream callaudiod (as of v0.1.10) does not handle well. This replacement does, and is also simpler to hack upon by virtue of having a much simpler state machine and much less code in general.

"Replacement" means that this script can be used in the place of callaudiod's `callaudiod` binary but provides the same D-Bus API, so that other applications that talk to callaudiod directly over D-Bus or via `libcallaudiod` will work without modification.


# Installation

The necessary files are:

- `pinephone-callaudiod` - the service script itself.

- `org.mobian_project.CallAudio.service` - the D-Bus unit file that tells D-Bus to autostart the service when a client tries to talk to it.

- `org.mobian_project.CallAudio.xml` - the D-Bus interface definition.

- `callaudiocli` - the equivalent of the `callaudiocli` binary provided by upstream callaudiod. The upstream binary can also be used instead.

`make install` will install these to `/usr/local/libexec/pinephone-callaudiod/`, `/usr/local/share/dbus-1/services/`, `/usr/local/share/dbus-1/interfaces/` and `/usr/local/bin/` respectively. The paths are controlled by setting `DESTDIR`, `prefix`, `bindir`, `datadir` and `libexecdir` in the `make install` invocation.


# License

AGPL-3.0-only

```
pinephone-callaudiod

https://github.com/Arnavion/pinephone-callaudiod

Copyright 2024 Arnav Singh

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, version 3 of the
License.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```

The `org.mobian_project.CallAudio.service` and `org.mobian_project.CallAudio.xml` files are copied from [upstream callaudiod](https://gitlab.com/mobian1/callaudiod) which uses the GPL-3.0-or-later license.
