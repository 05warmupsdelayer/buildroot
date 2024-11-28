#!/bin/sh
BOARD_DIR="$(dirname $0)"

cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
cp $BOARD_DIR/*.bmp.gz $BINARIES_DIR/
