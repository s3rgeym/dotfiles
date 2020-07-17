#!/usr/bin/env python
import argparse
import sys
from typing import List, Union


def main(argv: List[str]) -> Union[None, int, str]:
    parser = argparse.ArgumentParser()
    ...
    args = parser.parse_args(argv)
    ...


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
