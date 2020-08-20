#!/usr/bin/env python
# -*- coding: utf-8 -*-
import asyncio


async def main(loop: asyncio.AbstractEventLoop) -> None:
    pass


if __name__ == '__main__':
    loop = asyncio.get_event_loop()
    try:
        loop.run_until_complete(main(loop))
    finally:
        loop.close()
