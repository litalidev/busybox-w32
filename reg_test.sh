#!/bin/sh



rm -rf testdir
./busybox cp tar.c testdir

if ! eval diff -u tar.c testdir ; then
    echo " "
    echo "Bummer.  File copy failed."
    exit 0
else
    echo "Cool.  File copy is ok."
fi
echo " "

rm -rf testdir
mkdir -p testdir/foo
./busybox cp tar.c testdir/foo

if ! eval diff -u tar.c testdir/foo/tar.c ; then
    echo " "
    echo "Bummer.  File copy to a directory failed."
    exit 0
else
    echo "Cool.  File copy to a directory is ok."
fi
echo " "


rm -rf testdir
mkdir -p testdir/foo
./busybox cp tar.c testdir/foo/

if ! eval diff -u tar.c testdir/foo/tar.c ; then
    echo " "
    echo "Bummer.  File copy to a directory w/ a '/' failed."
    exit 0
else
    echo "Cool.  File copy to a directory w/ a '/' is ok."
fi
echo " "


rm -rf testdir X11
cp -a /etc/X11 .
./busybox cp -a X11 testdir

if ! eval diff -ur X11 testdir ; then
    echo " "
    echo "Bummer.  Local dir copy failed."
    exit 0
else
    echo "Cool.  Local dir copy is ok."
fi
echo " "

rm -rf testdir X11
cp -a /etc/X11 .
./busybox cp -a X11 testdir/

if ! eval diff -ur X11 testdir ; then
    echo " "
    echo "Bummer.  Local dir copy w/ a '/' failed."
    exit 0
else
    echo "Cool.  Local dir copy w/ a '/' is ok."
fi
echo " "

rm -rf testdir X11
cp -a /etc/X11 .
./busybox cp -a X11/ testdir

if ! eval diff -ur X11 testdir ; then
    echo " "
    echo "Bummer.  Local dir copy w/ a src '/' failed."
    exit 0
else
    echo "Cool.  Local dir copy w/ a src '/' is ok."
fi
echo " "

rm -rf testdir X11
cp -a /etc/X11 .
./busybox cp -a X11/ testdir/

if ! eval diff -ur X11 testdir ; then
    echo " "
    echo "Bummer.  Local dir copy w/ 2x '/'s failed."
    exit 0
else
    echo "Cool.  Local dir copy w/ 2x '/'s is ok."
fi
echo " "

rm -rf testdir X11
./busybox cp -a /etc/X11 testdir
if ! eval diff -ur /etc/X11 testdir ; then
    echo " "
    echo "Bummer.  Remote dir copy failed."
    exit 0
else
    echo "Cool.  Remote dir copy is ok."
fi
echo " "


rm -rf testdir X11
mkdir -p testdir/foo

./busybox cp -a /etc/X11 testdir/foo
if ! eval diff -ur /etc/X11 testdir/foo ; then
    echo " "
    echo "Bummer.  Remote dir copy to a directory failed."
    exit 0
else
    echo "Cool.  Remote dir copy to a directory is ok."
fi
echo " "


rm -rf testdir X11
mkdir -p testdir/foo

./busybox cp -a /etc/X11 testdir/foo/
if ! eval diff -ur /etc/X11 testdir/foo ; then
    echo " "
    echo "Bummer.  Remote dir copy to a directory w/ a '/' failed."
    exit 0
else
    echo "Cool.  Remote dir copy to a directory w/ a '/' is ok."
fi

rm -rf testdir

