#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""My prog."""
import argparse
import logging
import sys
from typing import List, Optional

__version__ = '0.1.0'
__author__ = 'Sergey M'
__email__ = 'yamldeveloper@proton.me'
__copyright__ = 'Copyright 2020, Sergey M'
__credits__ = ['Sergey M']
__license__ = 'MIT'
__maintainer__ = 'Sergey M'


def parse_args(argv: Optional[List[str]] = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.ArgumentDefaultsHelpFormatter,
    )
    parser.add_argument(
        '-v',
        '--verbosity',
        action='count',
        default=0,
        help='increase output verbosity: 0 - warning, 1 - info, 2 - debug',
    )
    parser.add_argument(
        '--version', action='version', version=f'v{__version__}'
    )
    parser.set_defaults(func=run)
    return parser.parse_args(argv)


def run(args: argparse.Namespace) -> Optional[int]:
    pass


def main(argv: Optional[List[str]] = None) -> Optional[int]:
    args: argparse.Namespace = parse_args(argv)
    levels: List[int] = [logging.WARNING, logging.INFO, logging.DEBUG]
    log_level: int = levels[min(args.verbosity, len(levels) - 1)]
    logging.basicConfig(level=log_level, stream=sys.stderr)
    try:
        return args.func(args)
    except KeyboardInterrupt:
        logging.info('interrupted')
    except Exception as e:
        logging.critical(e, exc_info=True)
    finally:
        logging.shutdown()


if __name__ == '__main__':
    sys.exit(main())
