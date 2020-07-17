#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Program description goes here."""
import argparse
import sys
from typing import List, Union

__version__ = '0.1.0'


def main(argv: List[str]) -> Union[None, int, str]:
    parser = argparse.ArgumentParser(description=__doc__)

    parser.add_argument(
        '-v', '--version', action='version', version=f'v{__version__}'
    )

    args = parser.parse_args(argv)


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
