#!/bin/sh
TORRENT_ID=$1
TORRENT_NAME=$2
TORRENT_PATH=$3

filebot -script fn:amc \
--output "/data/media" \
--log-file amc.log \
--action hardlink \
--conflict override -non-strict \
--def music=y artwork=y "ut_dir=$TORRENT_PATH/$TORRENT_NAME" "ut_kind=multi" "ut_title=$TORRENT_NAME"
