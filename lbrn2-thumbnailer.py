#!/usr/bin/python3
# -*- coding: utf-8 -*-

import base64
import xml.etree.ElementTree as ET
import argparse
import sys

# set parser parameters
parser = argparse.ArgumentParser(description='Extract the thubnail from LightBurn files')
parser.add_argument('-i', '--input', type=str, metavar='PATH TO FILE',
                    help='input file to extract thumbnail')
parser.add_argument('-o', '--output', type=str, metavar='PATH TO FILE',
                    help='ouput file to save a jpeg')


# get arguments parameters
args = parser.parse_args()


def check_args():
    # if not any parameters, exit
    if args.input is None:
        print("No se proporciono el archido de entrada")
        sys.exit(1)
    if args.output is None:
        print("No se proporciono el archido de salida")
        sys.exit(1)


def create_thumbnail():
    tree = ET.parse(args.input)
    root = tree.getroot()

    # get image from tag Thumbnail
    raw_image = tree.find('Thumbnail').get('Source')

    # decode and save thumbnail
    decodeit = open(args.output, 'wb')
    decodeit.write(base64.b64decode((raw_image)))
    decodeit.close()
    
    
check_args()
create_thumbnail()

sys.exit(0)

