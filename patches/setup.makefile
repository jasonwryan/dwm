diff -r c794a9f5ae5e Makefile
--- a/Makefile	Sun Jul 08 09:45:53 2012 +0200
+++ b/Makefile	Sun Jul 22 19:35:07 2012 +1200
@@ -20,7 +20,7 @@
 
 ${OBJ}: config.h config.mk
 
-config.h:
+config.h: config.def.h
 	@echo creating $@ from config.def.h
 	@cp config.def.h $@
 
diff -r c794a9f5ae5e config.mk
--- a/config.mk	Sun Jul 08 09:45:53 2012 +0200
+++ b/config.mk	Sun Jul 22 19:35:07 2012 +1200
@@ -4,11 +4,11 @@
 # Customize below to fit your system
 
 # paths
-PREFIX = /usr/local
+PREFIX = /usr
 MANPREFIX = ${PREFIX}/share/man
 
-X11INC = /usr/X11R6/include
-X11LIB = /usr/X11R6/lib
+X11INC=/usr/include/X11 
+X11LIB=/usr/lib/X11
 
 # Xinerama, comment if you don't want it
 XINERAMALIBS  = -lXinerama
@@ -19,7 +19,7 @@
 LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS}
 
 # flags
-CPPFLAGS = -D_BSD_SOURCE -D_POSIX_C_SOURCE=2 -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
+CPPFLAGS += -D_BSD_SOURCE -D_POSIX_C_SOURCE=2 -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
 #CFLAGS   = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
 CFLAGS   = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
 LDFLAGS  = -s ${LIBS}
