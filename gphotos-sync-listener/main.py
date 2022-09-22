import logging
import asyncio, socket

from gphotos_sync.Main import GooglePhotosSyncMain

logging.basicConfig(level=logging.INFO)

my_task = None

async def some_long_running_task():
    print("start")
    logging.info("Starting gphotos-sync task")
    GooglePhotosSyncMain().main(["/storage"])

async def handle_client(reader, writer):
    global my_task
    request = (await reader.read(-1)).decode('utf8')
    logging.info(f"Got the request {request}")
    if request == "sync":
        if my_task is not None and not my_task.done():
            logging.info(f"Task still running.")
            response = b'\x02'
        else:
            logging.info(f"Starting task.")
            response = b'\x00'
            my_task = asyncio.create_task(some_long_running_task())
    else:
        logging.info(f"Unknown command.")
        response = b'\x01'
    writer.write(response)
    await writer.drain()
    writer.close()

async def run_server():
    server = await asyncio.start_server(handle_client, 'localhost', 15555)
    async with server:
        await server.serve_forever()

asyncio.run(run_server())

