prefix = /usr/local
datadir = $(prefix)/share
libexecdir = $(prefix)/libexec

org.mobian_project.CallAudio.service: org.mobian_project.CallAudio.service.in
	<org.mobian_project.CallAudio.service.in sed -e 's|@libexecdir@|$(libexecdir)|g' >org.mobian_project.CallAudio.service

.PHONY: install
install: org.mobian_project.CallAudio.service
	install -Dm0755 pinephone-callaudiod $(DESTDIR)$(libexecdir)/pinephone-callaudiod/pinephone-callaudiod

	install -Dm0755 org.mobian_project.CallAudio.service $(DESTDIR)$(datadir)/dbus-1/services/org.mobian_project.CallAudio.service

	install -Dm0755 org.mobian_project.CallAudio.xml $(DESTDIR)$(datadir)/dbus-1/interfaces/org.mobian_project.CallAudio.xml
