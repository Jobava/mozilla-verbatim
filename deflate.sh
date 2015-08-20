#!/bin/bash
for f in *.zip; do unzip "$f" -d "${f%.*}"; done

